class HomepageController < ApplicationController
  def index
    offset = rand(Material.where(:in_selected_box => true).count).floor
    @random_material = Material.where(:in_selected_box => true).first(:offset => offset)
  end
end
