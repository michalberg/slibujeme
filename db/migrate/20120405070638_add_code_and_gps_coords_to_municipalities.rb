class AddCodeAndGpsCoordsToMunicipalities < ActiveRecord::Migration
  def change
    add_column :municipalities, :code, :string

    add_column :municipalities, :gps_lat, :float

    add_column :municipalities, :gps_lng, :float

  end
end
