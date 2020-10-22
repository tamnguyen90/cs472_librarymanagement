$(document).ready(function() {
   /* Handle searching for member list*/
   $("#searchBox").on("keyup", function() {
      let value = $(this).val().toLowerCase();
      $("#memLst li").filter(function() {
         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
   });

   /*Handle searching for checkout record*/
   $("#searchRecord").on("keyup", function() {
      let value = $(this).val().toLowerCase();
      if (value.length == 0) {
         pagination("#recordtb", ".pagination__record", 5);
      } else {
         $("#recordTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      }
   });

   /*Handle searching for book*/
   $("#searchBook").on("keyup", function() {
      let value = $(this).val().toLowerCase();
      if (value.length == 0) {
         pagination("#booktb", ".pagination__book", 5);
      } else {
         $("#bookTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      }
   });

   /*Handle searching for expired record*/
   $("#searchExpired").on("keyup", function() {
      let value = $(this).val().toLowerCase();
      if (value.length == 0) {
         pagination("#expiredtb", ".pagination__expired", 5);
      } else {
         $("#expireTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      }
   });

   /*Routing to adding book*/
   $("#addBook").on("click", function() {
      let href = window.location.href;
      window.location.href = href.replace("/main", "/registerbook");
   });

   /*Routing to checkout book*/
   $("#checkout").on("click", function() {
      let href = window.location.href;
      let link = href.split("/librarymember");
      window.location.href = href.replace("/main", "/CheckoutServlet");
   });

   pagination("#booktb", ".pagination__book", 5);
   pagination("#recordtb", ".pagination__record", 5);
   pagination("#detailTable", ".pagination__detail", 5)
});

/*Handling for pagination*/
function pagination(tableId, pagination, maxRow) {
   $(pagination).html("");
   let trnum = 0;
   let maxRows = parseInt(maxRow);
   let totalRows = $(tableId+' tbody tr').length;
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
      let pagenum = Math.ceil(totalRows/maxRows);
      for (let i = 1; i <= pagenum;) {
         $(pagination).append('<li data-page="' + i + '">\<a>' + i++ + '</a>\</li>').show();
      }
   }
   $(pagination + ' li:first-child a').addClass('active');
   $(pagination + ' li').on("click", function(){
      let pagenum = $(this).attr('data-page');
      let trIndex = 0;
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