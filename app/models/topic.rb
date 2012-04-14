class Topic < ActiveRecord::Base
  has_ancestry
  has_and_belongs_to_many :materials, :uniq => true
end
