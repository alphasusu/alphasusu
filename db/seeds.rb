# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rss'

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

cafe_schedule = Schedule.create({ place: cafe })
bridge_schedule = Schedule.create({ place: bridge })
stags_schedule = Schedule.create({ place: stags })
shop_schedule = Schedule.create({ place: shop })

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

whats_on = 'http://www.susu.org/feeds/whatson.xml'

open(whats_on) do |rss|
  feed = RSS::Parser.parse(rss)

  feed.items.each do |item|
    event = Event.new
    title_split = item.title.split(/((?:Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday), [0-9]{1,2}(?:st|nd|th) (?:January|Feburary|March|April|May|June|July|August|September|October|November|December) [0-9]{4} - [0-9]{1,2}:[0-9]{2}(?:a|p)m)(?: )(.*)/)
    event.title = title_split[2]
    event.date = DateTime.parse(title_split[1])
    event.description = item.description
    event.save
  end
end
