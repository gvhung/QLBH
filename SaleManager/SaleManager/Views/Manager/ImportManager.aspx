<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ImportManager
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Quản lý nhập kho</h2>
    <div style="display: inline">
        Từ ngày<input type="text" id="DateFrom" />
        đến
        <input type="text" id="DateTo" />
        <input type="button" value="Tìm" onclick="Search()" />
        <br /><br />
        <div id="Content">
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
     <link rel="stylesheet" href="/Styles/jquery-ui.css">
    <script src="/Scripts/jqueryUI/jquery.ui.core.js"></script>
    <script src="/Scripts/jqueryUI/jquery.ui.widget.js"></script>
    <script src="/Scripts/jqueryUI/jquery.ui.datepicker.js"></script>
    <script src="/Scripts/jqueryUI/jquery.ui.datepicker-vi.js"></script>
    <script>
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional[""]);
            $("#DateFrom").datepicker($.datepicker.regional["vi"]);
            $("#DateTo").datepicker($.datepicker.regional["vi"]);
        });

        function Search() {
            var url = "SearchImport";
            var datefrom = $("#DateFrom").datepicker({ dateFormat: 'dd,MM,yyyy' }).val();
            var dateto = $("#DateTo").datepicker({ dateFormat: 'dd,MM,yyyy' }).val();
            var data = { DateFrom: datefrom, DateTo: dateto };
            CallServerMethod(url, data, SearchCallback);
        }

        function SearchCallback(parameter) {
            if (parameter.finish) {
                $("#Content").html(parameter.data);
            }
        }
    </script>
</asp:Content>
