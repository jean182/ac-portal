$(document).on("turbolinks:load", function () {
  var button = $('#new-user');
  var url = window.location.toString();
  $('#nav-client-tab').on('click', function (e) {
    e.preventDefault()
    button.attr("href", url.replace("/users", "/clients/new"));
    button.html('New Client')
  })
  $('#nav-admin-tab').on('click', function (e) {
    e.preventDefault()
    button.attr("href", url.replace("/users", "/admins/new"));
    button.html('New Admin')

  })
  $('#nav-mentor-tab').on('click', function (e) {
    e.preventDefault()
    button.attr("href", url.replace("/users", "/mentors/new"));
    button.html('New Mentor')
  })
  console.log(url);
});
