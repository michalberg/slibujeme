class VideoAsset < ActiveRecord::Base
  SERVICE_YOUTUBE = "youtube"
  SERVICE_VIMEO   = "vimeo"
  SERVICE_OTHER   = "other"
  
  # source: # http://stackoverflow.com/a/6382259/973047
  YOUTUBE_REGEX = /
    (?:youtube(?:-nocookie)?\.com\/
    (?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)
    ([^"&?\/ ]{11})
  /x
  VIMEO_REGEX = /(?:\w+.)?vimeo.com\/(?:video\/|moogaloop\.swf\?clip_id=)?(\d+)/
  
  belongs_to :material
  
  attr_accessible :user_code
  
  before_save :parse_video_id_and_type!
  
  def parse_video_id_and_type!
    if self.user_code.blank?
      raise "cannot parse video id if no code submitted"
    end
    
    if match_data = YOUTUBE_REGEX.match(self.user_code)
      self.video_id = match_data[1]
      self.video_service = SERVICE_YOUTUBE
    elsif match_data = VIMEO_REGEX.match(self.user_code)
      self.video_id = match_data[1]
      self.video_service = SERVICE_VIMEO
    else
      self.video_service = SERVICE_OTHER
    end
  end
end
