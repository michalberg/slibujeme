class CreateVideoAssets < ActiveRecord::Migration
  def change
    create_table :video_assets do |t|
      t.text :user_code
      t.string :video_id
      t.string :video_service
      t.integer :material_id

      t.timestamps
    end
  end
end
