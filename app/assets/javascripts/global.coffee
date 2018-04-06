# call modal populate modal holder with data
$ ->
  $(document).on "click", "[data-behavior='modal']", ->
    location = $(this).attr("href")
    $.get location, (data)->
      $("#modal-holder").html($(data).find(".modal")).find(".modal").modal("show")
    false
