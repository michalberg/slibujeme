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
