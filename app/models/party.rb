class Party < ActiveRecord::Base
  validates_presence_of :title
  has_many :materials
end
