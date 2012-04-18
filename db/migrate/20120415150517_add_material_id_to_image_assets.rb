class AddMaterialIdToImageAssets < ActiveRecord::Migration
  def change
    add_column :image_assets, :material_id, :integer
  end
end
