class AddUploaderIpToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :uploader_ip, :string

  end
end
