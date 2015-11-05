require 'gmail'
class MailParser

  def self.parse_emails(user, pass, url)
    gmail = Gmail.new(user, pass)
    puts gmail.inbox.count
    puts gmail.inbox.count(:unread)
    gmail.inbox.emails(:unread).each do |message|
      send(message, url)
      message.mark(:read)
    end
    gmail.logout
  end

  def send(message, url)
    url = URI.parse(url)
    http = Net::HTTP.new(url.host, url.port)
    #http.use_ssl = true
    request = Net::HTTP::Post.new(url.path, {'Content-Type' =>'application/json'})
    request.body = message.to_json
    http.request(request)
  end

end
