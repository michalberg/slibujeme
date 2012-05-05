# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  $("#material_topic_ids, #t").chosen();

  $("#material_polititians").tagsInput
    autocomplete_url: $("#material_polititians").attr "data-uri"
    defaultText: 'Vepište jméno politika...'
    width: "390px"

  $("#po").tagsInput
    autocomplete_url: $("#po").attr "data-uri"
    defaultText: 'Vepište jméno politika...'
    width: "390px"


  $("#addStrana").click () ->
    $(@).parent().find("span").show();
    $(@).remove();
    false

  $("#materials-add-more-image-assets").click (evt) ->
    evt.preventDefault()
    html = $.trim($(@).parent().siblings("p").first().html()).replace(/0/g, $(@).parent().siblings("p").length)
    $(@).parent().before("<p>#{html}</p>")
    
  $("input#material_polititians_tag")
    .attr("rel", "tooltip")
    .attr("title", "Pro přidání další osoby stiskněte po zadání jména enter")
    .tooltip
      "placement": "right"
      "trigger": "focus"
      
  $("textarea#material_comment").tooltip
    "placement": "right"
    "trigger": "focus"

  $("input#user_email").tooltip
    "placement": "right"
    "trigger": "focus"
    
  $("a#new-party").on "click", (evt) ->
    evt.preventDefault()
    $(@).siblings("span").show()
    $(@).hide()
    
  if $("input#material_party_name").val() != ""
    $("a#new-party").siblings("span").show()
    $("a#new-party").hide()
    
)