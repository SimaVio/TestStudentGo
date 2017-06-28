$(function () {
    $('.float-only').keypress(function (eve) {
        if ((eve.which != 46 || $(this).val().indexOf('.') != -1) && (eve.which < 48 || eve.which > 57) || (eve.which == 46 && $(this).caret().start == 0)) {
            eve.preventDefault();
        }

// this part is when left part of number is deleted and leaves a . in the leftmost position. For example, 33.25, then 33 is deleted
        $('.float-only').keyup(function (eve) {
            if ($(this).val().indexOf('.') == 0) {
                $(this).val($(this).val().substring(1));
            }
        });
    });
    $('.float-only').bind("cut copy paste",function(e) {
        e.preventDefault();
    });


    $('.int-only').keypress(function (eve) {
        if ( (eve.which < 48 || eve.which > 57) || (eve.which == 46 && $(this).caret().start == 0)) {
            eve.preventDefault();
        }
    });
    $('.int-only').bind("cut copy paste",function(e) {
        e.preventDefault();
    });

});