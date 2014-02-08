class RepresentativeMailer < ActionMailer::Base
    default from: "noreply@susu.org"

    def contact_email(details)
        @body = details.body
        mail(to: details.to_user.get_email_address, subject: details.subject, from: details.from_user)
    end
end
