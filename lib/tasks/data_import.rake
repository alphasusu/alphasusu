require 'csv'
require 'nokogiri'
require 'rss'

namespace "import" do
  desc "Users"
  task :users => :environment do
    @users = {}
    def create_user(key, details)
      user = LocalUser.find_or_create_by(email: details[:email])
      user.first_name = details[:name].split(' ').first
      user.last_name = details[:name].split(' ').last
      user.password = details[:password]
      user.password_confirmation = details[:password]
      user.avatar = details[:avatar]
      user.skip_confirmation!
      if !details[:admin].nil? and details[:admin]
        user.elevated = true
      end
      user.save! :validate => false
      @users[key] = user
    end

    {
      dan: {
        name: "Dan Palmer",
        email: "dan@example.com",
        password: "password1",
        admin: true,
      },
      elliot: {
        name: "Elliot Hughes",
        email: "elliot@example.com",
        password: "password1",
        admin: true,
      },
      president: {
        name: "David Gilani",
        email: "pres@susu.org",
        password: "president",
        avatar: File.open('resources/sabbs/david-gilani.png'),
      },
      sports: {
        name: "Evan Whyte",
        email: "sports@susu.org",
        password: "sports",
        avatar: File.open('resources/sabbs/evan-whyte.png'),
      },
      democracy: {
        name: "David Martin",
        email: "democracy@susu.org",
        password: "democracy",
        avatar: File.open('resources/sabbs/david-martin.png'),
      },
      education: {
        name: "David Mendoza-Wolfson",
        email: "education@susu.org",
        password: "education",
        avatar: File.open('resources/sabbs/david-mendoza-wolfson.png'),
      },
      welfare: {
        name: "Beckie Thomas",
        email: "welfare@susu.org",
        password: "welfare",
        avatar: File.open('resources/sabbs/beckie-thomas.png'),
      },
      engagement: {
        name: "Claire Gilbert",
        email: "engagement@susu.org",
        password: "engagement",
        avatar: File.open('resources/sabbs/claire-gilbert.png'),
      },
      communities: {
        name: "Oli Coles",
        email: "communities@susu.org",
        password: "communities",
        avatar: File.open('resources/sabbs/oli-coles.png'),
      }
    }.map {|key,details| create_user(key, details)}
  end

  desc "Import SUSU Blog Posts"
  task :blog_posts => :environment do
    
    BlogPost.destroy_all
    sabb_blog = 'http://blogs.susu.org/sabbs/feed/'
    
    open(sabb_blog) do |rss|
      feed = RSS::Parser.parse(rss)
      
      feed.items.each do |item|
        blog_post = BlogPost.new
        blog_post.title = item.title
        blog_body = Nokogiri::HTML(item.content_encoded)
        blog_post.body = blog_body.text
        blog_post.author = User.where(first_name: item.dc_creator.split[0],
                                      last_name: item.dc_creator.split[1]).first
        blog_post.save
      end
    end
  end

  desc "Import SUSU Events"
  task :events => :environment do
    Event.destroy_all
    whats_on = 'http://www.susu.org/feeds/whatson.xml'

    open(whats_on) do |rss|
      feed = RSS::Parser.parse(rss)
      
      feed.items.each do |item|
        event = Event.new
        title_split = item.title.split(/((?:Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday), [0-9]{1,2}(?:st|nd|th|rd) (?:January|February|March|April|May|June|July|August|September|October|November|December) [0-9]{4} - [0-9]{1,2}:[0-9]{2}(?:a|p)m)(?: )(.+ )(?:(?:in|at) )(.*)/)
        if title_split[1] and title_split[2]
          event.title = title_split[2]
          event.date = DateTime.parse(title_split[1])
          event.place = Place.find_or_create_by(:name => title_split[3])
        else
          puts "Malformed " + item.title
          puts title_split[1]
        end
        event.description = Nokogiri::HTML(item.description).text
        event.save
      end
    end
  end

  desc "Import Course Reps"
  task :course_reps => :environment do

    CourseRepresentative.destroy_all


    CSV.foreach(Rails.root.join('data', 'faculty_academic_officers.csv')) do |row|
      if row[3] == "Faculty Officer"
        faculty = Faculty.find_or_create_by(name: row[4])
        if row[7].blank?
          next
        end
        user = User.find_or_create_by(email: row[7].split("@")[0])
        user.type = "LdapUser"
        user.save
        
        FacultyOfficer.create(user: user, faculty: faculty)
      elsif row[3] == "Academic President"
        academic_unit = AcademicUnit.find_or_create_by(name: row[4])
        faculty = Faculty.find_or_create_by(name: row[5])
        academic_unit.faculty = faculty
        academic_unit.save
        if row[7].blank?
          next
        end
        user = User.find_or_create_by(email: row[7].split("@")[0])
        user.type = "LdapUser"
        user.save
        
        AcademicPresident.create(user: user, academic_unit: academic_unit)
      else
        next
      end
    end
    
    CSV.foreach(Rails.root.join('data', 'course_reps.csv'), headers: true) do |row|
      if !row[3].blank?
        user = User.find_or_create_by(email: row[3].split("@")[0])
        user.first_name = row[2].split(' ', 2)[0]
        user.last_name = row[2].split(' ', 2)[1]
        user.type = "LdapUser"
        user.save
        
        academic_unit = AcademicUnit.find_or_create_by(name: row[10])
        course = Course.find_or_create_by(name: row[1])
        course.academic_unit = academic_unit
        course.save
        courserep = CourseRepresentative.create(user: user, year: row[5], course: course)
      else
        course = Course.find_or_create_by(name: row[1])
      end
    end
  end
end
