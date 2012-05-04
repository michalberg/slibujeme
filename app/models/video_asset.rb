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
  
  attr_accessible :user_code, :thumbnail
  
  before_save :parse_video_id_and_type!, :scrape_video_thumbnail!
  
  has_attached_file :thumbnail, :styles => { :thumb => "220x220!" , :detail => "640x385>" }
  
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
  
  def scrape_video_thumbnail!
    require "open-uri"
    if self.video_service == SERVICE_YOUTUBE
      url = "http://img.youtube.com/vi/#{self.video_id}/0.jpg"
    elsif self.video_service == SERVICE_VIMEO
      raw_data = open("http://vimeo.com/api/v2/video/#{self.video_id}.json") {|f| raw_data = f.read() }
      data = JSON.parse(raw_data)
      url = data.shift["thumbnail_large"]
    else
      return true
    end
    io = open(url)
    def io.original_filename
      "thumb.png"
    end
    self.thumbnail = io
    return true
  end
end
# == Schema Information
# Schema version: 20120504093311
#
# Table name: video_assets
#
#  id                     :integer         not null, primary key
#  user_code              :text
#  video_id               :string(255)
#  video_service          :string(255)
#  material_id            :integer
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  thumbnail_file_name    :string(255)
#  thumbnail_content_type :string(255)
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#

