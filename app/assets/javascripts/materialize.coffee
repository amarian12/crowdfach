initialize_materialize = ->
    Waves.displayEffect()
    $(".button-collapse").sideNav()
    $(".datepicker").pickadate()
    $("select").material_select()
    $(".tooltipped").tooltip({delay: 100})
    $(".parallax").parallax()
    $(".modal").modal()

$(document).on "turbolinks:load", initialize_materialize
