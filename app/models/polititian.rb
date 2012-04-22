class Polititian < ActiveRecord::Base
  has_and_belongs_to_many :materials
  
  validates_presence_of :name
end
