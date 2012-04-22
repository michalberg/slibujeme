class UrlAsset < ActiveRecord::Base
  belongs_to :material
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
