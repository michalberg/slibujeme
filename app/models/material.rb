class Material < ActiveRecord::Base
  belongs_to :user
  belongs_to :election
  belongs_to :municipality
  belongs_to :party
  has_and_belongs_to_many :topics, :uniq => true
  has_and_belongs_to_many :polititians, :uniq => true
  has_many :image_assets
  has_many :video_assets
  has_many :url_assets
  accepts_nested_attributes_for :image_assets, :allow_destroy => true #, :reject_if => lambda { |a| a[:image].blank? }
  accepts_nested_attributes_for :video_assets, :allow_destroy => true, :reject_if => lambda { |video| video[:user_code].blank? }
  accepts_nested_attributes_for :url_assets, :allow_destroy => true, :reject_if => lambda { |video| video[:url].blank? }
  accepts_nested_attributes_for :user, :allow_destroy => false
  
  validates :municipality, :presence => true
  validates :election, :presence => true
  validates :party, :presence => true
  
  validate :has_at_least_one_asset_attached, :on => :create
  
  def has_at_least_one_asset_attached
    if 
      self.image_assets.reject(&:marked_for_destruction?).empty? and 
      self.video_assets.reject(&:marked_for_destruction?).empty? and
      self.url_assets.reject(&:marked_for_destruction?).empty?
      errors.add(:base, I18n.t("activerecord.errors.models.material.at_least_one_asset"))
    end
  end
end
