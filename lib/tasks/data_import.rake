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
  
  desc "Create Societies"
  task :societies => :environment do
    lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc."

    Society.create(:name => "Actuarial Society", :description => lorem_ipsum)
    Society.create(:name => "Afghan", :description => lorem_ipsum)
    Society.create(:name => "African and Caribbean Society", :description => lorem_ipsum)
    Society.create(:name => "African Caribbean Christian Fellowship", :description => lorem_ipsum)
    Society.create(:name => "African Maritime, Finance, Oil and Gas Society", :description => lorem_ipsum)
    Society.create(:name => "AIESEC", :description => lorem_ipsum)
    Society.create(:name => "Aikido", :description => lorem_ipsum)
    Society.create(:name => "Airsoft", :description => lorem_ipsum)
    Society.create(:name => "Allied Health Society", :description => lorem_ipsum)
    Society.create(:name => "Alternative Indie Music", :description => lorem_ipsum)
    Society.create(:name => "American Football", :description => lorem_ipsum)
    Society.create(:name => "Amicus", :description => lorem_ipsum)
    Society.create(:name => "Amnesty International", :description => lorem_ipsum)
    Society.create(:name => "Anime and Manga Society", :description => lorem_ipsum)
    Society.create(:name => "Archaeology Society", :description => lorem_ipsum)
    Society.create(:name => "Archers Road JCR", :description => lorem_ipsum)
    Society.create(:name => "Art Society", :description => lorem_ipsum)
    Society.create(:name => "Asian Cultural Society", :description => lorem_ipsum)
    Society.create(:name => "Assassins Society - The Guild", :description => lorem_ipsum)
    Society.create(:name => "Astronomy Society", :description => lorem_ipsum)
    Society.create(:name => "Atheist Society", :description => lorem_ipsum)
    Society.create(:name => "Athletics & Cross Country", :description => lorem_ipsum)
    Society.create(:name => "Audiology", :description => lorem_ipsum)
    Society.create(:name => "Azerbaijan", :description => lorem_ipsum)
    Society.create(:name => "Badminton (Colours)", :description => lorem_ipsum)
    Society.create(:name => "Badminton (Recreational)", :description => lorem_ipsum)
    Society.create(:name => "Ballet Society", :description => lorem_ipsum)
    Society.create(:name => "Ballroom and Latin Dance Society", :description => lorem_ipsum)
    Society.create(:name => "Barnardo's society", :description => lorem_ipsum)
    Society.create(:name => "Baseball", :description => lorem_ipsum)
    Society.create(:name => "Basketball", :description => lorem_ipsum)
    Society.create(:name => "Belly Dance Society", :description => lorem_ipsum)
    Society.create(:name => "Bencraft JCR", :description => lorem_ipsum)
    Society.create(:name => "Bhangra Society", :description => lorem_ipsum)
    Society.create(:name => "Biological Sciences Postgraduate", :description => lorem_ipsum)
    Society.create(:name => "Biological Sciences Society", :description => lorem_ipsum)
    Society.create(:name => "Boat", :description => lorem_ipsum)
    Society.create(:name => "Boxing", :description => lorem_ipsum)
    Society.create(:name => "Brass Band", :description => lorem_ipsum)
    Society.create(:name => "Breakdance Society", :description => lorem_ipsum)
    Society.create(:name => "Bridge Club", :description => lorem_ipsum)
    Society.create(:name => "Bright Futures", :description => lorem_ipsum)
    Society.create(:name => "British Red Cross Society", :description => lorem_ipsum)
    Society.create(:name => "Bruneian Society", :description => lorem_ipsum)
    Society.create(:name => "Buddhist Meditation Society", :description => lorem_ipsum)
    Society.create(:name => "Bulgarian Society", :description => lorem_ipsum)
    Society.create(:name => "Cake Decorating Society", :description => lorem_ipsum)
    Society.create(:name => "Canoe", :description => lorem_ipsum)
    Society.create(:name => "Canoe Polo", :description => lorem_ipsum)
    Society.create(:name => "Capoeira", :description => lorem_ipsum)
    Society.create(:name => "Catholic Society", :description => lorem_ipsum)
    Society.create(:name => "Caving", :description => lorem_ipsum)
    Society.create(:name => "Chamberlain JCR", :description => lorem_ipsum)
    Society.create(:name => "Cheerleading - Vixens", :description => lorem_ipsum)
    Society.create(:name => "Chemistry Society", :description => lorem_ipsum)
    Society.create(:name => "Chess Club", :description => lorem_ipsum)
    Society.create(:name => "Chinese Students & Scholars Association", :description => lorem_ipsum)
    Society.create(:name => "Chinese Students Society", :description => lorem_ipsum)
    Society.create(:name => "Christian Union", :description => lorem_ipsum)
    Society.create(:name => "Circus Society", :description => lorem_ipsum)
    Society.create(:name => "Comedy Society", :description => lorem_ipsum)
    Society.create(:name => "Computer Game Society", :description => lorem_ipsum)
    Society.create(:name => "Concert Band", :description => lorem_ipsum)
    Society.create(:name => "Connaught JCR", :description => lorem_ipsum)
    Society.create(:name => "Conservation Volunteers", :description => lorem_ipsum)
    Society.create(:name => "Conservative Association", :description => lorem_ipsum)
    Society.create(:name => "Contemporary Dance Society", :description => lorem_ipsum)
    Society.create(:name => "Creative Writing Society", :description => lorem_ipsum)
    Society.create(:name => "Cricket (Ladies)", :description => lorem_ipsum)
    Society.create(:name => "Cricket (Mens)", :description => lorem_ipsum)
    Society.create(:name => "Cymru Soc", :description => lorem_ipsum)
    Society.create(:name => "Debating Society", :description => lorem_ipsum)
    Society.create(:name => "Diving", :description => lorem_ipsum)
    Society.create(:name => "DJ Society", :description => lorem_ipsum)
    Society.create(:name => "Dodgeball", :description => lorem_ipsum)
    Society.create(:name => "Duke of Edinburgh Society", :description => lorem_ipsum)
    Society.create(:name => "Economics Society", :description => lorem_ipsum)
    Society.create(:name => "Education", :description => lorem_ipsum)
    Society.create(:name => "Electronic Music Society", :description => lorem_ipsum)
    Society.create(:name => "Electronics and Computer Science Society", :description => lorem_ipsum)
    Society.create(:name => "Enactus", :description => lorem_ipsum)
    Society.create(:name => "Engineering Society", :description => lorem_ipsum)
    Society.create(:name => "Engineers Without Borders ", :description => lorem_ipsum)
    Society.create(:name => "English Society", :description => lorem_ipsum)
    Society.create(:name => "Environmental Science Student Society", :description => lorem_ipsum)
    Society.create(:name => "Erasmus Park JCR", :description => lorem_ipsum)
    Society.create(:name => "Erasmus Society", :description => lorem_ipsum)
    Society.create(:name => "Explore the UK", :description => lorem_ipsum)
    Society.create(:name => "Fancy Dress", :description => lorem_ipsum)
    Society.create(:name => "Fandomonium Society", :description => lorem_ipsum)
    Society.create(:name => "Fashion and Style Society", :description => lorem_ipsum)
    Society.create(:name => "Feminist Society", :description => lorem_ipsum)
    Society.create(:name => "Fencing", :description => lorem_ipsum)
    Society.create(:name => "Fight Against Cancer", :description => lorem_ipsum)
    Society.create(:name => "Film Society", :description => lorem_ipsum)
    Society.create(:name => "Fish On Toast", :description => lorem_ipsum)
    Society.create(:name => "Folk Music Society", :description => lorem_ipsum)
    Society.create(:name => "Football (Ladies)", :description => lorem_ipsum)
    Society.create(:name => "Football (Mens)", :description => lorem_ipsum)
    Society.create(:name => "French Society", :description => lorem_ipsum)
    Society.create(:name => "Games Society", :description => lorem_ipsum)
    Society.create(:name => "Geography Society", :description => lorem_ipsum)
    Society.create(:name => "Geological Society", :description => lorem_ipsum)
    Society.create(:name => "German Society", :description => lorem_ipsum)
    Society.create(:name => "Glen Eyre JCR", :description => lorem_ipsum)
    Society.create(:name => "Gliding", :description => lorem_ipsum)
    Society.create(:name => "Goju Ryu Karate", :description => lorem_ipsum)
    Society.create(:name => "Golf", :description => lorem_ipsum)
    Society.create(:name => "Good Food Society", :description => lorem_ipsum)
    Society.create(:name => "Greek and Cypriot Society", :description => lorem_ipsum)
    Society.create(:name => "Green Action", :description => lorem_ipsum)
    Society.create(:name => "Guild of Change Ringers", :description => lorem_ipsum)
    Society.create(:name => "Gymnastics", :description => lorem_ipsum)
    Society.create(:name => "Handball", :description => lorem_ipsum)
    Society.create(:name => "Highfield JCR", :description => lorem_ipsum)
    Society.create(:name => "Hillwalking", :description => lorem_ipsum)
    Society.create(:name => "Hindu Society", :description => lorem_ipsum)
    Society.create(:name => "History Society", :description => lorem_ipsum)
    Society.create(:name => "Hockey (Ladies)", :description => lorem_ipsum)
    Society.create(:name => "Hockey (Mens)", :description => lorem_ipsum)
    Society.create(:name => "Hong Kong Public Affairs and Social Service Soceity", :description => lorem_ipsum)
    Society.create(:name => "Hung Leng Kuen Kung Fu", :description => lorem_ipsum)
    Society.create(:name => "Ice and Inline hockey", :description => lorem_ipsum)
    Society.create(:name => "India Society", :description => lorem_ipsum)
    Society.create(:name => "Indonesian Society", :description => lorem_ipsum)
    Society.create(:name => "Innocence Project", :description => lorem_ipsum)
    Society.create(:name => "Inns of Court Society", :description => lorem_ipsum)
    Society.create(:name => "International Fellowship of Christian Students", :description => lorem_ipsum)
    Society.create(:name => "Investment and Finance Society", :description => lorem_ipsum)
    Society.create(:name => "Islamic Society", :description => lorem_ipsum)
    Society.create(:name => "Italian Society", :description => lorem_ipsum)
    Society.create(:name => "Japanese Society", :description => lorem_ipsum)
    Society.create(:name => "Jazz Dance", :description => lorem_ipsum)
    Society.create(:name => "Jazz Orchestra", :description => lorem_ipsum)
    Society.create(:name => "Jazzmanix", :description => lorem_ipsum)
    Society.create(:name => "Jewish Society", :description => lorem_ipsum)
    Society.create(:name => "Jiu-Jitsu", :description => lorem_ipsum)
    Society.create(:name => "Judo", :description => lorem_ipsum)
    Society.create(:name => "Karate-Do Shotokai", :description => lorem_ipsum)
    Society.create(:name => "Kitesurfing", :description => lorem_ipsum)
    Society.create(:name => "Korfball", :description => lorem_ipsum)
    Society.create(:name => "Krishna Consciousness Society", :description => lorem_ipsum)
    Society.create(:name => "Labour Club", :description => lorem_ipsum)
    Society.create(:name => "Lacrosse (Ladies)", :description => lorem_ipsum)
    Society.create(:name => "Lacrosse (Men's)", :description => lorem_ipsum)
    Society.create(:name => "Lacrosse (Mixed)", :description => lorem_ipsum)
    Society.create(:name => "Law Society", :description => lorem_ipsum)
    Society.create(:name => "Lawyers Without Borders", :description => lorem_ipsum)
    Society.create(:name => "Lesbian, Gay Bisexual And Transgender Society", :description => lorem_ipsum)
    Society.create(:name => "Liberty Point JCR", :description => lorem_ipsum)
    Society.create(:name => "Life Sciences Postgraduate Study", :description => lorem_ipsum)
    Society.create(:name => "Lifesaving", :description => lorem_ipsum)
    Society.create(:name => "Light Operatic Society", :description => lorem_ipsum)
    Society.create(:name => "Lithuanian Society", :description => lorem_ipsum)
    Society.create(:name => "Live Music Society", :description => lorem_ipsum)
    Society.create(:name => "Magic Society", :description => lorem_ipsum)
    Society.create(:name => "Malaysian Students Association", :description => lorem_ipsum)
    Society.create(:name => "Mandarin Christian Fellowship", :description => lorem_ipsum)
    Society.create(:name => "Marine Conservation Society", :description => lorem_ipsum)
    Society.create(:name => "Maths Society", :description => lorem_ipsum)
    Society.create(:name => "Mature Students Society", :description => lorem_ipsum)
    Society.create(:name => "Mauritian Society", :description => lorem_ipsum)
    Society.create(:name => "Medical Society", :description => lorem_ipsum)
    Society.create(:name => "Medics Revue", :description => lorem_ipsum)
    Society.create(:name => "Medsin", :description => lorem_ipsum)
    Society.create(:name => "Mental Wealth/Student Minds", :description => lorem_ipsum)
    Society.create(:name => "Mexican Society", :description => lorem_ipsum)
    Society.create(:name => "Middle East Society", :description => lorem_ipsum)
    Society.create(:name => "Modern Wushu", :description => lorem_ipsum)
    Society.create(:name => "Monte JCR", :description => lorem_ipsum)
    Society.create(:name => "Mountain Bike Club", :description => lorem_ipsum)
    Society.create(:name => "Mountaineering", :description => lorem_ipsum)
    Society.create(:name => "Muay Thai", :description => lorem_ipsum)
    Society.create(:name => "Music Production Society", :description => lorem_ipsum)
    Society.create(:name => "Music Society", :description => lorem_ipsum)
    Society.create(:name => "Nepalis United at the", :description => lorem_ipsum)
    Society.create(:name => "Netball", :description => lorem_ipsum)
    Society.create(:name => "Nightline", :description => lorem_ipsum)
    Society.create(:name => "NOC", :description => lorem_ipsum)
    Society.create(:name => "Nordic Society", :description => lorem_ipsum)
    Society.create(:name => "Northern Ireland Society", :description => lorem_ipsum)
    Society.create(:name => "Nursing and Midwifery Society", :description => lorem_ipsum)
    Society.create(:name => "Organ Donation Society", :description => lorem_ipsum)
    Society.create(:name => "Oxfam Society", :description => lorem_ipsum)
    Society.create(:name => "Paintball", :description => lorem_ipsum)
    Society.create(:name => "Pakistan Society", :description => lorem_ipsum)
    Society.create(:name => "Performing Arts", :description => lorem_ipsum)
    Society.create(:name => "Persian", :description => lorem_ipsum)
    Society.create(:name => "Philharmonic Choir", :description => lorem_ipsum)
    Society.create(:name => "Philosophy Society", :description => lorem_ipsum)
    Society.create(:name => "Photographic Society", :description => lorem_ipsum)
    Society.create(:name => "Physics Society", :description => lorem_ipsum)
    Society.create(:name => "Piano Society", :description => lorem_ipsum)
    Society.create(:name => "Picnic Society", :description => lorem_ipsum)
    Society.create(:name => "Poetry Society", :description => lorem_ipsum)
    Society.create(:name => "Poker Society", :description => lorem_ipsum)
    Society.create(:name => "Pole Dancing Society", :description => lorem_ipsum)
    Society.create(:name => "Polish Society", :description => lorem_ipsum)
    Society.create(:name => "Politics Association", :description => lorem_ipsum)
    Society.create(:name => "Polo", :description => lorem_ipsum)
    Society.create(:name => "Pottery Society", :description => lorem_ipsum)
    Society.create(:name => "Pre-sessional", :description => lorem_ipsum)
    Society.create(:name => "Private Rented JCR", :description => lorem_ipsum)
    Society.create(:name => "Psychosoc", :description => lorem_ipsum)
    Society.create(:name => "RAG", :description => lorem_ipsum)
    Society.create(:name => "Real Ale and Cider Society", :description => lorem_ipsum)
    Society.create(:name => "Riding", :description => lorem_ipsum)
    Society.create(:name => "Rifle", :description => lorem_ipsum)
    Society.create(:name => "Road (Cycling)", :description => lorem_ipsum)
    Society.create(:name => "Rock and Metal Music Society", :description => lorem_ipsum)
    Society.create(:name => "Romanian", :description => lorem_ipsum)
    Society.create(:name => "Rotaract Club", :description => lorem_ipsum)
    Society.create(:name => "RSPCA Society", :description => lorem_ipsum)
    Society.create(:name => "Rugby (Ladies)", :description => lorem_ipsum)
    Society.create(:name => "Rugby (Mens)", :description => lorem_ipsum)
    Society.create(:name => "Russian Speaking Society", :description => lorem_ipsum)
    Society.create(:name => "Salsa Society", :description => lorem_ipsum)
    Society.create(:name => "Shaolin Temple Kung Fu Club", :description => lorem_ipsum)
    Society.create(:name => "Shorinji Kempo", :description => lorem_ipsum)
    Society.create(:name => "Showstoppers", :description => lorem_ipsum)
    Society.create(:name => "Sign Language Society", :description => lorem_ipsum)
    Society.create(:name => "Sinfonietta", :description => lorem_ipsum)
    Society.create(:name => "Singapore Society", :description => lorem_ipsum)
    Society.create(:name => "Ski and Snowboard", :description => lorem_ipsum)
    Society.create(:name => "SKIP", :description => lorem_ipsum)
    Society.create(:name => "Skydive", :description => lorem_ipsum)
    Society.create(:name => "Snooker and Pool", :description => lorem_ipsum)
    Society.create(:name => "Social Sciences Society", :description => lorem_ipsum)
    Society.create(:name => "Society for the appreciation of Permaculture, Allotments and Mud", :description => lorem_ipsum)
    Society.create(:name => "Soton Navs", :description => lorem_ipsum)
    Society.create(:name => "Hub", :description => lorem_ipsum)
    Society.create(:name => "Marrow", :description => lorem_ipsum)
    Society.create(:name => "Marxist Society", :description => lorem_ipsum)
    Society.create(:name => "Society of Clinical Anatomy", :description => lorem_ipsum)
    Society.create(:name => "Taiwanese Society", :description => lorem_ipsum)
    Society.create(:name => "Archery Club", :description => lorem_ipsum)
    Society.create(:name => "Chamber Choir", :description => lorem_ipsum)
    Society.create(:name => "Civil Engineering Society", :description => lorem_ipsum)
    Society.create(:name => "Futsal Club", :description => lorem_ipsum)
    Society.create(:name => "'s Impeccably Tailored Society", :description => lorem_ipsum)
    Society.create(:name => "Spaceflight Society", :description => lorem_ipsum)
    Society.create(:name => "Spanish, Latin American and Portugese Society", :description => lorem_ipsum)
    Society.create(:name => "Squash", :description => lorem_ipsum)
    Society.create(:name => "Sri Lanka Society", :description => lorem_ipsum)
    Society.create(:name => "St. John Ambulance LINKS / First Aid Society", :description => lorem_ipsum)
    Society.create(:name => "Stage Technicians' Society", :description => lorem_ipsum)
    Society.create(:name => "Steampunk Society", :description => lorem_ipsum)
    Society.create(:name => "Street Dance Society", :description => lorem_ipsum)
    Society.create(:name => "Street Sports", :description => lorem_ipsum)
    Society.create(:name => "String Orchestra", :description => lorem_ipsum)
    Society.create(:name => "Student Scout And Guide Organisation", :description => lorem_ipsum)
    Society.create(:name => "Students for Palestine ()", :description => lorem_ipsum)
    Society.create(:name => "SU Singers", :description => lorem_ipsum)
    Society.create(:name => "Sub-Aqua", :description => lorem_ipsum)
    Society.create(:name => "Surf", :description => lorem_ipsum)
    Society.create(:name => "Surge Radio", :description => lorem_ipsum)
    Society.create(:name => "SUSU", :description => lorem_ipsum)
    Society.create(:name => "SUSUtv", :description => lorem_ipsum)
    Society.create(:name => "Swimming", :description => lorem_ipsum)
    Society.create(:name => "Switch Off Society", :description => lorem_ipsum)
    Society.create(:name => "Symphonic Wind Orchestra", :description => lorem_ipsum)
    Society.create(:name => "Symphony Orchestra", :description => lorem_ipsum)
    Society.create(:name => "Table Tennis", :description => lorem_ipsum)
    Society.create(:name => "Taekwondo Club", :description => lorem_ipsum)
    Society.create(:name => "Tap Dance Society", :description => lorem_ipsum)
    Society.create(:name => "Tchoukball", :description => lorem_ipsum)
    Society.create(:name => "Tennis", :description => lorem_ipsum)
    Society.create(:name => "Tenpin Bowling", :description => lorem_ipsum)
    Society.create(:name => "The Drum Circle", :description => lorem_ipsum)
    Society.create(:name => "The Edge", :description => lorem_ipsum)
    Society.create(:name => "The Melodics", :description => lorem_ipsum)
    Society.create(:name => "Theatre Group", :description => lorem_ipsum)
    Society.create(:name => "Thrift Society", :description => lorem_ipsum)
    Society.create(:name => "Touch Rugby", :description => lorem_ipsum)
    Society.create(:name => "Trampolining", :description => lorem_ipsum)
    Society.create(:name => "Triathlon", :description => lorem_ipsum)
    Society.create(:name => "Ultimate Frisbee", :description => lorem_ipsum)
    Society.create(:name => "Unicef on Campus", :description => lorem_ipsum)
    Society.create(:name => "Union Films", :description => lorem_ipsum)
    Society.create(:name => "United As One Society", :description => lorem_ipsum)
    Society.create(:name => "Angling Society", :description => lorem_ipsum)
    Society.create(:name => "Crossfit and Strength Sports", :description => lorem_ipsum)
    Society.create(:name => "Filipino Society", :description => lorem_ipsum)
    Society.create(:name => "TED Society", :description => lorem_ipsum)
    Society.create(:name => "Vietnamese Society", :description => lorem_ipsum)
    Society.create(:name => "Volleyball", :description => lorem_ipsum)
    Society.create(:name => "Wakeboarding", :description => lorem_ipsum)
    Society.create(:name => "Water Polo Club", :description => lorem_ipsum)
    Society.create(:name => "WaterAid Society", :description => lorem_ipsum)
    Society.create(:name => "Webteam", :description => lorem_ipsum)
    Society.create(:name => "Wessex Films", :description => lorem_ipsum)
    Society.create(:name => "Wessex Motor Club", :description => lorem_ipsum)
    Society.create(:name => "Wessex Sailing Club", :description => lorem_ipsum)
    Society.create(:name => "Wessex Scene", :description => lorem_ipsum)
    Society.create(:name => "Wildlife Protection", :description => lorem_ipsum)
    Society.create(:name => "Windsurfing", :description => lorem_ipsum)
    Society.create(:name => "Wing Chun", :description => lorem_ipsum)
    Society.create(:name => "Wireless Society", :description => lorem_ipsum)
    Society.create(:name => "Yoga Society", :description => lorem_ipsum)
    Society.create(:name => "Zumba+", :description => lorem_ipsum)
  end
end
