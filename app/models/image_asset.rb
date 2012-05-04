class ImageAsset < ActiveRecord::Base
  belongs_to :material
  has_attached_file :image, :styles => { :thumb => "220x220!" , :detail => "800x1200>" }
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/x-png', 'image/gif', 'application/pdf']
  def image_url(size = :thumb)
    image.url(size)
  end

  def is_image?
    ["image/gif", "image/jpg", "image/x-png", "image/png", "image/jpeg"].include?(self.image_content_type)
  end
end
