require 'csv'
require 'nokogiri'
require 'rss'
require 'json'
require 'tempfile'
require 'uri'
require 'net/http'

namespace "import" do
  desc "All" 
  task :all => [
    :users,
    :blog_posts,
    :events,
    :groups,
    :course_reps,
  ]

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
        avatar: File.open("#{Rails.root}/resources/sabbs/david-gilani.png"),
      },
      sports: {
        name: "Evan Whyte",
        email: "sports@susu.org",
        password: "sports",
        avatar: File.open("#{Rails.root}/resources/sabbs/evan-whyte.png"),
      },
      democracy: {
        name: "David Martin",
        email: "democracy@susu.org",
        password: "democracy",
        avatar: File.open("#{Rails.root}/resources/sabbs/david-martin.png"),
      },
      education: {
        name: "David Mendoza-Wolfson",
        email: "education@susu.org",
        password: "education",
        avatar: File.open("#{Rails.root}/resources/sabbs/david-mendoza-wolfson.png"),
      },
      welfare: {
        name: "Beckie Thomas",
        email: "welfare@susu.org",
        password: "welfare",
        avatar: File.open("#{Rails.root}/resources/sabbs/beckie-thomas.png"),
      },
      engagement: {
        name: "Claire Gilbert",
        email: "engagement@susu.org",
        password: "engagement",
        avatar: File.open("#{Rails.root}/resources/sabbs/claire-gilbert.png"),
      },
      communities: {
        name: "Oli Coles",
        email: "communities@susu.org",
        password: "communities",
        avatar: File.open("#{Rails.root}/resources/sabbs/oli-coles.png"),
      }
    }.map {|key,details| create_user(key, details)}

    SupportTeam.destroy_all

    support_sabbs = SupportTeam.create({ :name => "Sabbs",
                                         :description => "Talk to the Sabbs about how the union is run.",
                                         :logo => File.open('resources/support_logos/sabbs.png')})
    support_susu = SupportTeam.create({ :name => "SUSU Support",
                                        :description => "Get help from SUSU staff members who can answer your questions about the union.",
                                        :logo => File.open('resources/support_logos/susu_support.png')})
    support_nightline = SupportTeam.create({ :name => "Nightline",
                                             :description => "Get support from a fellow student, anonymously and confidentially.",
                                             :logo => File.open('resources/support_logos/nightline.png')})
    support_course_reps = SupportTeam.create({ :name => "Course Reps",
                                               :description => "Talk to someone about issues on your course, or in your department.",
                                               :logo => File.open('resources/support_logos/course_reps.png')})
    
    @users[:dan].support_teams << support_course_reps
    @users[:dan].support_teams << support_susu
    @users[:dan].save!
    
    @users[:president].support_teams << support_sabbs
    @users[:president].save!

    @users[:elliot].support_teams << support_course_reps
    @users[:elliot].support_teams << support_susu
    @users[:elliot].save!

    Officer.destroy_all
    president = Officer.create(
                               :title => "Union President",
                               :user => @users[:president])
    vp_education = Officer.create(
                                  :title => "Vice-President Education",
                                  :user => @users[:education])
    vp_engagement = Officer.create(
                                   :title => "Vice-President Engagement",
                                   :user => @users[:engagement])
    vp_sports = Officer.create(
                               :title => "Vice-President Sports Development",
                               :user => @users[:sports])
    vp_welfare = Officer.create(
                                :title => "Vice-President Welfare",
                                :user => @users[:welfare])
    vp_community = Officer.create(
                                  :title => "Vice-President Student Communities",
                                  :user => @users[:communities])
    vp_democracy = Officer.create(
                                  :title => "Vice-President Democracy & Creative Industries",
                                  :user => @users[:democracy])
    
    Zone.destroy_all
    trustee = Zone.create(:name => "Trustee",
                          :officer => president)
    democracy = Zone.create(:name => "Democracy",
                            :officer => vp_democracy)
    sustainability = Zone.create(:name => "Sustainability",
                                 :officer => vp_welfare)
    communities = Zone.create(:name => "Student Communities",
                              :officer => vp_community)
    creative = Zone.create(:name => "Creative Industries",
                           :officer => vp_democracy)
    education = Zone.create(:name => "Education",
                            :officer => vp_education)
    external = Zone.create(:name => "External Engagement",
                           :officer => vp_engagement)
    sports = Zone.create(:name => "Sports Development",
                         :officer => vp_sports)
    life = Zone.create(:name => "Student Life",
                       :officer => vp_welfare)

    Subcommittee.destroy_all
    
    Subcommittee.create(:name => "CMT Subcommittee",
                        :zone => trustee)
    Subcommittee.create(:name => "Commercial Subcommittee",
                        :zone => trustee)
    Subcommittee.create(:name => "Finance Subcommittee",
                        :zone => trustee)
    Subcommittee.create(:name => "Staffing Subcommittee",
                        :zone => trustee)
    
    Subcommittee.create(:name => "Democracy Zone",
                        :zone => democracy)
    Subcommittee.create(:name => "Union Council",
                        :zone => democracy)
    Subcommittee.create(:name => "Student Groups Committee",
                        :zone => democracy)
    
    Subcommittee.create(:name => "Sustainability Zone",
                        :zone => sustainability)
    Subcommittee.create(:name => "Equality and Diversity Forum",
                        :zone => sustainability)
    Subcommittee.create(:name => "Ethical and Environmental Committee",
                        :zone => sustainability)
    
    Subcommittee.create(:name => "Student Communities Zone",
                        :zone => communities)
    Subcommittee.create(:name => "International Committee",
                        :zone => communities)
    Subcommittee.create(:name => "JCR Committee",
                        :zone => communities)
    
    Subcommittee.create(:name => "Creative Industries Zone",
                        :zone => creative)
    Subcommittee.create(:name => "Media Committee",
                        :zone => creative)
    Subcommittee.create(:name => "Performing Arts",
                        :zone => creative)
    
    Subcommittee.create(:name => "Education Zone",
                        :zone => education)
    
    Subcommittee.create(:name => "External Engagement Zone",
                        :zone => external)
    Subcommittee.create(:name => "Enterprise",
                        :zone => external)
    Subcommittee.create(:name => "RAG",
                        :zone => external)

    Subcommittee.create(:name => "Sports Development Zone",
                        :zone => sports)
    Subcommittee.create(:name => "Athletic Union Committee",
                        :zone => sports)
    Subcommittee.create(:name => "Intramural Committee",
                        :zone => sports)
    
    Subcommittee.create(:name => "Student Life Zone",
                        :zone => life)
    Subcommittee.create(:name => "Wellbeing Committee",
                        :zone => life)
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


    CSV.parse(Base64.decode64(Octokit.contents("alphasusu/data", :path => "faculty_academic_officers.csv").content)) do |row|
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
    
    CSV.parse(Base64.decode64(Octokit.contents("alphasusu/data", :path => "course_reps.csv").content), headers: true) do |row|
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

  desc "Create Student Groups"
  task :groups => :environment do
    puts "== Import Student Groups ======================================================"
    puts "-- creating kinds"

    society = StudentGroupKind.find_or_create_by(name: "Society")
    sport = StudentGroupKind.find_or_create_by(name: "Sport")
    media = StudentGroupKind.find_or_create_by(name: "Media")
    performing_art = StudentGroupKind.find_or_create_by(name: "Performing Art")

    puts "-- import groups"
    json = Base64.decode64(Octokit.contents("alphasusu/data", :path => "societies.json").content)
    groups = JSON.load(json)
    groups.each do |g|
      # Downloading images is expensive, only do it if we are creating a group.

      group = StudentGroup.find_or_initialize_by(name: g['name'])
      if group.new_record?
        group.description = g['description']
        group.zone_id = g['zone']

        if g['logo'] != "http://www.susu.org/groups/images/nologo.png" && !Rails.env.test?
          group.logo = save_to_tempfile(g['logo'])
        end

        if g['zone'] == 7 #sport
          group.kinds << sport
        elsif g['type'] == 'Media'
          group.kinds << media
        elsif g['type'] == 'Performing Arts'
          group.kinds << performing_art
        else
          group.kinds << society
        end

        group.save!
        puts "   -> imported #{g['name']}"
      else
        group.description = g['description']
      end

    end
  end
end

def save_to_tempfile(url)
  uri = URI.parse(url)
  Net::HTTP.start(uri.host, uri.port) do |http|
    resp = http.get(uri.path)
    name = url.split('/').last.split('.')
    file = Tempfile.new([name[0], ".#{name[1]}"], Dir.tmpdir, 'wb+')
    file.binmode
    file.write(resp.body)
    file.flush
    file
  end
end
