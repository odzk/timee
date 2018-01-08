ActionMailer::Base.smtp_settings = {
    :address => "smtp.muumuu-mail.com",
    :port => "587",
    :domain => "timee-online.com",
    :user_name => "info@timee-online.com",
    :password => "Enloop1234",
    :authentication => "plain",
    :enable_starttls_auto => true
}