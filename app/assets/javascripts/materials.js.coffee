# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  $("#material_topic_ids, #t").chosen();

  $("#material_polititian_names").tagsInput
    autocomplete_url: $("#material_polititian_names").attr "data-uri"
    defaultText: 'Vepište jméno politika...'
    width: "390px"

  $("#po").tagsInput
    autocomplete_url: $("#po").attr "data-uri"
    defaultText: 'Vepište jméno politika...'
    width: "390px"
    
  $( "#tabs" ).tabs()

  $("#addStrana").click () ->
    $(@).parent().find("span").show();
    $(@).remove();
    false

  $("#materials-add-more-image-assets").click (evt) ->
    evt.preventDefault()
    html = $.trim($(@).parent().siblings("p").first().html()).replace(/0/g, $(@).parent().siblings("p").length)
    $(@).parent().before("<p>#{html}</p>")
    
  $("input#material_polititian_names_tag")
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
    
  $("a.delete-image-asset").on "click", (evt) ->
    $.ajax
      url: $(@).attr("data-uri")
      type: "PUT"
      dataType: "json"
      data:
        material:
          image_assets_attributes:
            [id: $(@).attr("rel"), "_destroy": 1]
      success: (data, textStatus, jqXHR) =>
        $(@).parents("div.img").fadeOut().remove()
    evt.preventDefault()
)