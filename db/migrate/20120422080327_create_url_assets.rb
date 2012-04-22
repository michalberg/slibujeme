class CreateUrlAssets < ActiveRecord::Migration
  def change
    create_table :url_assets do |t|
      t.string :url
      t.integer :material_id

      t.timestamps
    end
  end
end
