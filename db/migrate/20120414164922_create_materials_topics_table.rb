class CreateMaterialsTopicsTable < ActiveRecord::Migration
  def up
    create_table :materials_topics, :id => false do |t|
      t.references :material, :null => false
      t.references :topic, :null => false
    end
    add_index :materials_topics, [:material_id, :topic_id], :unique => true
  end

  def down
    drop_table :materials_topics
  end
end
