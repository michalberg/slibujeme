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
