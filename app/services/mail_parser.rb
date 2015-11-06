require 'gmail'
require 'net/http'
require 'json'
class MailParser

  def self.parse_emails(user, pass, uri)
    Gmail.new(user, pass) do |gmail|
      gmail.inbox.emails(:unread).each do |email|
        puts email.message.subject
        puts email.message.body
        puts email.message.from
        puts email.message.to_json
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


# {
#   "body":null,
#   "body_raw":"--047d7bfd01c6da6cc70523cb593a\r\nContent-Type: text/plain; charset=UTF-8\r\n\r\nZajbiesty ticket\r\n\r\n-- \r\nPozdrawiam,\r\nTomasz Bernaciak\r\n\r\n--047d7bfd01c6da6cc70523cb593a\r\nContent-Type: text/html; charset=UTF-8\r\n\r\nZajbiesty ticket\u003cspan\u003e\u003c/span\u003e\u003cbr\u003e\u003cbr\u003e-- \u003cbr\u003e\u003cdiv dir=\"ltr\"\u003ePozdrawiam,\u003cdiv\u003eTomasz Bernaciak\u003c/div\u003e\u003c/div\u003e\u003cbr\u003e\r\n\r\n--047d7bfd01c6da6cc70523cb593a--\r\n",
#   "separate_parts":true,
#   "text_part":null,
#   "html_part":null,
#   "errors":null,
#   "header":[
#     {
#       "charset":"UTF-8",
#       "name":"Return-Path",
#       "raw_value":"Return-Path: \u003ctommybernaciak@gmail.com\u003e",
#       "value":null,
#       "field_order_id":0
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Received",
#       "raw_value":"Received: by 10.182.42.198 with SMTP id q6csp474259obl;\r\n        Thu, 5 Nov 2015 05:46:16 -0800 (PST)",
#       "value":null,
#       "field_order_id":1
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Received",
#       "raw_value":"Received: from mail-lb0-x22c.google.com (mail-lb0-x22c.google.com. [2a00:1450:4010:c04::22c])\r\n        by mx.google.com with ESMTPS id l13si4255824lfg.12.2015.11.05.05.46.16\r\n        for \u003ctestmailtommy7@gmail.com\u003e\r\n        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);\r\n        Thu, 05 Nov 2015 05:46:16 -0800 (PST)",
#       "value":null,
#       "field_order_id":1
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Received",
#       "raw_value":"Received: by mail-lb0-x22c.google.com with SMTP id kw15so28971576lbb.0\r\n        for \u003ctestmailtommy7@gmail.com\u003e; Thu, 05 Nov 2015 05:46:16 -0800 (PST)",
#       "value":null,
#       "field_order_id":1
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Received",
#       "raw_value":"Received: by 10.114.5.101 with HTTP; Thu, 5 Nov 2015 05:46:16 -0800 (PST)",
#       "value":null,
#       "field_order_id":1
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Date",
#       "raw_value":"Date: Thu, 5 Nov 2015 14:46:16 +0100",
#       "value":null,
#       "field_order_id":9
#     },
#     {
#       "charset":"UTF-8",
#       "name":"From",
#       "raw_value":"From: Tomasz Bernaciak \u003ctommybernaciak@gmail.com\u003e",
#       "value":null,
#       "field_order_id":10
#     },
#     {
#       "charset":"UTF-8",
#       "name":"To",
#       "raw_value":"To: testmailtommy7@gmail.com",
#       "value":null,
#       "field_order_id":13
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Message-ID",
#       "raw_value":"Message-ID: \u003cCAD-w9F3mNx58TjKsCCZ2vTdx1AG_YNidkPNK94CZMs0G3OiKsQ@mail.gmail.com\u003e",
#       "value":null,
#       "field_order_id":16
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Subject",
#       "raw_value":"Subject: Ticket",
#       "value":null,
#       "field_order_id":19
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Mime-Version",
#       "raw_value":"MIME-Version: 1.0",
#       "value":null,
#       "field_order_id":22
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Content-Type",
#       "raw_value":"Content-Type: multipart/alternative; boundary=047d7bfd01c6da6cc70523cb593a",
#       "value":"multipart/alternative; boundary=047d7bfd01c6da6cc70523cb593a",
#       "field_order_id":23,
#       "field":{
#         "charset":"UTF-8",
#         "main_type":"multipart",
#         "sub_type":null,
#         "parameters":null,
#         "name":"Content-Type",
#         "length":null,
#         "tree":null,
#         "element":{
#           "main_type":"multipart",
#           "sub_type":"alternative",
#           "parameters":[
#             {
#               "boundary":"047d7bfd01c6da6cc70523cb593a"
#             }
#           ]
#         },
#         "value":"multipart/alternative; boundary=047d7bfd01c6da6cc70523cb593a"
#       }
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Delivered-To",
#       "raw_value":"Delivered-To: testmailtommy7@gmail.com",
#       "value":null,
#       "field_order_id":100
#     },
#     {
#       "charset":"UTF-8",
#       "name":"X-Received",
#       "raw_value":"X-Received: by 10.25.21.154 with SMTP id 26mr649642lfv.61.1446731176735;\r\n        Thu, 05 Nov 2015 05:46:16 -0800 (PST)",
#       "value":null,
#       "field_order_id":100
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Received-SPF",
#       "raw_value":"Received-SPF: pass (google.com: domain of tommybernaciak@gmail.com designates 2a00:1450:4010:c04::22c as permitted sender) client-ip=2a00:1450:4010:c04::22c;",
#       "value":null,
#       "field_order_id":100
#     },
#     {
#       "charset":"UTF-8",
#       "name":"Authentication-Results",
#       "raw_value":"Authentication-Results: mx.google.com;\r\n       spf=pass (google.com: domain of tommybernaciak@gmail.com designates 2a00:1450:4010:c04::22c as permitted sender) smtp.mailfrom=tommybernaciak@gmail.com;\r\n       dkim=pass header.i=@gmail.com;\r\n       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com",
#       "value":null,
#       "field_order_id":100
#     },
#     {
#       "charset":"UTF-8",
#       "name":"DKIM-Signature",
#       "raw_value":"DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=20120113;\r\n        h=mime-version:date:message-id:subject:from:to:content-type;\r\n        bh=XhL3MVEzLJ7q1CHXqmEIrWNIa85y7bb5t9W+UYQvrn8=;\r\n        b=O6rL8QeukBffN05CLKwV5LSWhajw2AcxedR0Sri7oa5IVfP2DlYWqjEb7JtZRPTrjH\r\n         dTt+m+nEuzLPB+eZc46qWHBGzvBDRRTpp/u0bMprUwanModhWxypq+2aJ0jlbVuxRkJJ\r\n         s5DDpDEH5wgZok+X7Z3xYGP4BhynpQLQP8C0T3iXBandpCADM0KptLwcMmDdw1RUp9Pm\r\n         3pbroxsZUxKLDljTOE2A1E8ccnEnLUBAHqlf+PF7hOTv6cOY1OWFVs56KvDQNS5R+kUP\r\n         qlfTKniC4qq6JjbYE/P0tdxdNe1Yp8jXY6CR10RrEjHM86IOK9KFn9pt7nGke4JFpCYM\r\n         NNeA==",
#       "value":null,
#       "field_order_id":100
#     },
#     {
#       "charset":"UTF-8",
#       "name":"X-Received",
#       "raw_value":"X-Received: by 10.112.118.39 with SMTP id kj7mr4007764lbb.77.1446731176371;\r\n Thu, 05 Nov 2015 05:46:16 -0800 (PST)",
#       "value":null,
#       "field_order_id":100
#     }
#   ],
#   "charset":"UTF-8",
#   "defaulted_charset":true,
#   "smtp_envelope_from":null,
#   "smtp_envelope_to":null,
#   "perform_deliveries":true,
#   "raise_delivery_errors":true,
#   "delivery_handler":null,
#   "delivery_method":{
#     "settings":{
#       "address":"localhost",
#       "port":25,
#       "domain":"localhost.localdomain",
#       "user_name":null,
#       "password":null,
#       "authentication":null,
#       "enable_starttls_auto":true,
#       "openssl_verify_mode":null,
#       "ssl":null,
#       "tls":null
#     }
#   },
#   "transport_encoding":{},
#   "mark_for_delete":false,
#   "raw_source":"Delivered-To: testmailtommy7@gmail.com\r\nReceived: by 10.182.42.198 with SMTP id q6csp474259obl;\r\n        Thu, 5 Nov 2015 05:46:16 -0800 (PST)\r\nX-Received: by 10.25.21.154 with SMTP id 26mr649642lfv.61.1446731176735;\r\n        Thu, 05 Nov 2015 05:46:16 -0800 (PST)\r\nReturn-Path: \u003ctommybernaciak@gmail.com\u003e\r\nReceived: from mail-lb0-x22c.google.com (mail-lb0-x22c.google.com. [2a00:1450:4010:c04::22c])\r\n        by mx.google.com with ESMTPS id l13si4255824lfg.12.2015.11.05.05.46.16\r\n        for \u003ctestmailtommy7@gmail.com\u003e\r\n        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);\r\n        Thu, 05 Nov 2015 05:46:16 -0800 (PST)\r\nReceived-SPF: pass (google.com: domain of tommybernaciak@gmail.com designates 2a00:1450:4010:c04::22c as permitted sender) client-ip=2a00:1450:4010:c04::22c;\r\nAuthentication-Results: mx.google.com;\r\n       spf=pass (google.com: domain of tommybernaciak@gmail.com designates 2a00:1450:4010:c04::22c as permitted sender) smtp.mailfrom=tommybernaciak@gmail.com;\r\n       dkim=pass header.i=@gmail.com;\r\n       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com\r\nReceived: by mail-lb0-x22c.google.com with SMTP id kw15so28971576lbb.0\r\n        for \u003ctestmailtommy7@gmail.com\u003e; Thu, 05 Nov 2015 05:46:16 -0800 (PST)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=20120113;\r\n        h=mime-version:date:message-id:subject:from:to:content-type;\r\n        bh=XhL3MVEzLJ7q1CHXqmEIrWNIa85y7bb5t9W+UYQvrn8=;\r\n        b=O6rL8QeukBffN05CLKwV5LSWhajw2AcxedR0Sri7oa5IVfP2DlYWqjEb7JtZRPTrjH\r\n         dTt+m+nEuzLPB+eZc46qWHBGzvBDRRTpp/u0bMprUwanModhWxypq+2aJ0jlbVuxRkJJ\r\n         s5DDpDEH5wgZok+X7Z3xYGP4BhynpQLQP8C0T3iXBandpCADM0KptLwcMmDdw1RUp9Pm\r\n         3pbroxsZUxKLDljTOE2A1E8ccnEnLUBAHqlf+PF7hOTv6cOY1OWFVs56KvDQNS5R+kUP\r\n         qlfTKniC4qq6JjbYE/P0tdxdNe1Yp8jXY6CR10RrEjHM86IOK9KFn9pt7nGke4JFpCYM\r\n         NNeA==\r\nMIME-Version: 1.0\r\nX-Received: by 10.112.118.39 with SMTP id kj7mr4007764lbb.77.1446731176371;\r\n Thu, 05 Nov 2015 05:46:16 -0800 (PST)\r\nReceived: by 10.114.5.101 with HTTP; Thu, 5 Nov 2015 05:46:16 -0800 (PST)\r\nDate: Thu, 5 Nov 2015 14:46:16 +0100\r\nMessage-ID: \u003cCAD-w9F3mNx58TjKsCCZ2vTdx1AG_YNidkPNK94CZMs0G3OiKsQ@mail.gmail.com\u003e\r\nSubject: Ticket\r\nFrom: Tomasz Bernaciak \u003ctommybernaciak@gmail.com\u003e\r\nTo: testmailtommy7@gmail.com\r\nContent-Type: multipart/alternative; boundary=047d7bfd01c6da6cc70523cb593a\r\n\r\n--047d7bfd01c6da6cc70523cb593a\r\nContent-Type: text/plain; charset=UTF-8\r\n\r\nZajbiesty ticket\r\n\r\n-- \r\nPozdrawiam,\r\nTomasz Bernaciak\r\n\r\n--047d7bfd01c6da6cc70523cb593a\r\nContent-Type: text/html; charset=UTF-8\r\n\r\nZajbiesty ticket\u003cspan\u003e\u003c/span\u003e\u003cbr\u003e\u003cbr\u003e-- \u003cbr\u003e\u003cdiv dir=\"ltr\"\u003ePozdrawiam,\u003cdiv\u003eTomasz Bernaciak\u003c/div\u003e\u003c/div\u003e\u003cbr\u003e\r\n\r\n--047d7bfd01c6da6cc70523cb593a--\r\n"
# }
