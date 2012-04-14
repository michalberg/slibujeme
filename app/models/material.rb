class Material < ActiveRecord::Base
  belongs_to :election
  belongs_to :municipality
  belongs_to :party
  has_and_belongs_to_many :topics, :uniq => true
end
