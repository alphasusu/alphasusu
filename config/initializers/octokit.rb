Rails.application.config.after_initialize do
    Octokit.configure do |o|
        o.login = Rails.application.config.github_username
        o.password = Rails.application.config.github_api_token
    end
end