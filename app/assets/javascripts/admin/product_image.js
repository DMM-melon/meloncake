$(function () {
    $('input[type="file"]').change(function (e) {
        var file = e.target.files[0],
            reader = new FileReader(),
            $preview = $(this).next(".preview");
        if (file.type.indexOf("image") < 0) {
            return false;
        }
        reader.onload = (function (file) {
            return function (e) {
                $preview.empty();
                $preview.append($("<img>").attr({
                    src: e.target.result,
                    class: "preview-act",
                    title: file.name
                }));
            };
        })(file);
        reader.readAsDataURL(file);
    });
});

Resources