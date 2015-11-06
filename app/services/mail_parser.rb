require 'gmail'
require 'net/http'
require 'json'
class MailParser

  def self.parse_emails(user, pass, uri)
    Gmail.new(user, pass) do |gmail|
      gmail.inbox.emails(:unread).each do |email|
        ticket = {
          from:     email.message.from,
          subject:  email.message.subject,
          content:  email.message.body
        }
        puts ticket.to_json
        url = URI.parse(uri)
        # http = Net::HTTP.new(url.host, url.port)
        # request = Net::HTTP::Post.new(url, {'Content-Type' =>'application/json'})
        # request.body = email.to_json
        # http.request(request)


        #email.mark(:read)
      end
    end
  end
end
