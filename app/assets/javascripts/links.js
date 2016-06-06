$(document).ready(function(){
  var $body = $('body');
  $("#mark-read").on("click", markRead);
  $("#mark-unread").on("click", markUnread);
  $("#idea_filter_name").on("keyup", filterIdeas);
  $body.on("click", "input#delete-idea", deleteIdea);
  $body.on("click", "input#thumbs-up", thumbsUp);
  $body.on("click", "input#thumbs-down", thumbsDown);
  $body.on("blur", "h3.displayed-idea-title", editTitle);
  $body.on("blur", "p.displayed-idea-body", editBody);
});
