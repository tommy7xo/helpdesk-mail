#encoding: utf-8

task :create_tickets => :environment do
  MailParser.parse_emails(Rails.application.secrets.mail, Rails.application.secrets.password, Rails.application.secrets.url)
end
