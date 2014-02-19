
namespace "import" do
  
  desc "Help Articles"
  task :help_articles => :environment do
    @help_articles.each do |article|
      existing_article = HelpArticle.find_or_create_by(title: article[:title])
      existing_article.body = article[:body]
      existing_article.save!
    end
  end

end

@help_articles = [{
  title: "Arriving in Southampton",
  body: <<-EOS
~~

 - [Enrolling as a student](http://www.enrol.soton.ac.uk/)
 - [Applying for a visa](http://www.soton.ac.uk/international/join_us/visas.html)

#### Meeting Other International Students

During the first week you will have plenty of opportunity to meet other international students, both in your accommodation and during the Welcome Programme.

 - [Register on the welcome programme](http://www.soton.ac.uk/international/welcome/induction.html)
 - [Meet and Greet service](http://www.soton.ac.uk/international/welcome/meet_and_greet.html)
 - [Travelling to Southampton when you arrive](http://www.soton.ac.uk/international/welcome/gettingtosouthampton.html)

#### Medical Insurance

If you are registered upon a course that is shorter than six months or you are a non-EU exchange student, you will not be entitled to free treatment and you should take out your own health and medical insurance.

You are only entitled to free NHS treatment once you are registered as a student. Please note that registration is not the same as accepting an offer of a place at the University, and you will not be covered for any days or weeks you are in the UK prior to Registration. You should take out your own health insurance to cover this period.

Your wife/husband and children, but not other family members, will also be entitled to free NHS treatment.

If any other members of your family come to visit you whilst you are in the UK it is ESSENTIAL that they take out private health insurance to cover themselves whilst they are in the UK. Failure to do so can be very expensive.

For more information, please visit the [UKCISA website](http://www.ukcisa.org.uk/).
EOS
},{
  title: "Finance for International Students",
  body: <<-EOS
~~
#### What is the currency?

UK currency is called 'sterling', and is divided into pounds (£) and pence (p). One pound (£1.00) is equivalent to 100 pence. There are bank notes in £5.00, £10.00, £20.00 and £50.00 denominations and coins. The coins currently in circulation are 1p, 2p, 5p, 10p, 20p, 50p, £1.00 and £2.00.

The Money Exchange Bureaux at the airports produce a useful colour guide to UK currency which will help you become familiar with the different coins and notes. The UK has not adopted the single European currency, the Euro.

#### How much money will I need?

Apart from the fees for your course itself, how much will it cost you to live in the UK? Some students will spend less money than others whilst they are living in Southampton. Please visit the following websites for more information:

 - [University of Southampton student fees](http://www.soton.ac.uk/international/fees_money/index.shtml)
 - [UKCISA website on living costs](http://www.ukcisa.org.uk/student/living_costs.php)

#### How do I open a bank account?

If you have not already opened a bank account, you will find branches of the major banks on the Highfield Campus in the Gower Building (Building 60). The five major banks in the UK are Barclays, Lloyds TSB, HSBC, NatWest and Abbey (Santander). Overseas Students will normally be eligible to open a ‘basic’ bank account, but the facilities offered to students from abroad will usually be limited. A basic bank account allows you to pay in and withdraw money, and to pay bills by direct debit. You will be given a cash card to draw money out, but you will not be able to access credit or overdraft facilities. A cheque card or payment card may be issued on provision of adequate references.

To open a bank account in the UK you will need to show your passport, proof that you are a full-time student, and evidence of both your UK and home addresses. You should ask your School Office for a letter that provides this information. Do not be afraid to visit several banks to find out which best meets your needs.

Remember: that it may take several weeks to get your bank account up and running, so you should make sure that you bring enough money (in sterling travellers cheques) to last you for about a month after your arrival.

For more information please visit the [UKCISA website](http://www.ukcisa.org.uk/student/bank_account.php).

If you experience any problems opening a bank account, please contact the [The Advice Centre](http://www.susu.org/life).

EOS
},{
  title: "Healthcare in the UK",
  body: <<-EOS
~~
#### How do I get access to health services?

The National Health Service (NHS) is a system in the UK where you can receive free hospital treatment and healthcare. Some services are free, and some you will have to pay for. International students (other than European Economic Area (EEA) Nationals) are entitled to have treatment under this service if your course lasts for six months or longer.

For more information about keeping healthy please go to UKCISA website

#### European Economic Area (EEA) Nationals
(EEA) nationals and their family should obtain a European Health Insurance Card (EHIC) before coming to the UK. This will entitle the holder and their family to NHS treatment. For more information click here

The NHS also operates a 24 hour a day telephone advice line for a whole range of medical matters. The telephone number for NHS Direct is 0845 4647.

When you are in a new country, it is sometimes easy to concentrate just on your studies and to forget about taking care of your health. You may find your health affected by change of climate and unfamiliar food. Medicine for ailments such as stomach upsets and colds can be purchased at pharmacies without prescription, but do not hesitate to seek medical advice if you are concerned about your health in any way. You may find yourself feeling lonely and homesick; this is perfectly natural, and people can help you to adjust to being away from your country and your family. Do seek help quickly if you feel you are not coping very well.

#### Reciprocal agreements between countries

The UK has reciprocal arrangements with many countries which entitle their citizens to NHS treatment. This does not apply to pre-existing medical conditions. For more information on reciprocal agreements, go to the following website: UKCISA website or contact the Students’ Union Advice and Information Centre. Anyone who comes with the specific aim of having treatment whilst here may have to pay for private treatment.

#### Registering with a doctor

In order to qualify for free NHS treatment, you are required to register with a local doctor as soon as possible after your arrival in the UK. There are two doctor's surgeries on the Highfield Campus and many others nearby.

When registering, you will need details of all immunisations you (and your family, if they are accompanying you) have had. A detailed programme of the vaccinations given to babies and children from birth is required so that the Health Professionals here can determine whether children have received all the necessary immunisations required here in the UK.

If you need to see your doctor you can make an appointment by phone, or in person. If you are too ill to go to the surgery, a doctor may visit you at home, but you will need to arrange this with the surgery.

For further information on keeping healthy, visit the UKCISA website. Local health information can be found on the Southampton NHS and Winchester NHS websites.

#### Emergencies

Dialing 999 can be used to summon assistance from the three main emergency services, Police, Fire and Rescue and Ambulance. Phone calls to the 999 service are free. In the case of accident or illness needing immediate hospital treatment, the patient should be taken to the Accident and Emergency Department of your local hospital.

For more information about how to deal with a medical emergency visit the UKCISA website

If you do have to go into hospital, you may be asked how long you are staying in the UK in order to establish whether you are entitled to free treatment.

#### Medicines

Certain medicines, such as antibiotics, cannot be obtained without a prescription from a doctor. The prescription should be taken to a pharmacy or a chemist to collect the medicine. Each item on prescription currently costs £7.20 (April 2011 rates) – you may be entitled to some assistance with the cost if you are on a low income (see below).

Children under 16 are entitled to free prescriptions. If you are not entitled to assisted costs and have to take a lot of medicines you may be able to purchase a pre-payment certificate for 3 or 12 months, which will reduce the costs significantly.

#### Dental Care

When you visit a dentist you should ask whether they will accept you as an NHS patient. Many dentists in the UK now only accept private patients. Even if you are treated under the NHS there will be a charge, but again you may be entitled to some assistance with the cost if you are on a low income (see below).

The NHS [provide a tool](http://www.nhs.uk/servicedirectories/Pages/ServiceSearch.aspx?ServiceType=Dentist&WT.srch=1&gclid=COWviLrZ4qACFQRslAodDyPhDw) to locate your local dentist.

#### Optical Care

To get an eye test, spectacles or any other eye treatment, you will need to see an optician. The cost of an eye test is normally around £ 20.00, although the cost of the test may be free if you purchase glasses and/or contact lenses at the same time. The cost of frames and lenses varies widely. There are many opticians in Southampton, so it is worth shopping around to see where you can get the best deal.

#### Financial Assistance

You may be able to get some assistance with the Cost of Medicines, Dental and Optical Treatment if you are on a low income. To see if you qualify for any help, you should complete form HC1 (available from The Advice Centre). You may get some help with the costs or you may not have to pay anything at all. If you buy any medicines, or have any treatment at all before you apply for assistance you should keep the receipt, as you may be able to claim the money back on form HC5, if you are eligible.

#### Contraception

Free contraception is available from your doctor, and from Family Planning clinics. Students can collect free condoms from the Students' Union Sabbatical Officers (located in Building 42 of The Union). Condoms can be purchased from pharmacies, supermarkets, and from machines in the Students' Union. For more information about family planning clinics, pick up a leaflet from the Students' Union Advice and Information Centre, or speak to your doctor.
EOS
},{
  title: "Living in the UK",
  body: <<-EOS
~~
#### About Southampton

The City of Southampton has a population of more than 200,000 people, with the University contributing some 20,000 full and part-time students to that number. The city is situated on the south coast of England, 70 miles south of London. From Southampton you can easily visit London, as well as local towns such as Winchester, Salisbury, Bournemouth and Portsmouth. The New Forest, an area of outstanding natural beauty, is close by.

Southampton is a very green city, with seven parks in the city centre alone and a large common and sports centre close to the University. The city is proud of its sporting heritage, and provides ample opportunity for watching world class sport. It is home to the football club Southampton F.C, affectionately known as ‘The Saints’. Southampton is the regional capital for culture, and is home to theatres, multi-screen cinemas, and art galleries. It is a thriving modern city, but you don’t have to explore too far to discover its historic past. The city has a range of museums, as well as sites of historic interest.

The Highfield Campus is about two miles from the centre of Southampton with a regular bus service into the city.

#### Weather
The weather in Southampton, as throughout the UK, can be unpredictable! Temperatures are rarely extreme, although in during the winter months of 2010 and 2011 we experienced heavy snow and freezing temperatures for the first time in many years. The average temperature in summer Southampton is around 16 degrees Celsius and in winter it is around 7 degrees Celsius. Generally, June to September is warm, with occasional hot spells. October to May can be cold, with frost and cold winds from December to March. It rains throughout the year and it is never possible to guarantee that a day will be dry, even in midsummer! Be prepared to bring or buy warm clothing when you arrive in September, as it can seem cold, particularly if you are coming from a warm climate.

Make sure you have plenty of warm clothes which will protect you in all types of weather. ‘Layering’ is one way of doing this. This means wearing t-shirts or shirts, to which you can add sweaters, jackets or coats, depending on how cold it is. Ideally you should have a waterproof coat, strong shoes, and gloves, hats and scarves for the winter months. The coldest months of the year are January and February, when the temperature at night can fall as low as minus 4 degrees Celsius. Make sure the rooms you live and work in are warm enough and you have plenty of warm bedding. Be careful not to keep your room too hot though, as heating costs are expensive, and you will feel even colder when you go out! In the summer months the temperatures can rise as high as 30 degrees Celsius.

#### Religion

People of many religious beliefs live in Southampton, and you may wish to become involved in a local group or a group based at the University. There is a Christian Chaplaincy and a Muslim prayer room on campus. The Students’ Union Advice and Information Centre can provide further information on request, or you can look at the University’s website.

#### Telephones

In the UK there are two types of public telephone, those that are operated by coins, and those that take credit cards. Most students purchase mobile phones for use in the UK, if you already use a mobile phone in your country you should check to see if it will work in the UK before you arrive. Calls can be substantially more expensive if made from a mobile network. There are many cheap international calling services around, so it pays to look around before you decide which one to use.

#### TV Licence

If you decide to buy or rent a TV you will need a licence. Even if you live in a university Hall of Residence which has a communal TV room, you need your own licence to watch TV in your room.

If you live in a shared house where you pay the rent between you and share facilities, you will normally be considered as one household, and will need only one licence. The licence will have to be in one person’s name, and if they leave the house they can take the licence with them. The licence is not transferable from one person to another. If you live in a house which is divided into bed sits or flats and you have individual tenancy agreements, each individual unit of accommodation will need a separate TV licence.

PLEASE NOTE: Even if you watch TV channels as they're broadcast through your computer, you still need a licence.

You do not need a licence for a radio.

At the moment a licence for a colour TV costs £145.50 (2011) and a licence for a black and white TV costs £49.00 but the fee changes each year on the 1st. Not having the correct licence is a criminal offence and you may be fined up to a maximum of £1000.00 if you do not have one. For more information about TV licences, including how to pay, visit the TV Licencing website or visit the Student Union Advice and Information Centre.

#### How can I learn about British Culture?

The Students' Union organises trips to places of interest throughout the year. You can book yourself on these trips on the Box Office website.

HOST UK can arrange an invitation for you to be weekend guests in the homes of approved volunteer hosts all over the UK. There is more information on their website

The UKCISA website and The British Council have lots of useful information for International Students about British culture.

Also, Southampton University Students’ Union and Loughborough Students’ Union have received funding from UKCISA to produce a new website for International students. www.ukculture.info is both an informative and an interactive website where International students can learn about UK Culture, but can also give their reflections to other students.

We want International students from around the UK to contribute their experiences in the comments boxes and we would also love to link to your student blogs, films or web pages.

#### Where are the nearest shops & supermarkets?

Situated on the Highfield campus the Students’ Union Shop is there to cater for all your consumer needs. The shop has a range of everyday goods available for purchase at student friendly prices; these include freshly baked croissants, files and stationery, newspapers, magazines, greeting cards and confectionary.

For every day necessities such as groceries, there are also shops within walking distance of the Highfield campus. Portswood is 10 minutes walk away and there are a number of convenience stores and a Post Office.

There is also a hairdressing salon on-campus for men and women called 'SHINE'. It offers a 10% discount for students and is located above the Students' Union Shop. They can be contacted by telephone on 02380 595060

#### Travel & Transport

Many students choose to buy a bicycle as a way to get around the city. It is a cheap means of transport, and they can be purchased second-hand (from a previous owner) and sold on when you leave. If you are looking for a second-hand bike look at the notice boards around the University and in shop windows. You could also check out the small ads on SUSSED the University of Southampton’s portal for staff and students. The University provides special secure areas on campus for students to leave their bikes. You will have to pay a small fee for this service.

UniLink run many buses to the city centre, halls of residence and different campuses at the University.

The National Rail website can provide information on local and national train routes.

National Express coaches run services to various London and Portsmouth from Highfield Campus.

Red Funnel Ferries run services from the Southampton Docks.

Greyhound Buses http://www.greyhounduk.com.

EOS
},{
  title: "Socialising in the UK",
  body: <<-EOS
~~
#### Students' Union Events
The Students' Union organises trips to places of interest throughout the year. You can book yourself on these trips on the Box Office website. There are also events for Postgraduates; contact the postgraduate officer for more details.

#### Clubs & Societies
One of the most important functions of the Union is to support student clubs and societies. You will find a club or society for almost any subject you care to mention - theatre, photography, juggling, all kinds of music, over 20 international societies, most kinds of dancing and many, many more. There are over 200 Societies and Sporting Clubs where you will find it easy to meet other students. You can check out the societies listings at www.susu.org/activities and http://www.susu.org/sport.

#### Community Volunteering
The Community Volunteering department provides opportunities for students to get involved in volunteering with local community organisations. A great way to make new friends, improve your English and enhance your CV! To find out more about the wide range of activities and projects the Community Volunteering Department run contact Jenna Boyce.

#### International Women's Club
The International Women’s Club is based at 43 University Rd. This informal club is run by a group of volunteers, and is open to all women associated with the University. Those from overseas are particularly welcome. The club offers companionship and aims to foster mutual understanding and friendship amongst women from all parts of the world. Meetings are held on Mondays and Wednesdays. Club activities include help with English conversation, talks, demonstrations, outings and social functions. Membership is currently £5.00 per academic year. Contact iwclub@soton.ac.uk to get involved.

#### English Classes
English Classes for all international students, staff and their partners take place in Meeting Room 1 (opposite the squash courts), Level 1, The Union - Building 44 on Tuesdays and Thursdays from 12:00 - 14:00 during term time.
EOS
},{
  title: "Your Family",
  body: <<-EOS
~~
#### Education & Schools for your dependant
Children of 4 years and over may attend a state school free of charge. If you have children aged between 4 and 16 the Local Authority (LA) will provide a place for them at a school near your home in Southampton.

In the UK there are infant schools for children aged 4 to 7, junior schools for children aged 7 to 11 and primary schools, which take children from both age groups, from 4 to 11.

From the age of 11 children in the UK attend secondary school, until they are 16. At 16 years old children can leave school, or they can choose to continue their studies at a sixth form college or college of Further Education. The type of school your child will attend depends on the age of the child and where you live. You may have to pay tuition fees if your child is 16 years or older.

The school year is divided into three terms, Autumn, Spring and Summer. In addition to the long holidays at Christmas, Easter and in the summer, there is a one-week holiday in each term known as half-term.

It is very important that you do not enrol your children in school unless they hold dependant status. Visitors are not permitted to receive free (state) education and may be seen as having breached their immigration conditions if they do so.

Further information about schools in Southampton can be found on the web at the Southampton City Council website.

#### Childcare for under-5s
Childcare for children under 5 is the responsibility of the local social services department who monitor the standards of local childcare providers. Childcare for children under 5 in the UK is usually provided either by a nursery, or a registered childminder (someone who looks after children in their own home).

A registered childminder can cost from around £4 per hour, per child. For help finding childcare, or for more information, visit the Southampton City Council website.

It is normal for parents to pay for childcare for pre-school children. Please note that it is against the law in the UK for children under the age of 14 to be left alone in the house or in sole charge of younger siblings.

Single parents or student couples may qualify for assistance with the cost of nursery fees if their children use the University Early Years Centre.

#### Early Years Centre
The children’s Early Years Centre is situated on the Highfield Campus. It provides childcare for the children of University staff and students from 4 months to 5 years old. There is a great demand for places in the Early Years Centre, and places cannot be guaranteed for all students’ children. Priority is given to single parents who are looking after children on their own, followed by the children of couples who are both students at the University. As at 2011/12 (fees reviewed annually in August), the fees are £17.60 per session for student parents.

The Early Years team may be contacted on EarlyYearsCentre@southampton.ac.uk or by telephone on 023 8059 3465

||Morning Session|Afternoon Session|
|---:|:---:|:---:|
|Staff Parent|£19.35|£19.35|
|Student Parent|£17.60|£17.60|
|Public|£21.00|£21.00|

EOS
},{
  title: "Finance Top Tips",
  body: <<-EOS
~~
1. **Make sure you budget**. Think about your income (eg maintenance loan and/or grant, bursaries, scholarship etc.) and think about your expenditure (eg rent, bills, food, insurance). Use a finance calculator to work out how much you have to spend.

2. **Think about getting a part-time job**. We recommend you work no more than 16 hours a week.

3. **Carefully consider which bank account you choose**. Never borrow money without checking the interest rate (these can be very high and you could end up owing a lot more money than you borrowed). Look for a bank account that offers an overdraft as the interest rates on these tend to be much lower, student accounts will often offer a free overdraft.

4. **When buying resources for your course, look into buying second hand text books** or use the library when you can.

5. **Check your bank statements regularly** and keep records of what you spend so you can keep an eye on your spending and see where you might be able to cut back in the future.

6. **Make the most of financial support that’s available to you**. Students from lower income households will be entitled to a bursary or fee waiver, and any student with financial difficulties can apply to the University’s hardship fund

7. **Avoid using store cards**, they tend to have a very high interest rate attached to them so can cost you a lot of money!

8. **Many shops and outlets offer a student discount**, make sure you use this when you can (10% may not seem like a lot, but it can make a real difference!)

9. **Go to the cash point once a week** so you avoid making daily trips (you can get your weekly allowance and take certain amounts out on different days of the week).

10. **Keep some money aside so you can go out and enjoy yourself!**

11. [Get in contact with The Advice Centre](mailto:advice@susu.org) if you are concerned about money or having finance issues, they’ll be able to help and will point you in the right direction.
EOS
},{
  title: "Staying Safe",
  body: <<-EOS
~~
![Keep your valuables safe](http://www.susu.org/images/valuables-safe.jpg)

Unfortunately students' homes can often be targets for burglaries.

Make sure valuables like laptops, ipods, printers and phones are kept out of sight and reach of windows and keep your windows and doors locked even when you are in your house.

If you have a car at university, make sure you don't leave valuables on display. Even the sucker mark from a sat nav could tempt thieves to break in, so make sure you wipe this mark off of your windscreen.

![Report anything suspicious](http://www.susu.org/images/report-suspicious.jpg)

Report anything suspicious to the police on **101** (if it's not an emergency) or phone **999** in an emergency.

You can also contact University Security if you're worried about something on campus: **023 8059 2811**

If you are the subject of a safety of security incident there are a number of support services available at the University, including the First Support Team who are a crisis service. You can find details of these services here: www.southampton.ac.uk/edusupport/wellbeing

The Advice Centre can also provide free and confidential advice on any issues and can be contacted on **023 8059 2085** or advice@susu.org.

![Keep your house fire safe](http://www.susu.org/images/fire-safe.jpg)

Staffordshire Fire and Rescue Service have made a [music video](http://www.youtube.com/watch?v=m0qOCBNwT-A) to remind you to test your smoke and fire alarms!

![Take the safe route home](http://www.susu.org/images/safe-route.jpg)

Take the Safety Bus home from The Union. It runs every night and will take you to your door for just £1.50.

Avoid walking home alone at night time and avoid using your mobile phone and/or ipod. Make sure you take well-lit main roads home rather than dark, quiet short cuts.

![Be aware of fraudulent emails](http://www.susu.org/images/beware-emails.jpg)

Sometimes you may receive fraudulent emails asking for your bank details or passwords.

Make sure you do not respond to these messages, as they are not legitimate. Banks will never ask for your password or details by email and neither will the University.

Also beware of recent fraudulent emails from people pretending to be Student Finance England.

![Student taxi scheme](http://www.susu.org/images/student-taxi.jpg)

Make sure you get home safe with the student taxi scheme. [Find out more here](http://blogs.susu.org/sabbs/2012/03/09/stay-safe/#content).

EOS
}]
