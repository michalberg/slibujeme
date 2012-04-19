class HomepageController < ApplicationController
  def index
    offset = rand(Material.count).floor
    @random_material = Material.first(:offset => offset)
  end
end
