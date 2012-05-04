class Municipality < ActiveRecord::Base
  has_ancestry :orphan_strategy => :restrict, :cache_depth => true
  has_many :materials
  
  validates_presence_of :title
  
  def full_title
    return "#{self.title} (okr. #{self.parent.title})" if self.depth == 2
    self.title
  end
end
# == Schema Information
# Schema version: 20120504093311
#
# Table name: municipalities
#
#  id             :integer         not null, primary key
#  title          :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  ancestry       :string(255)
#  code           :string(255)
#  gps_lat        :float
#  gps_lng        :float
#  ancestry_depth :integer         default(0)
#
# Indexes
#
#  index_municipalities_on_ancestry  (ancestry)
#

