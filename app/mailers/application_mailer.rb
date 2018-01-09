#メールの設定(どのメールから送るかなど)

class ApplicationMailer < ActionMailer::Base
  default from: "info@timee-online.com"
  layout 'mailer'
end
