class RepresentativeMailer < ActionMailer::Base
    default from: "noreply@susu.org"

    def contact_email(details)
        @body = details.body
        @from_user = details.from_user
        @to_user = details.to_user
        # mail(to: details.to_user.get_email_address, subject: details.subject, from: details.from_user)
        mail(to: "danplmr@gmail.com", subject: details.subject)
    end
end
