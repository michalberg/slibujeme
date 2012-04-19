module HomepageHelper
  def render_asset_for_random_material(material, size = :thumb)
    if material.image_assets.any?
      image_tag(material.image_assets.first.image(size)).html_safe
    else
      '<div class="homepage-random-box-placeholder"></div>'.html_safe
    end
  end
end
