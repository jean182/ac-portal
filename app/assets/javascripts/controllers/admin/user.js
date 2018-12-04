$(document).ready(function () {
  var button = $('#new-user');
  var url = window.location.toString();
  $('#nav-client-tab').on('click', function (e) {
    e.preventDefault()
    button.attr("href", url.replace("/users", "/clients/new"));
    button.html('New User')
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
  $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
    localStorage.setItem('activeTab', $(e.target).attr('href'));
  });
  var activeTab = localStorage.getItem('activeTab');
  if (activeTab) {
    $('#nav-tab a[href="' + activeTab + '"]').tab('show');
    if (activeTab == "#nav-client") {
      button.attr("href", url.replace("/users", "/clients/new"));
      button.html('New User')
    } else if (activeTab == "#nav-admin") {
      button.attr("href", url.replace("/users", "/admins/new"));
      button.html('New Admin')
    } else {
      button.attr("href", url.replace("/users", "/mentors/new"));
      button.html('New Mentor')
    }
  }
});
