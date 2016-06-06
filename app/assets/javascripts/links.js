$(document).ready(function(){
  window.onload = fetchLinks;
  $("#mark-read").on("click", markRead);
  $("#mark-unread").on("click", markUnread);
});

function markRead(){

}

function markUnread(){

}

function fetchLinks(){
  $.ajax({
    url: "api/v1/links",
    method: "GET",
    dataType: "json",
    success: showLinks,
    error: function(){
      alert("Something went wrong");
    }
  });
}

function showLinks(results) {
  var $wholeLink = $('.whole-link');
  $wholeLink.html("");
  results.forEach(function(link){
    $wholeLink.prepend(linkDiv(link));
  });
}

function prependLink(idea) {
  $('.whole-link').prepend(linkDiv(idea));
}

function linkDiv(idea) {
  return "<div class='idea true'>" +
  idea.title +
  "<br>" +
  idea.url +
  "<br>" +
  "<input type='button' value='Mark as Read' class='btn btn-danger' id='mark-read'>  " +
  "<input type='button' value='Edit this link' class='btn btn-warning' id='edit-link'>  " +
  "</div>";
// "<input type='button' value='Mark as Unread' class='btn btn-danger' id='mark-unread'>  " +
}
