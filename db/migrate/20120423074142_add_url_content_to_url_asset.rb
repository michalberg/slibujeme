class AddUrlContentToUrlAsset < ActiveRecord::Migration
  def change
    add_column :url_assets, :url_content, :text

  end
end
