class AddAncestryToMunicipalities < ActiveRecord::Migration
  def change
    add_column :municipalities, :ancestry, :string
    add_index :municipalities, :ancestry
  end
end
