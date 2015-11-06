require 'gmail'
require 'net/http'
require 'json'
class MailParser

  def self.parse_emails(user, pass, uri)
    Gmail.new(user, pass) do |gmail|
      gmail.inbox.emails(:unread).each do |email|
        from = email.message.from.to_s
        s[0] = ''
        s[0] = ''
        s[-1] = ''
        s[-1] = ''
        ticket = {
          ticket: {
            from:     from,
            subject:  email.message.subject.to_s,
            content:  email.message.body.to_s
          }
        }
        url = URI.parse(uri)
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Post.new(url, {'Content-Type' => 'application/json'})
        request.body = ticket.to_json
        http.request(request)

        email.mark(:read)
      end
    end
  end
end
