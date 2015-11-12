#encoding: utf-8

require 'gmail'
require 'net/http'
require 'json'
class MailParser

  def self.parse_emails(user, pass, uri)
    Gmail.new(user, pass) do |gmail|
      gmail.inbox.emails(:unread).each do |email|
        ticket = {
          ticket: {
            from:     from_format(email.message.from.to_s).force_encoding("UTF-8"),
            subject:  email.message.subject.to_s.force_encoding("UTF-8"),
            content:  email.message.html_part.body.to_s.force_encoding("UTF-8")
          }
        }
        request(ticket, uri)
        email.mark(:read)
      end
    end
  end

  def self.request(message, uri)
    url = URI.parse(uri)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url, {'Content-Type' => 'application/json'})
    request.body = message.to_json
    http.request(request)
  end

  def self.from_format(email)
    email[0..1] = ''
    email[-2..-1] = ''
    return email
  end
end

