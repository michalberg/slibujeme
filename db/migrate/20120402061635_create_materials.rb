class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :election
      t.references :municipality
      t.references :party
      t.text :topics
      t.text :polititians
      t.text :comment
      t.string :contact

      t.timestamps
    end
  end
end
