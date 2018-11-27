$(document).on "turbolinks:load",  ->
  $modalContainer = $("#modal-container")
  modalSelector = ".modal"

  displayModal = (data) ->
    $(".modal-backdrop").remove()
    $modalContainer
      .html(data)
      .find(modalSelector)
      .modal("show")

  $(document).on "click", "a[data-modal]", ->
    location = $(this).attr("href")
    $.get(location, displayModal)
    false

  $(document).on "ajax:success", "form[data-modal]", (_e, data, _s, xhr) ->
    url = xhr.getResponseHeader("Location")
    if url
      window.location = url
    else
      displayModal(data)
    false