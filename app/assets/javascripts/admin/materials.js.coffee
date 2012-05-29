# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  $("#material_topic_ids").chosen();

  $("#material_polititian_names").tagsInput
    autocomplete_url: $("#polititian_names").attr "data-uri"
    defaultText: 'Vepište jméno politika...'
    width: "390px"
)