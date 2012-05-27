class MaterialReceiver < ActionMailer::Base
  default from: "slibujeme.app@gmail.com"
  
  def self.parse(email)
    material = Material.new
    
    # assign to user
    user = User.find_by_email(email.from[0])
    user = User.new(:email => email.from[0], :password => Devise.friendly_token.first(6)) unless user
    material.user = user

    # get image attachments
    email.attachments.each do | attachment |
      # Attachments is an AttachmentsList object containing a
      # number of Part objects
      if (attachment.content_type.start_with?('image/'))
        # extracting images for example...
        file = StringIO.new(attachment.decoded)
        file.class.class_eval { attr_accessor :original_filename, :content_type }
        file.original_filename = attachment.filename
        file.content_type = attachment.mime_type
        
        asset = ImageAsset.new
        asset.image = file
        material.image_assets << asset
      end
    end
    
    # tag as incomplete
    material.not_finished = true
    
    # save
    material.save!
    
    # notify user about newly created attachment
    MaterialNotifier.materials_user_created_from_email(material, user).deliver
  end
end
