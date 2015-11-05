require 'gmail'
require 'net/http'
require 'json'
class MailParser

  def self.parse_emails(user, pass, uri)
    Gmail.new(user, pass) do |gmail|
      gmail.inbox.emails(:unread).each do |email|
        puts email.message.to_json
        # url = URI.parse(uri)
        # http = Net::HTTP.new(url.host, url.port)
        # request = Net::HTTP::Post.new(url, {'Content-Type' =>'application/json'})
        # request.body = email.to_json
        # http.request(request)
        email.mark(:read)
      end
    end
  end
end
