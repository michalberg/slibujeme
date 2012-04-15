class CreatePolititians < ActiveRecord::Migration
  def change
    create_table :polititians do |t|
      t.string :name

      t.timestamps
    end
  end
end
