class AddImageColumnsToImageAsset < ActiveRecord::Migration
  def up
    change_table :image_assets do |t|
      t.has_attached_file :image
    end
  end
  
  def down
    drop_attached_file :image_assets, :image
  end
end
