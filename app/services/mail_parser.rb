require 'gmail'
class MailParser

  def self.parse_emails(user, pass, url)
    gmail = Gmail.new(user, pass)
    gmail.inbox.where(read: false).each do |message|
      send(message, url)
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
