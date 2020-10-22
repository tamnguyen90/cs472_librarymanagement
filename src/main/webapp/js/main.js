$(document).ready(function() {
   $("#searchBox").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#memLst li").filter(function() {
         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
   });

   $("#searchRecord").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#recordTable tr").filter(function() {
         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
   });

   $("#searchBook").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#bookTable tr").filter(function() {
         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
   });

   $("#addBook").on("click", function() {
      var href = window.location.href;
      window.location.href = href.replace("/main", "/registerbook");
   });

   $("#checkout").on("click", function() {
      var href = window.location.href;
      var link = href.split("/librarymember");
      window.location.href = href.replace("/main", "/CheckoutServlet");
   });
});
