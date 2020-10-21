$(document).ready(function() {
    //handle submit checkout a book
    $('#btnSubmit').click(function(event) {
        var selMemberId = $('input[name=\"selMemberId\"]:checked').val();
        var selIsbn = $('input[name=\"selIsbn\"]:checked').val();
        var $errorMessage = $('#errorMessage');

        if(selMemberId == undefined && selIsbn == undefined) {
            $errorMessage.text("Please select memberId & Isbn");
            return;
        }
        if(selMemberId == undefined) {
            $errorMessage.text("Please select memberId whose returns the book");
            return;
        }
        if(selIsbn == undefined) {
            $errorMessage.text("Please select returned Isbn");
            return;
        }

        alert(selMemberId + ' ' + selIsbn);
        $('#memberId').val(selMemberId);
        $('#isbn').val(selIsbn);
        $('#frmCheckout').submit();
    });

    //handle submit return a book
    $('#btnReturn').click(function(event) {
        var selMemberId = $('input[name=\"selMemberId\"]:checked').val();
        var selIsbn = $('input[name=\"selIsbn\"]:checked').val();
        var $errorMessage = $('#errorMessage');

        if(selMemberId == undefined && selIsbn == undefined) {
            $errorMessage.text("Please select memberId & Isbn");
            return;
        }
        if(selMemberId == undefined) {
            $errorMessage.text("Please select memberId whose returns the book");
            return;
        }
        if(selIsbn == undefined) {
            $errorMessage.text("Please select returned Isbn");
            return;
        }

        alert(selMemberId + ' ' + selIsbn);
        $('#returnMemberId').val(selMemberId);
        $('#returnIsbn').val(selIsbn);
        $('#frmReturnBook').submit();
    });

    //getting Library Member data when user enter memberId
    $('#memberId').keyup(function(event) {
        var memberId = $('#memberId').val();

        $.post('LibraryMemberServlet', {
            memberId: memberId
        })
            .done(dispLibraryMember)
    });

    //Get available Book for checkout
    $('#isbn').keyup(function(event) {
        var isbn = $('#isbn').val();

        $.post('CheckoutBookServlet', {
            isbn: isbn
        })
            .done(dispBook)
    });

    //getting Library Member data when user enter memberId
    $('#returnMemberId').keyup(function(event) {
        var memberId = $('#returnMemberId').val();

        $.post('LibraryMemberServlet', {
            memberId: memberId
        })
            .done(dispLibraryMember)
    });

    //get current checkout Book to return.
    $('#returnIsbn').keyup(function(event) {
        var isbn = $('#returnIsbn').val();
        var $selMemberId = $('input[name=\"selMemberId\"]:checked').val();

        $.post('ReturnBookServlet', {
            isbn: isbn
        })
            .done(dispBook)
    });
});

function dispLibraryMember(resJson) {
    var $libaryMember = $('#libraryMember');

    $libaryMember.text("");

    var members = "";
    $.each(resJson, function(key, value) {
        members += "memberId: " + value.memberId + " firstName" + value.firstName;
    })

    //$libaryMember.text(members);

    var markup = "";
    // $("table tbody tr").remove();
    $('#tbodyMember').find('tr').remove();
    $.each(resJson, function(key, value) {
        markup += "<tr><td><input type='radio' name='selMemberId' value='" + value.memberId + "'>" +
            "</td><td>" + value.memberId +
            "</td><td>" + value.firstName +
            "</td><td>" + value.lastName +
            "</td><td>" + value.phone +
            "</td></tr>";
    })

    // $("table tbody").append(markup);
    $('#tbodyMember').append(markup);
};

function dispBook(resJson) {
    // var $book = $('#book');
    //
    // $book.text("");
    //
    // var books = "";
    // $.each(resJson, function(key, value) {
    //     books += "isbn: " + value.isbn + " title" + value.title;
    // })
    //
    // $book.text(books);

    var markup = "";
    // $("table tbody tr").remove();
    $('#tbodyBook').find('tr').remove();
    $.each(resJson, function(key, value) {
        markup += "<tr><td><input type='radio' name='selIsbn' value='" + value.isbn + "\'></td>>" +
            "</td><td>" + value.isbn +
            "</td><td>" + value.title +
            "</td><td>" + 0 +
            "</td></tr>";
    })

    // $("table tbody").append(markup);
    $('#tbodyBook').append(markup);
};
