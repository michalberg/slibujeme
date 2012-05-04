class UrlAsset < ActiveRecord::Base
  belongs_to :material
  validates_format_of :url, :with => URI::regexp(%w(http https))
  
  before_save :scrape_url_content!
  
  def scrape_url_content!
    require "open-uri"
    self.url_content = open("#{self.url}") {|f| raw_data = f.read() }
    return true
  end
end
# == Schema Information
# Schema version: 20120504093311
#
# Table name: url_assets
#
#  id          :integer         not null, primary key
#  url         :string(255)
#  material_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  url_content :text
#

