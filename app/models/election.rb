class Election < ActiveRecord::Base
  has_many :materials
  validates :title, :presence => true
  validates :from, :presence => true
  validates :to, 
            :presence => true,
            :date => { 
              :after => :from, 
              :message => I18n.t('activerecord.errors.models.election.attributes.to.before_from')
            }
            
  scope :running, lambda {
    where("\"from\" <= ? and \"to\" >= ?", Date.today, Date.today)
  }
end
# == Schema Information
# Schema version: 20120505093603
#
# Table name: elections
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  from       :date
#  to         :date
#

