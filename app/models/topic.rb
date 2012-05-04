class Topic < ActiveRecord::Base
  has_ancestry
  has_and_belongs_to_many :materials, :uniq => true
  
  validates_presence_of :title
end
# == Schema Information
# Schema version: 20120504093311
#
# Table name: topics
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  ancestry   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

