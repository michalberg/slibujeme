imap = Net::IMAP.new('imap.gmail.com',993,true)
imap.login('slibujeme.app@gmail.com', 'pha3chuv')
imap.select('INBOX')
imap.search(["NOT", "DELETED"]).each do |message_id|
  mail = Mail.new(imap.fetch(message_id, "RFC822")[0][:attr]["RFC822"])
  MaterialReceiver.parse(mail)
  imap.store(message_id, "+FLAGS", [:Deleted])
end
imap.logout()
imap.disconnect()