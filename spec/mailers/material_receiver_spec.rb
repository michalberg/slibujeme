# encoding: utf-8
require "spec_helper"

describe MaterialReceiver do
  it "parses a message with photos from mailbox into empty material" do
    user = create(:user)
    mail = Mail.new do
      from  user.email
      subject "Nový materiál"
      body %Q{Tělo mailu}
      add_file Rails.root.join("factories/files/image_asset_fixture.png").to_s
    end
    
    MaterialReceiver.parse(mail)
    Material.count.should eql(1)
    Material.last.image_assets.count.should eql(1)
  end
end
