class RemoveTopicsAndPolititiansFromMaterial < ActiveRecord::Migration
  def change
    remove_column :materials, :polititians
    remove_column :materials, :topics
  end
end
