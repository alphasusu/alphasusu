IssueTracker::Application.routes.draw do

  resources :messages

  devise_for :ldap_users, :local_users, skip: [ :sessions ]
  
  devise_scope :local_user do
    get 'login' => 'sessions#new', :as => :new_session
    post 'login' => 'sessions#create', :as => :create_session
    delete 'logout' => 'sessions#destroy', :as => :destroy_session
  end

  resources :societies
  resources :issues
  resources :blog_posts
  resources :events
  resources :services
  resources :places
  resources :articles
  resources :headlines
  resources :menus
  resources :courses
  resources :messages, :except => :new

  scope :messages do
    post '/new' => 'messages#new'
  end
  
  scope '/profile' do
    get '/' => 'profiles#me', :as => :profile
    get '/:id' => 'profiles#show'
    get '/:id/edit' => 'profiles#edit', :as => :edit_profile
    put '/:id' => 'profiles#update', :as => :update_profile
    delete '/:id' => 'profiles#destroy', :as => :delete_profile
  end

  get '/help', to: 'help#index'
  get '/help/chat', to: 'help#chat'
  get '/help/support', to: 'help#support'
  get '/help/agent', to: 'help#support_chat'
  get '/activities', to: 'home#activities'
  get '/democracy', to: 'democracy#index'
  
  root 'home#index'

  # LEGACY REDIRECTS

  # What's On
  get '/boxoffice', to: redirect('http://boxoffice.susu.org')
  get '/eat', to: redirect('http://www.susu.org/whats-on-and-where/eat-drink-shop/2012/index.html')
  get '/feeds', to: redirect('http://www.susu.org/whats-on-and-where/feeds')
  get '/graduationball', to: redirect('http://www.susu.org/whats-on-and-where/graduation-ball/2012/index.html')
  get '/openingtimes', to: redirect('http://www.susu.org/whats-on-and-where/2012/opening-times.html')
  get '/roombookings', to: redirect('http://bookings.susu.org/')
  get '/safetybus', to: redirect('http://www.susu.org/whats-on-and-where/safety-bus.html')
  get '/unionfilms', to: redirect('http://www.unionfilms.org/')
  
  #Education
  get '/education', to: redirect('http://www.susu.org/education')
  get '/coursereps', to: redirect('http://www.susu.org/education/2012/find-your-rep.html')
  get '/academicadvice', to: redirect('http://www.susu.org/education/2012/academic-advice.html')
  get '/representation', to: redirect('http://www.susu.org/education/2012/student-representation.html')
  get '/runinanelection', to: redirect('http://www.susu.org/education/2012/run-in-an-election.html')
  get '/nominate', to: redirect('http://www.susu.org/reps')

  # Union
  get '/generalmeeting', to: redirect('http://www.susu.org/running-your-union/general-meeting/2012/index.html')
  get '/unioncouncil', to: redirect('http://www.susu.org/running-your-union/2013/union-council.html')
  get '/committeemeetings', to: redirect('http://www.susu.org/meetings')
  get '/unionawards', to: redirect('http://www.susu.org/running-your-union/union-awards/2012/index.html')
  get '/elections', to: redirect('http://www.susu.org/running-your-union/elections/2013/index.html')
  get '/policy', to: redirect('http://blogs.susu.org/policy')
  get '/officers', to: redirect('http://www.susu.org/running-your-union/your-officers/2013/index.html')
  get '/zones', to: redirect('http://www.susu.org/running-your-union/zones/')

  # Clubs and Socs
  get '/hallslife', to: redirect('http://www.susu.org/something-for-everyone/halls/')
  get '/media', to: redirect('http://www.susu.org/something-for-everyone/media/2012/index.html')
  get '/performingarts', to: redirect('http://perform.susu.org/')
  get '/presessional', to: redirect('http://www.susu.org/something-for-everyone/pre-sessional/2013/index.html')
  get '/rag', to: redirect('http://www.susu.org/something-for-everyone/rag/2012/index.html')
  get '/societies', to: redirect('http://www.susu.org/something-for-everyone/societies/2012/index.html')
  get '/sports', to: redirect('http://www.susu.org/something-for-everyone/sports/2012/index.html')
  get '/unionsfilms', to: redirect('http://www.unionfilms.org/about/get-involved.html')
  get '/skills', to: redirect('http://www.susu.org/your-skills')

  # Help and Support
  get '/advicecentre', to: redirect('http://www.susu.org/help-and-support/advice-centre/2012/index.html')
  get '/overseasstudents', to: redirect('http://www.susu.org/help-and-support/international/2012/index.html')
  get '/finances', to: redirect('http://www.susu.org/help-and-support/finances/2012/index.html')
  get '/nightline', to: redirect('http://nightline.susu.org/')
  get '/housing', to: redirect('http://www.susu.org/help-and-support/housing/2013/index.html')
  get '/stayingsafe', to: redirect('http://www.susu.org/help-and-support/safety/2012/index.html')
  get '/safetybus', to: redirect('http://www.susu.org/whats-on-and-where/2012/safety-bus.html')

  # Elections
  get '/elections/spring', to: redirect('http://www.susu.org/making-a-difference/elections/2013/spring/index.html')
  get '/jcr', to: redirect('http://www.susu.org/making-a-difference/elections/2013/jcr/')
  get '/elections/autumn', to: redirect('http://www.susu.org/making-a-difference/elections/2013/autumn/')
  get '/coursereps', to: redirect('http://www.coursereps.soton.ac.uk/')

end
