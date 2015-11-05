require 'gmail'
class MailParser

  def self.parse_emails(user, pass, url)
    gmail = Gmail.new(user, pass) do |gmail|
      puts gmail.inbox.emails(:unread).first
      gmail.inbox.emails(:unread).each do |email|
        send_ticket(email, url)
        email.mark(:read)
      end
    end
  end

  def self.send_ticket(data, url)
    puts data
    puts data.to_json
    url = URI.parse(url)
    http = Net::HTTP.new(url.host, url.port)
    #http.use_ssl = true
    request = Net::HTTP::Post.new(url.path, {'Content-Type' =>'application/json'})
    request.body = data.to_json
    if http.request(request)
      puts 'true'
    else
      puts 'false'
    end
  end

end
