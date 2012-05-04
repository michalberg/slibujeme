class Polititian < ActiveRecord::Base
  has_and_belongs_to_many :materials
  
  validates_presence_of :name
end
# == Schema Information
# Schema version: 20120504093311
#
# Table name: polititians
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

