// $(function () {
//     $('#confirm-delete').on('show.bs.modal', function (e) {
//         $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
//
//         $('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
//     });
// });

// Bind click to OK button within popup
$(function () {
    $('#confirm-delete').on('click', '.btn-ok', function (e) {

        var $modalDiv = $(e.delegateTarget);
        var id = $(this).data('recordId');
        var root = $(this).data('path');
        var url = root + $(this).data('pathAdd');
        //just to show
        // $modalDiv.addClass('loading');
        // setTimeout(function () {
        //     $modalDiv.modal('hide').removeClass('loading');
        // }, 1000);

        // In reality would be something like this
        $modalDiv.addClass('loading');
        $.post(url + id).then(function () {
            $modalDiv.modal('hide').removeClass('loading');
            setTimeout(function () {
                var pathname = window.location.pathname;
                window.location.replace(root + "/orderList");
            }, 500);
        });
    });

// Bind to modal opening to set necessary data properties to be used to make request
    $('#confirm-delete').on('show.bs.modal', function (e) {
        var data = $(e.relatedTarget).data();
        $('.title', this).text(data.recordTitle + ' #' + data.recordNum);
        $('.btn-ok', this).data('recordId', data.recordId);
        $('.btn-ok', this).data('path', data.path);
        $('.btn-ok', this).data('pathAdd', data.pathAdd);
    });
});