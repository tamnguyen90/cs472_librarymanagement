$(document).ready(function() {
   $("#searchBox").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#memLst li").filter(function() {
         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
   });

   $("#searchRecord").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      if (value.length == 0) {
         pagination("#recordtb", ".pagination__record", 5);
      } else {
         $("#recordTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      }

   });

   $("#searchBook").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      if (value.length == 0) {
         pagination("#booktb", ".pagination__book", 5);
      } else {
         $("#bookTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      }
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

   pagination("#booktb", ".pagination__book", 5);
   pagination("#recordtb", ".pagination__record", 5);
   pagination("#detailTable", ".pagination__detail", 5)
});
function pagination(tableId, pagination, maxRow) {
   $(pagination).html("");
   var trnum = 0;
   var maxRows = parseInt(maxRow);
   var totalRows = $(tableId+' tbody tr').length;
   $(tableId+' tr:gt(0)').each(function() {
      trnum++;
      if (trnum > maxRows) {
         $(this).hide();
      }
      if (trnum <= maxRows) {
         $(this).show();
      }
   });
   if (totalRows > maxRows) {
      var pagenum = Math.ceil(totalRows/maxRows);
      for (let i = 1; i <= pagenum;) {
         $(pagination).append('<li data-page="' + i + '">\<a>' + i++ + '</a>\</li>').show();
      }
   }
   $(pagination + ' li:first-child a').addClass('active');
   $(pagination + ' li').on("click", function(){
      var pagenum = $(this).attr('data-page');
      var trIndex = 0;
      $(pagination + ' li a').removeClass('active');
      $(this).find('a').addClass("active");
      $(tableId+' tr:gt(0)').each(function(){
         trIndex++;
         if (trIndex > (maxRows*pagenum) || trIndex <= ((maxRows*pagenum) - maxRows)) {
            $(this).hide();
         } else {
            $(this).show();
         }
      });
   });
}