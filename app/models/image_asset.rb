class ImageAsset < ActiveRecord::Base
  belongs_to :material
  has_attached_file :image, :styles => { :thumb => "220x220!" , :detail => "800x1200>" }
end
