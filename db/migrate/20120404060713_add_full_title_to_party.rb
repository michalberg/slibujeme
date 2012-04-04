class AddFullTitleToParty < ActiveRecord::Migration
  def change
    add_column :parties, :full_title, :string

  end
end
