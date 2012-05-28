class ImageAsset < ActiveRecord::Base
  belongs_to :material
  has_attached_file :image, :styles => { 
    :thumb => {:quality => 100, :geometry => "220x220>", :processors => [:entropy_crop_thumbnail, :thumbnail]}, 
    :detail => { :geometry => "800x1200>"}
  }
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/x-png', 'image/gif', 'application/pdf']
  def image_url(size = :thumb)
    image.url(size)
  end

  def is_image?
    ["image/gif", "image/jpg", "image/x-png", "image/png", "image/jpeg"].include?(self.image_content_type)
  end
end
# == Schema Information
# Schema version: 20120504093311
#
# Table name: image_assets
#
#  id                 :integer         not null, primary key
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  material_id        :integer
#

