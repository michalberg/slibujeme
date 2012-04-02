class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :title

      t.timestamps
    end
  end
end
