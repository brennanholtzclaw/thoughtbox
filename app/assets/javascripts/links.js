// $(document).ready(function(){
//   var $body = $('body');
//   window.onload = fetchIdeas;
//   $("#create-idea").on("click", createIdea);
//   $("#idea_filter_name").on("keyup", filterIdeas);
//   $body.on("click", "input#delete-idea", deleteIdea);
//   $body.on("blur", "h3.displayed-idea-title", editTitle);
//   $body.on("blur", "p.displayed-idea-body", editBody);
// });
//
// function fetchIdeas(event) {
//   $.ajax({
//     url: "api/v1/ideas",
//     method: "GET",
//     dataType: "json",
//     success: showIdeas,
//     error: function(){
//       alert("Something went wrong");
//     }
//   });
// }
//
// function showIdeas(results) {
//   var $wholeIdea = $('.whole-idea');
//   $wholeIdea.html("");
//   results.forEach(function(idea){
//     $wholeIdea.prepend(ideaDiv(idea));
//   });
// }
//
// function prependIdea(idea) {
//   $('.whole-idea').prepend(ideaDiv(idea));
// }
//
// function ideaDiv(idea) {
//   return "<div class='idea' data-idea-id=" +
//   idea.id +
//   " data-quality='" +
//   idea.quality +
//   "'><hr><h3 class='displayed-idea-title idea' id='idea-title-" +
//   idea.id +
//   "' contentEditable='true'>" +
//   truncate(idea.title) +
//   "</h3><p class='displayed-idea-body id='idea-body-" +
//   idea.id +
//   "' contentEditable='true'>" +
//   truncate(idea.body) +
//   "</p><h4>Quality: " +
//   idea.quality +
//   "</h4>" +
//   "<input type='button' value='Delete Idea' class='btn btn-danger' id='delete-idea'>  " +
//   "<input type='button' value='Thumbs Up' class='btn btn-success' id='thumbs-up'>  " +
//   "<input type='button' value='Thumbs Down' class='btn btn-warning' id='thumbs-down'>  " +
//   "</div>";
// }
//
// var truncate = function(ideaText) {
//   return ideaText.length > 100 ? ideaText.substr(0, ideaText.lastIndexOf(' ', 100)) + '...' : ideaText;
// };
//
// function createIdea() {
//   var ideaParams = {idea: {title: $("#idea-title").val(), body: $("#idea-body").val()}}
//   $.ajax({
//     url: "api/v1/ideas",
//     method: "POST",
//     dataType: "json",
//     data: ideaParams,
//     success: prependIdea,
//     error: function(){
//       alert("Something went wrong");
//     }
//   });
//   $("#idea-title").val("");
//   $("#idea-body").val("");
// }
//
// function deleteIdea(){
//   event.preventDefault();
//   var ideaId = this.parentElement.getAttribute("data-idea-id");
//   $.ajax({
//     url: "api/v1/ideas/" + ideaId,
//     method: "DELETE",
//     success: function(){
//       $(".idea[data-idea-id=" + ideaId + "]").remove();
//     },
//     error: function(){
//       alert("Something went wrong");
//     }
//   });
// }
//
// function editBody(){
//   event.preventDefault();
//   var ideaId = this.parentElement.getAttribute("data-idea-id");
//   var ideaParams = {idea: {body: $(this).text()}};
//   $.ajax({
//     url: "api/v1/ideas/" + ideaId,
//     method: "PUT",
//     dataType: "json",
//     success: fetchIdeas,
//     data: ideaParams,
//     error: function(){
//       alert("Something went wrong");
//     }
//   });
// }
//
// function editTitle(){
//   event.preventDefault();
//   var ideaId = this.parentElement.getAttribute("data-idea-id");
//   var ideaParams = {idea: {title: $(this).text()}};
//   $.ajax({
//     url: "api/v1/ideas/" + ideaId,
//     method: "PUT",
//     dataType: "json",
//     success: fetchIdeas,
//     data: ideaParams,
//     error: function(){
//       alert("Something went wrong");
//     }
//   });
// }
//
// function filterIdeas() {
//   var currentName = this.value;
//   var ideaTitles = $('.displayed-idea-title');
//   ideaTitles.each(function(index, idea){
//     if ($(idea).text().indexOf(currentName) !== -1) {
//       $(idea.parentElement).show();
//     } else {
//       $(idea.parentElement).hide();
//     }
//   });
// }
//
// function thumbsUp() {
//   event.preventDefault();
//   if ($(this.parentElement).data("quality") === "terrible") {
//     plausibleIdea(this);
//   }
//   else if ($(this.parentElement).data("quality") === "plausible") {
//     greatIdea(this);
//   }
// }
//
// function thumbsDown() {
//   event.preventDefault();
//   if ($(this.parentElement).data("quality") === "great") {
//     plausibleIdea(this);
//   }
//   else if ($(this.parentElement).data("quality") === "plausible") {
//     terribleIdea(this);
//   }
// }
//
// function plausibleIdea(context){
//   var ideaId = context.parentElement.getAttribute("data-idea-id");
//   var ideaParams = {idea: {quality: "plausible"}};
//   $.ajax({
//     url: "api/v1/ideas/" + ideaId,
//     method: "PUT",
//     dataType: "json",
//     data: ideaParams,
//     success: fetchIdeas,
//     error: function(){
//       alert("Something went wrong");
//     }
//   });
// }
//
// function greatIdea(context){
//   var ideaId = context.parentElement.getAttribute("data-idea-id");
//   var ideaParams = {idea: {quality: "great"}};
//   $.ajax({
//     url: "api/v1/ideas/" + ideaId,
//     method: "PUT",
//     dataType: "json",
//     data: ideaParams,
//     success: fetchIdeas,
//     error: function(){
//       alert("Something went wrong");
//     }
//   });
// }
//
// function terribleIdea(context){
//   var ideaId = context.parentElement.getAttribute("data-idea-id");
//   var ideaParams = {idea: {quality: "terrible"}};
//   $.ajax({
//     url: "api/v1/ideas/" + ideaId,
//     method: "PUT",
//     dataType: "json",
//     data: ideaParams,
//     success: fetchIdeas,
//     error: function(){
//       alert("Something went wrong");
//     }
//   });
// }
