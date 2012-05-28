require "croptoelie"

module Paperclip
  class EntropyCropThumbnail < Thumbnail
    
    def make
      src = @file
      dst = Tempfile.new([@basename, @format ? ".#{@format}" : ''])
      dst.binmode
      img = CropToelie.from_file(src.path).smart_crop_and_scale(500, 500)
      img.write(File.expand_path(dst.path))

      dst
    end
  end
end