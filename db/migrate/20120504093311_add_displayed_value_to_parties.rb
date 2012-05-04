class AddDisplayedValueToParties < ActiveRecord::Migration
  def change
    add_column :parties, :displayed_value, :string, :default => "title"

  end
end
