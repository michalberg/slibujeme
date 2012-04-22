class Municipality < ActiveRecord::Base
  has_ancestry :orphan_strategy => :restrict, :cache_depth => true
  has_many :materials
  
  validates_presence_of :title
  
  def full_title
    return "#{self.title} (okr. #{self.parent.title})" if self.depth == 2
    self.title
  end
end
