$(document).ready(function() {
   $("#cancelBtn").on("click", function() {
       var href = window.location.href;
       window.location.href = href.replace("/registerbook", "/main");
   });
});