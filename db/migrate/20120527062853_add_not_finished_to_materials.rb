class AddNotFinishedToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :not_finished, :boolean, :default => false

  end
end
