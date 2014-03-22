function CallServerMethod(url, data, callback) {
    ///<sumary>Call asynronous a server function. This function use post method</sumary>
    ///<param name="url">url</param>
    ///<param name="data">data sent to server (json)</param>
    ///<param name="callback">callback function is called when ajax run successfully </param>

    var d = new Date();
    var time = d.getTime();
    if (!data)
        data = {};
    data.currenttime = time;

    if (typeof contentType == 'undefined')
        contentType = "application/x-www-form-urlencoded";

    $.ajax({
        url: url,
        type: 'post',
        contentType: contentType,
        data: data,
        success: callback,
        error: function (jqXHR, textStatus, errorThrown) {
            var errorWindow = window.open('', "Error");
            errorWindow.document.write(jqXHR.responseText);
            errorWindow.focus();
        }

    });
}