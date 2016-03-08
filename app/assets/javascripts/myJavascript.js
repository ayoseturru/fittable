$(document).on('pageinit', function () {


    function saveImageLocal(key, url) {
        var newImage = new Image();
        newImage.src = url;
        newImage.onload = function () {
            var canvas = document.createElement('canvas');
            var context = canvas.getContext('2d');
            context.canvas.height = newImage.height;
            context.canvas.width = newImage.width;
            context.drawImage(newImage, 0, 0, newImage.width, newImage.height);
            var data = canvas.toDataURL("image/png");
            localStorage.setItem(key, data);
        };
    }

    var updateExercises = function (object) {
        localStorage.exercises = JSON.stringify(object);
        for (var exercise in object) {
            saveImageLocal(object[exercise].id + "_first", object[exercise].publication.images.first, 80);
            saveImageLocal(object[exercise].id + "_second", object[exercise].publication.images.second, 80);
            saveImageLocal(object[exercise].id + "_third", object[exercise].publication.images.third, 80);
        }
        addExercises(object);
    };

    var updating = false;

    var updateDataFromServer = function () {
        if (updating) return;
        updating = true;

        $.mobile.loading('show');
        $.getJSON("/exercises.json").done(function (json) {
            console.log("url search: " + window.location.search.substring(1));
            updateExercises(json);
        }).fail(function () {
            console.log("error while server access");
        }).always(function () {
            $.mobile.loading('hide');
            updating = false;
            console.log("complete");
        });
    };

    function addExercises(data) {
        console.log("callback de ajax refresh");
        $('.exercise_li').remove();
        for (var exercise in data) {
            var auxdata = localStorage[data[exercise].id + "_first"];
            var description = "<h3>" + data[exercise].publication.title + " por " + data[exercise].publication.username + "<h3>";
            var custom_Exercise = data[exercise].series + " series de " + data[exercise].repeats + " cada una";
            $('#' + data[exercise].day + "_divider").after("<li class='exercise_li' id='exercise_" + data[exercise].id + "'>" + "<a data-ajax='false' href='/exercises/show_exercise.html?id=" + data[exercise].id + "'>" + "<img src='" + auxdata + "' />" + "<h3>" + description + "</h3>" + custom_Exercise + "</a></li>");
        }
        $('#exercises').listview().listview('refresh');
    }

    if (localStorage.exercises) updateExercises(JSON.parse(localStorage.exercises));

    $(window).on("online", updateDataFromServer);

    if (window.navigator.onLine) updateDataFromServer();


    //if (window.location.href.indexOf("show_exercise") > -1) alert("yes");
});



