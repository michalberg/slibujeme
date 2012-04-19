class Material < ActiveRecord::Base
  belongs_to :user
  belongs_to :election
  belongs_to :municipality
  belongs_to :party
  has_and_belongs_to_many :topics, :uniq => true
  has_and_belongs_to_many :polititians, :uniq => true
  has_many :image_assets
  has_many :video_assets
  accepts_nested_attributes_for :image_assets, :allow_destroy => true #, :reject_if => lambda { |a| a[:image].blank? }
  accepts_nested_attributes_for :video_assets, :allow_destroy => true, :reject_if => lambda { |video| video[:user_code].blank? }
  accepts_nested_attributes_for :user, :allow_destroy => false
end
