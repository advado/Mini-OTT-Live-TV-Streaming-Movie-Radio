$(document).ready(function () {
    $("#video_type").change(function () {
        var type = $("#video_type").val();

        if (type == 'Upload') {
            $("#file").show(1000);
            $("#url").hide(1000);
        }
        if (type == 'Youtube') {
            $("#file").hide(1000);
            $("#url").show(1000);
            $("#video_thumbnail").hide(1000);
        }
        if (type == 'Hls' | type == 'Rtmp' | type == 'Rtsp' | type == 'Ts' | type == 'Daily_Motion' | type == 'Embed' | type == 'Vimeo') {
            $("#file").hide(1000);
            $("#url").show(1000);
        }

        


    });

    $(window).on('load', function () {
        var type = $("#video_type").val();

        if (type == 'Upload') {
            $("#file").show(1000);
            $("#url").hide(1000);
        }
        if (type == 'Youtube') {
            $("#file").hide(1000);
            $("#url").show(1000);
            $("#video_thumbnail").hide(1000);
        }
        if (type == 'Hls' | type == 'Rtmp' | type == 'Rtsp' | type == 'Ts' | type == 'Daily_Motion' | type == 'Embed' | type == 'Vimeo') {
            $("#file").hide(1000);
            $("#url").show(1000);
        }

    });

});


