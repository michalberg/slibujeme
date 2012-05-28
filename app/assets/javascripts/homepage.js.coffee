# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

lookupLocation = () ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition showLink
  
showLink = (loc) ->
  geocoder = new google.maps.Geocoder();
  latlng = new google.maps.LatLng(loc.coords.latitude, loc.coords.longitude);

  geocoder.geocode({'latLng': latlng}, (results, status) ->
      if (status == google.maps.GeocoderStatus.OK)
        if (results[1])
          str = ""
          $.each results[1].address_components, (i, component) ->
            if component.types[0] == "locality"
              str = component.long_name
              
          if str != ""
            $("p#geo-position a").html(str)
            $("p#geo-position a").attr("href", $("p#geo-position a").attr("href") + str)
            $("p#geo-position").show()
            
  )
$( -> 
  if $("p#geo-position").length > 0
    lookupLocation()
)