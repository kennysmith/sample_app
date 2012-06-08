EMAIL_RECEIVER_DEV_ENV = "contact@mhbweb.com"
SITE_ADMIN_EMAIL = "contact@mhbweb.com"

class DevelopmentMailInterceptor
   def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = EMAIL_RECEIVER_DEV_ENV
  end
end

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "mobchowwebapp.herokuapp.com/",
  :user_name            => "contact@mhbweb.com",
  :password             => "qwertyqwerty",
  :authentication       => "plain",
  :enable_starttls_auto => true
}


#if Rails.env != "production"
#  puts "All mails in non-production mode will be delivered to #{EMAIL_RECEIVER_DEV_ENV}, can be changed in 'config/initializers/setup_mail.rb' "
#  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
#end
