require 'spec_helper'

describe VideoAsset do
  context "#parse_video_id_and_type!" do
    it "raises error when trying to parse with blank user_code" do
      asset = VideoAsset.new
      expect { asset.parse_video_id_and_type! }.to raise_error("cannot parse video id if no code submitted")
    end
    
    %w(
      http://youtu.be/dQw4w9WgXcQ
      http://www.youtube.com/embed/dQw4w9WgXcQ
      http://www.youtube.com/watch?v=dQw4w9WgXcQ
      http://www.youtube.com/?v=dQw4w9WgXcQ
      http://www.youtube.com/v/dQw4w9WgXcQ
      http://www.youtube.com/e/dQw4w9WgXcQ
      http://www.youtube.com/user/username#p/u/11/dQw4w9WgXcQ
      http://www.youtube.com/sandalsResorts#p/c/54B8C800269D7C1B/0/dQw4w9WgXcQ
      http://www.youtube.com/watch?feature=player_embedded&v=dQw4w9WgXcQ
      http://www.youtube.com/?feature=player_embedded&v=dQw4w9WgXcQ
    ).each do |youtube_uri|
      it "parses #{youtube_uri} as youtube video" do
        asset = VideoAsset.new
        asset.user_code = youtube_uri
        asset.parse_video_id_and_type!
        
        asset.video_service.should eql(VideoAsset::SERVICE_YOUTUBE)
        asset.video_id.should eql("dQw4w9WgXcQ")
      end
    end
    
    %w(
      http://vimeo.com/moogaloop.swf?clip_id=40512439
      http://player.vimeo.com/video/40512439
      http://vimeo.com/40512439
      http://www.vimeo.com/40512439
      http://player.vimeo.com/video/40512439?title=0&amp;byline=0&amp;portrait=0
    ).each do |vimeo_uri|
      it "parses #{vimeo_uri} as vimeo video" do
        asset = VideoAsset.new
        asset.user_code = vimeo_uri
        asset.parse_video_id_and_type!
        
        asset.video_service.should eql(VideoAsset::SERVICE_VIMEO)
        asset.video_id.should eql("40512439")
      end
    end
    
    it "sets video_service to other for other services" do
      asset = VideoAsset.new
      asset.user_code = "http://www.stream.cz/video/676300-a-dost-test-uspornych-zarovek"
      asset.parse_video_id_and_type!
      
      asset.video_service.should eql(VideoAsset::SERVICE_OTHER)
      asset.video_id.should be_nil
    end
  end
  
  context "callbacks" do
    it "ensure video asset has parsed service and id before save" do
      asset = VideoAsset.new
      asset.user_code = "http://www.youtube.com/watch?v=dQw4w9WgXcQ"
      asset.video_service.should be_nil
      asset.video_id.should be_nil
      
      asset.save
      asset.video_service.should eql(VideoAsset::SERVICE_YOUTUBE)
      asset.video_id.should eql("dQw4w9WgXcQ")
    end
  end
end
