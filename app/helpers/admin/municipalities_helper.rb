module Admin::MunicipalitiesHelper
  def nested_municipalities(municipalities)
    municipalities.map do |municipality, children|
      render(municipality) + nested_municipalities(children)
    end.join.html_safe
  end
  
  def nested_municipalities_options(municipalities)
    municipalities.map do |municipality, children|
      [{ municipality.id => municipality.title }] + nested_municipalities_options(children)
    end
  end
end
