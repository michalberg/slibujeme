class RemoveContactFromMaterial < ActiveRecord::Migration
  def up
    remove_column :materials, :contact
  end

  def down
    add_column :materials, :contact, :string
  end
end
