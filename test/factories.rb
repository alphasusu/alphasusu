FactoryGirl.define do

    factory :academic_unit do
        name 'Electronics and Computer Science'
        faculty
    end

    factory :article do
        title 'Test Blog Article'
        body 'Lorem ipsum dolor sit amet.'
        slug 'test-blog-article'
        type 'Article'
    end

    factory :blog_post do
        title 'Test Blog Post'
        body 'Lorem ipsum dolor sit amet.'
        slug 'test-blog-post'
        user
    end

    factory :committee_membership do
        officer
        subcommittee
    end

    factory :contact_element do
        type 'ContactElement'
        value 'Contact Element'
        service
    end

    factory :course do
        name 'Computer Science'
        academic_unit
    end

    factory :event do
        title 'Test Event'
        description 'Lorem ipsum dolor sit amet.'
        date Date.new
        place
        sug 'test-event'
    end

    factory :faculty do
        name 'Faculty of Physical Sciences and Engineering'
    end

    factory :headline do
        title 'SUSU News Item'
        body 'Lorem Ipsum Dolor Sit Amet'
    end

    factory :menu_category do
        name 'Test Category'
        menu
    end

    factory :menu_item do
        name 'Test Menu Item'
        menu_category
        price 12.34
        description 'Lorem ipsum dolor sit amet.'
        additional_info 'Addition lorem ipsum dolor sit amet.'
    end

    factory :menu do
        place
    end

    factory :message do
        subject 'Test Message Subject'
        body 'Test Message Body'
        from_user
        to_user
    end

    factory :officer do
        title 'Union President'
        user
        type 'Officer'
        course
        year '2'
        faculty
        academic_unit
    end

    factory :opening_time do
        vacation false
        day 1
        open 900
        close 1700
        schedule
        service_start 930
    end

    factory :permission do
        user
        subject_class 'Permission'
        action 'manage'
    end

    factory :place do
        name 'The Stags Head'
        description 'Lorem ipsum dolor sit amet.'
        latitude 50.93475
        longitude -1.39739
        shown true
        slug 'the-stags-head'
    end

    factory :schedule do
        place
    end

    factory :service do
        name 'The Safety Bus'
        description 'Lorem ipsum dolor sit amet'
        location 'The Concourse'
        slug 'the-safety-bus'
    end

    factory :society do
        name 'The Extreme Ironing Society'
        descrition 'Lorem ipsum dolor sit amet.'
        slug 'the-extreme-ironing-society'
    end

    factory :subcommittee do
        name 'Test Subcommittee'
        zone
    end

    factory :support_team do
        name 'SUSU Staff Support'
        description 'Help from the SUSU staff.'
    end

    factory :support_teams_user do
        user
        support_team
    end

    factory :tag_link do
        article
        tag
    end

    factory :tag do
        name 'Test Tag'
    end

    factory :user do
        type 'User'
        email 'test@example.com'
        elevated false
        first_name 'John'
        last_name 'Smith'
        course
        year '2'
    end

    factory :zone do
        name 'Test Zone'
        officer
    end

end