# Load the Rails application.
require File.expand_path('../application', __FILE__)
#require '~/.envrc'
# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings ={
    :user_name => 'flywheeldev',
    :password => ENV["SENDGRID_PASSWORD"],
    :domain => 'getflywheel.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
    
