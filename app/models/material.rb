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
  
  
  before_save :create_new_party, :assign_polititians
  
  attr_accessor :party_name, :polititian_names
  
  scope :published, where(:not_finished => false)
  
  def polititian_names
    @polititian_names || polititians.map(&:name).join(',')
  end
  
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
      self.party = Party.find_or_create_by_title(@party_name)
    end
  end
  
  def assign_polititians
    unless @polititian_names.blank?
      names = @polititian_names.split(",").map{|person| person.strip }.uniq
      self.polititians = []
      names.each do |name|
        self.polititians << Polititian.find_or_initialize_by_name(name)
      end
    end
  end
end
# == Schema Information
# Schema version: 20120529072601
#
# Table name: materials
#
#  id              :integer         not null, primary key
#  election_id     :integer
#  municipality_id :integer
#  party_id        :integer
#  comment         :text
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  user_id         :integer
#  uploader_ip     :string(255)
#  not_finished    :boolean         default(FALSE)
#  in_selected_box :boolean         default(FALSE)
#

