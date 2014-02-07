# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rss'
require 'net/http'
require 'rubygems'
require 'json'


# Create some default users for the sabbs, officers, etc and some test accounts.
User.destroy_all

@users = {}
def create_user(key, details)
  user = LocalUser.new
  user.email = details[:email]
  user.first_name = details[:name].split(' ').first
  user.last_name = details[:name].split(' ').last
  user.password = details[:password]
  user.password_confirmation = details[:password]
  user.skip_confirmation!
  user.save! :validate => false
  @users[key] = user
end

{
  dan: {
  name: "Dan Palmer",
  email: "dan@example.com",
  password: "password1"
},
  elliot: {
  name: "Elliot Hughes",
  email: "elliot@example.com",
  password: "password1"
},
  president: {
  name: "David Gilani",
  email: "pres@susu.org",
  password: "president"
},
  sports: {
  name: "Evan Whyte",
  email: "sports@susu.org",
  password: "sports"
},
  democracy: {
  name: "David Martin",
  email: "democracy@susu.org",
  password: "democracy"
},
  education: {
  name: "David Mendoza-Wolfson",
  email: "education@susu.org",
  password: "education"
},
  welfare: {
  name: "Beckie Thomas",
  email: "welfare@susu.org",
  password: "welfare"
},
  engagement: {
  name: "Claire Gilbert",
  email: "engagement@susu.org",
  password: "engagement"
},
  communities: {
  name: "Oli Coles",
  email: "communities@susu.org",
  password: "communities"
}}.map {|key,details| create_user(key, details)}

Place.destroy_all

cafe = Place.create({
	name: "The Café",
	description: "Whether you want a quick bacon roll for those early mornings or are meeting friends for lunch, The Café has a great selection of food to choose from.

It's conveniently located right in the middle of Highfield Campus in The Union (Building 42), and serves a great variety of tasty meals, snacks and drinks throughout the day at student-friendly prices.",
	latitude: 50.93434,
	longitude: -1.39749,
        shown: true
})

bridge = Place.create({
	name: "The Bridge",
	description: "Recently refurbished in Summer 2012, the Bridge is the destination on campus for great food, live music or even a study session

There's a varied offering of great entertainment, including fortnightly stand-up from Comedy Central Live, live music every Monday and a popular quiz night on Sundays.",
	latitude: 50.93445,
	longitude: -1.39776,
        shown:true
})

stags = Place.create({
	name: "The Stags",
	description: "Showing as much as live sport as we can fit in, plus the occasional Karaoke session on Thursday evenings, The Stag's is the perfect place to relax after a day of lectures. Friday evenings feature live music to end the week.",
	latitude: 50.93475,
	longitude: -1.39739,
        shown:true
})

shop = Place.create({
	name: "The Shop",
	description: "If you need to grab a quick bite to eat or have run out of paper for those all important lecture notes then The Shop is ideal.

It's right in the middle of Highfield Campus, and stocks a range of essentials from snacks, drinks and groceries to magazines, stationery and gifts.

You can also buy a selection of University of Southampton gifts and products from The Shop online.",
	latitude: 50.93446,
	longitude: -1.39688,
        shown:true
})

Schedule.destroy_all

cafe_schedule = Schedule.create({ place: cafe })
bridge_schedule = Schedule.create({ place: bridge })
stags_schedule = Schedule.create({ place: stags })
shop_schedule = Schedule.create({ place: shop })

OpeningTime.destroy_all

OpeningTime.create({ vacation: false, day: 1, open:  800, close: 1800, schedule: cafe_schedule })
OpeningTime.create({ vacation: false, day: 2, open:  800, close: 1800, schedule: cafe_schedule })
OpeningTime.create({ vacation: false, day: 3, open:  800, close: 1800, schedule: cafe_schedule })
OpeningTime.create({ vacation: false, day: 4, open:  800, close: 1800, schedule: cafe_schedule })
OpeningTime.create({ vacation: false, day: 5, open:  800, close: 1800, schedule: cafe_schedule })
OpeningTime.create({ vacation: false, day: 6, open: 1100, close: 1500, schedule: cafe_schedule })

OpeningTime.create({ vacation: false, day: 0, open: 1130, close: 2300, schedule: bridge_schedule })
OpeningTime.create({ vacation: false, day: 1, open:  800, close: 1800, schedule: bridge_schedule, service_start: 930 })
OpeningTime.create({ vacation: false, day: 2, open:  800, close: 1800, schedule: bridge_schedule, service_start: 930 })
OpeningTime.create({ vacation: false, day: 3, open:  800, close: 1800, schedule: bridge_schedule, service_start: 930 })
OpeningTime.create({ vacation: false, day: 4, open:  800, close: 1800, schedule: bridge_schedule, service_start: 930 })
OpeningTime.create({ vacation: false, day: 5, open:  800, close: 1800, schedule: bridge_schedule, service_start: 930 })
OpeningTime.create({ vacation: false, day: 6, open: 1130, close: 2300, schedule: bridge_schedule })

OpeningTime.create({ vacation: true, day: 1, open:  930, close: 1530, schedule: bridge_schedule })
OpeningTime.create({ vacation: true, day: 2, open:  930, close: 1500, schedule: bridge_schedule })
OpeningTime.create({ vacation: true, day: 3, open:  930, close: 1530, schedule: bridge_schedule })
OpeningTime.create({ vacation: true, day: 4, open:  930, close: 1530, schedule: bridge_schedule })
OpeningTime.create({ vacation: true, day: 5, open:  930, close: 1530, schedule: bridge_schedule })

OpeningTime.create({ vacation: false, day: 0, open: 1130, close: 2300, schedule: stags_schedule })
OpeningTime.create({ vacation: false, day: 1, open: 1130, close: 2400, schedule: stags_schedule })
OpeningTime.create({ vacation: false, day: 2, open: 1130, close: 2400, schedule: stags_schedule })
OpeningTime.create({ vacation: false, day: 3, open: 1130, close: 2400, schedule: stags_schedule })
OpeningTime.create({ vacation: false, day: 4, open: 1130, close:  100, schedule: stags_schedule })
OpeningTime.create({ vacation: false, day: 5, open: 1130, close: 2400, schedule: stags_schedule })
OpeningTime.create({ vacation: false, day: 6, open: 1130, close: 2400, schedule: stags_schedule })

OpeningTime.create({ vacation: false, day: 0, open: 1100, close: 1530, schedule: shop_schedule })
OpeningTime.create({ vacation: false, day: 1, open:  800, close: 1900, schedule: shop_schedule })
OpeningTime.create({ vacation: false, day: 2, open:  800, close: 1900, schedule: shop_schedule })
OpeningTime.create({ vacation: false, day: 3, open:  800, close: 1900, schedule: shop_schedule })
OpeningTime.create({ vacation: false, day: 4, open:  800, close: 1900, schedule: shop_schedule })
OpeningTime.create({ vacation: false, day: 5, open:  800, close: 1900, schedule: shop_schedule })
OpeningTime.create({ vacation: false, day: 6, open: 1000, close: 1600, schedule: shop_schedule })

OpeningTime.create({ vacation: true, day: 1, open:  830, close: 1630, schedule: shop_schedule })
OpeningTime.create({ vacation: true, day: 2, open:  830, close: 1630, schedule: shop_schedule })
OpeningTime.create({ vacation: true, day: 3, open:  830, close: 1630, schedule: shop_schedule })
OpeningTime.create({ vacation: true, day: 4, open:  830, close: 1630, schedule: shop_schedule })
OpeningTime.create({ vacation: true, day: 5, open:  830, close: 1630, schedule: shop_schedule })

BlogPost.destroy_all
sabb_blog = 'http://blogs.susu.org/sabbs/feed/'

open(sabb_blog) do |rss|
  feed = RSS::Parser.parse(rss)
  
  feed.items.each do |item|
    blog_post = BlogPost.new
    blog_post.title = item.title
    blog_post.body = item.content_encoded
    blog_post.save
  end
end

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
    event.description = item.description
    event.save
  end
end

Menu.destroy_all
MenuCategory.destroy_all
MenuItem.destroy_all

bridgeMenu = Menu.new(:place => bridge)
starters = MenuCategory.new(:menu => bridgeMenu,
                            :name => "Starters")
salads = MenuCategory.new(:menu => bridgeMenu,
                          :name => "Salads")
mains = MenuCategory.new(:menu => bridgeMenu,
                         :name => "Mains")
favourites = MenuCategory.new(:menu => bridgeMenu,
                              :name => "Favourites")
sides = MenuCategory.new(:menu => bridgeMenu,
                         :name => "Sides")
desserts = MenuCategory.new(:menu => bridgeMenu,
                            :name => "Desserts")

bridgeMenu.menu_categories.append(starters)
bridgeMenu.menu_categories.append(salads)
bridgeMenu.menu_categories.append(mains)
bridgeMenu.menu_categories.append(favourites)
bridgeMenu.menu_categories.append(sides)
bridgeMenu.menu_categories.append(desserts)


starters.menu_items
  .append(MenuItem.new(:name => "Freshly Made Soup of the Day",
                       :additional_info => "Served with roll & butter",
                       :price => 2.50))
  .append(MenuItem.new(:name => "Sustainably Sourced Smoked Makerel Fillet",
                       :additional_info => "Served with celeriac & pear remoulade & toasted bread.",
                       :price => 2.95))
  .append(MenuItem.new(:name => "Crisp Battered Prawns with Lemon & Chilli",
                       :price => 3.50))
  .append(MenuItem.new(:name => "Warm Seasonal Salad",
                       :additional_info => "Please ask for option.",
                       :price => 3.25))
  .append(MenuItem.new(:name => "Garlic Cheese Ciabatta",
                       :description => "Garlic toasted ciabatta bread with cheese.",
                       :price => 3.25))
          
salads.menu_items
  .append(MenuItem.new(:name => "Bridge Salad",
                       :description => "A great mix of fresh salad served with pine nuts and a balsamic glaze",
                       :price => 4.10))
  .append(MenuItem.new(:name => "Bridge Salad with Smoked Mackeral",
                       :price => 5.25))
  .append(MenuItem.new(:name => "Bridge Salad with Seared Chicken",
                       :price => 5.25))
  .append(MenuItem.new(:name => "Bridge Salad with Greek Feta Cheese & Olives",
                       :price => 5.25))

mains.menu_items
  .append(MenuItem.new(:name => "Warm Seasonal Salad",
                       :price => 4.45))
  .append(MenuItem.new(:name => "Chicken Español",
                       :description => "Sautéed chicken bread with chorizo, peppers, onions & olives in basil oil.",
                       :additional_info => "Plus choice of 2 sides.",
                       :price => 6.50))
  .append(MenuItem.new(:name => "Sizzling Platter",
                       :description => "Prime 4oz rump steak, chicken breast, fresh local sausage, mushrooms & cherry tomato.",
                       :additional_info => "Served with chips, onion rings & house salad.",
                       :price => 8.60))
  .append(MenuItem.new(:name => "Prime Local 6oz Rump Steak",
                       :additional_info => "Served with locally produced mushroms, roasted cherry tomatoes & tarragon and either chips or crushed new potatoes.",
                       :price => 7.00))
  .append(MenuItem.new(:name => "Fresh Poached Salmon",
                       :description => "Fresh salmon steak poached in a chilli & lime sauce.",
                       :additional_info => "Choice of 2 sides.",
                       :price => 6.00))
  .append(MenuItem.new(:name => "Trio of Locally Sourced Sausages",
                       :additional_info => "Served with mustard mashed potato, rich onion gravy & seasonal vegetables",
                       :price => 5.30))
  .append(MenuItem.new(:name => "Fresh Fish of the Day",
                       :additional_info => "Served with chips & minted peas.",
                       :description => "Freshly battered sustainably sourced white fish.",
                       :price => 5.00))
  .append(MenuItem.new(:name => "Pan Seared Duck Breast with Raspberry",
                       :additional_info => "With raspberries, roasted sweet potatoes & split green beans.",
                       :price => 7.50))

favourites.menu_items
  .append(MenuItem.new(:name => "Bridge Open Kebab",
                       :description => "Succulent marinated chicken served in an open pitta with house salad and sweet chilli sauce",
                       :price => 4.00))
  .append(MenuItem.new(:name => "Chip Butty",
                       :description => "Chunky chips with a large crusty baguette.",
                       :price => 2.25))
  .append(MenuItem.new(:name => "Bridge Beef Burger",
                       :description => "Locally farm produced 6oz burger",
                       :additional_info => "Layered with salad and tomato relish. Served with House Salad",
                       :price => 3.95))
  .append(MenuItem.new(:name => "Bridge Vegetable Burger",
                       :additional_info => "Layered with salad and tomato relish. Served with House Salad",
                       :price => 3.95))
  .append(MenuItem.new(:name => "Bridge Thai Chicken Burger",
                       :additional_info => "Layered with basil and coriander mayonnaise. Served with House Salad",
                       :price => 3.95))
  .append(MenuItem.new(:name => "Ultimate Burger Upgrade",
                       :description => "Add Cheese, Jalapenos and Bacon or Sundried Tomatoes to any burger",
                       :price => 1.50))

sides.menu_items
  .append(MenuItem.new(:name => "Sweet Potato Fries",
                       :price => 2.50))
  .append(MenuItem.new(:name => "Fresh Seasonal Vegetables",
                       :price => 1.60))
  .append(MenuItem.new(:name => "Crushed New Potatoes",
                       :price => 1.60))
  .append(MenuItem.new(:name => "Chunky Chips",
                       :price => 1.60))
  .append(MenuItem.new(:name => "House Salad",
                       :price => 1.60))
  .append(MenuItem.new(:name => "Onion Rings",
                       :price => 2.50))

desserts.menu_items
  .append(MenuItem.new(:name => "Chocolate Surprise",
                       :price => 3.00))
  .append(MenuItem.new(:name => "Apple Parfait with Blackberries",
                       :price => 3.00))
  .append(MenuItem.new(:name => "Sticky Toffee Pudding, Salted Caramel and Cinder Toffee",
                       :price => 3.00))
bridgeMenu.save


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


Course.destroy_all
Faculty.destroy_all
Cohort.destroy_all

require 'net/http'
require 'rubygems'
require 'json'

faculty_raw = Net::HTTP.get(URI.parse("http://www.susu.org/php/ajax-reps.php?type=faculty"))
faculty_json = JSON.parse(faculty_raw)

faculty_json.each do |k,faculties|
  faculties.each do |faculty|
    db_faculty = Faculty.create(:name => faculty["name"])
    course_raw = Net::HTTP.get(URI.parse("http://www.susu.org/php/ajax-reps.php?type=course&search=#{faculty['id']}"))
    course_json = JSON.parse(course_raw)
    course_json.each do |course|
      db_course = Course.create(:name => course["name"], :faculty => db_faculty)
      elected_raw = Net::HTTP.get(URI.parse("http://www.susu.org/php/ajax-reps.php?type=rep&search=#{course['election_id']}"))
      begin
        
        elected_json = JSON.parse(elected_raw)
        elected_json.each do |rep|
          Cohort.where(:course => db_course, :year => rep['year']).first_or_create
        end
      rescue Exception
      end
    end
  end
end


