# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
IssueTracker::Application.initialize!

# Load Library Dependencies
require_dependency "#{Rails.root}/lib/markdown_preview_renderer"
