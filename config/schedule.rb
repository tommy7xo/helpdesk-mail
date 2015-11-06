every :hour do
  runner "MailParser.parse_emails(Rails.application.secrets.mail, Rails.application.secrets.password, Rails.application.secrets.url)"
end
