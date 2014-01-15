# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rss'

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
    title_split = item.title.split(/((?:Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday), [0-9]{1,2}(?:st|nd|th|rd) (?:January|Feburary|March|April|May|June|July|August|September|October|November|December) [0-9]{4} - [0-9]{1,2}:[0-9]{2}(?:a|p)m)(?: )(.+ )(?:(?:in|at) )(.*)/)
    if title_split[1] and title_split[2]
      event.title = title_split[2]
      event.date = DateTime.parse(title_split[1])
      place = Place.where(:name => title_split[3]).first
      if place.nil?
        event.place = Place.create(:name => title_split[3], :shown => false)
      else
        event.place = place
      end
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
president = Officer.create(:title => "Union President")
vp_education = Officer.create(:title => "Vice-President Education")
vp_engagement = Officer.create(:title => "Vice-President Engagement")
vp_sports = Officer.create(:title => "Vice-President Sports Development")
vp_welfare = Officer.create(:title => "Vice-President Welfare")
vp_community = Officer.create(:title => "Vice-President Student Communities")
vp_democracy = Officer.create(:title => "Vice-President Democracy & Creative Industries")

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

