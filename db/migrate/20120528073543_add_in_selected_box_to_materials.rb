class AddInSelectedBoxToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :in_selected_box, :boolean, :default => false

  end
end
