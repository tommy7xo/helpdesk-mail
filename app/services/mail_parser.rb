require 'gmail'
require 'net/http'
require 'json'
class MailParser

  def self.parse_emails(user, pass, uri)
    gmail = Gmail.new(user, pass) do |gmail|
      puts gmail.inbox.emails(:unread).first
      puts gmail.inbox.emails(:unread).first.message.to_json
      gmail.inbox.emails(:unread).each do |email|
        puts email.to_json
        url = URI.parse(uri)
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Post.new(url, {'Content-Type' =>'application/json'})
        request.body = email.to_json
        if http.request(request)
          puts 'true'
        else
          puts 'false'
        end
        email.mark(:read)
      end
    end
  end
end
