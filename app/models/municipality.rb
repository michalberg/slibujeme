class Municipality < ActiveRecord::Base
  has_ancestry
  
  def full_title
    return "#{self.title} (okr. #{self.parent.title})" if self.depth == 2
    self.title
  end
end
