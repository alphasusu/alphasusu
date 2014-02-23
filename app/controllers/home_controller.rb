class HomeController < ApplicationController
  before_action :set_site_area
  skip_authorization_check

  def index
    @headlines = Headline.all
    @posts = BlogPost.find(:all, :limit => 3)
    @events = Event.find(:all, :limit => 5)
    authorize! :read, @headlines
    authorize! :read, @posts
    authorize! :read, @events
  end

  def about
    @issues = sort_issues(Octokit.issues 'alphasusu/alphasusu')
  end

  def create_issue
    require_login
    title = params[:title]
    body = "#{params[:body]}\n\nCreate by #{current_user.name} via Alpha SUSU."
    Octokit.create_issue 'alphasusu/alphasusu', title, body, { labels: "site submitted" }
    redirect_to about_path, notice: "Submitted issue. Thank you for your contribution."
  end

private

  def sort_issues(issues)
    sorted = { in_progress: [], assigned: [], other: [] }
    issues.each do |issue|
      if has_pull_request(issue)
        sorted[:in_progress] << issue
      elsif is_assigned(issue)
        sorted[:assigned] << issue
      else
        sorted[:other] << issue
      end
    end
    sorted
  end

  def has_pull_request(issue)
    !issue[:pull_request].rels[:html].nil?
  end

  def is_assigned(issue)
    !issue[:assignee].nil?
  end

end
