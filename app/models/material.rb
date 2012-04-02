class Material < ActiveRecord::Base
  belongs_to :election
  belongs_to :municipality
  belongs_to :party
end
