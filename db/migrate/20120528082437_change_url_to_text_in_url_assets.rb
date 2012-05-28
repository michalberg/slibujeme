class ChangeUrlToTextInUrlAssets < ActiveRecord::Migration
  def up
    change_column :url_assets, :url, :text, :limit => nil
  end

  def down
    change_column :url_assets, :url, :string
  end
end
