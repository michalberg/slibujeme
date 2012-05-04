class Party < ActiveRecord::Base
  validates :title, :presence => true
  validates :full_title, :presence => true, :if => 'displayed_value == "full_title"'
  has_many :materials
  
  def to_s
    if self.displayed_value? && respond_to?(self.displayed_value.to_sym)
      return send(self.displayed_value.to_sym)
    end
    self.title
  end
  
  def title_for_select
    str = title
    str += " (#{full_title})" unless full_title.nil?
    str
  end
end
# == Schema Information
# Schema version: 20120504093311
#
# Table name: parties
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  full_title      :string(255)
#  displayed_value :string(255)     default("title")
#

