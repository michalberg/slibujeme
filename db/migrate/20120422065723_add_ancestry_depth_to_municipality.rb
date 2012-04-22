class AddAncestryDepthToMunicipality < ActiveRecord::Migration
  def change
    add_column :municipalities, :ancestry_depth, :integer, :default => 0

  end
end
