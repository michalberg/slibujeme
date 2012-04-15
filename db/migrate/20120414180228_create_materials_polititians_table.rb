class CreateMaterialsPolititiansTable < ActiveRecord::Migration
  def up
    create_table :materials_polititians, :id => false do |t|
      t.references :material, :null => false
      t.references :polititian, :null => false
    end
    add_index :materials_polititians, [:material_id, :polititian_id], :unique => true
  end

  def down
    drop_table :materials_polititians
  end
end
