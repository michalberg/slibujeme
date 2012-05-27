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
  
  with_options :unless => :not_finished do |finished|
    finished.validates :municipality, :presence => true
    finished.validates :election, :presence => true
    finished.validates :party, :presence => true, :if => "self.party_name.nil?"
    finished.validates :uploader_ip, :presence => true
    finished.validate :has_at_least_one_asset_attached, :on => :create
  end
  
  after_save :create_new_party
  
  attr_accessor :party_name
  
  def has_at_least_one_asset_attached
    if 
      self.image_assets.reject(&:marked_for_destruction?).empty? and 
      self.video_assets.reject(&:marked_for_destruction?).empty? and
      self.url_assets.reject(&:marked_for_destruction?).empty?
      errors.add(:base, I18n.t("activerecord.errors.models.material.at_least_one_asset"))
    end
  end
  
  def create_new_party
    unless @party_name.blank?
      p = Party.find_or_create_by_title(@party_name)
      self.update_column(:party_id, p.id) 
    end
  end
end
# == Schema Information
# Schema version: 20120505093603
#
# Table name: materials
#
#  id              :integer         not null, primary key
#  election_id     :integer
#  municipality_id :integer
#  party_id        :integer
#  topics          :text
#  polititians     :text
#  comment         :text
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  user_id         :integer
#  uploader_ip     :string(255)
#

