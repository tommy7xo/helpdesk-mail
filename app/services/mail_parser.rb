require 'gmail'
require 'net/http'
require 'json'
class MailParser

  def self.parse_emails(user, pass, uri)
    Gmail.new(user, pass) do |gmail|
      gmail.inbox.emails(:unread).each do |email|
        ticket = {
          ticket: {
            from:     email.message.from.to_s,
            subject:  email.message.subject.to_s,
            content:  email.message.body.to_s
          }
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


# MailParser.parse_emails("testmailtommy7@gmail.com", "lolopolo123", "http://swos-helpdesk.herokuapp.com/tickets")
