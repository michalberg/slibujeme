class AddFromAndToToElections < ActiveRecord::Migration
  def change
    add_column :elections, :from, :date
    add_column :elections, :to, :date
  end
end
