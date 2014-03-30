<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	StorageManager
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Quản lý tổng kho</h2>
    <div id="Content">
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link rel="stylesheet" href="/Styles/demo_table.css">
    <script src="/Scripts/jqueryUI/jquery.dataTables.min.js"></script>
    <script>
        $(function () {
            Search();
        });

        function Search() {
            var url = "SearchStorage";
            CallServerMethod(url, null, SearchCallback);
        }

        function SearchCallback(parameter) {
            if (parameter.finish) {
                $("#Content").html(parameter.data);

                $('#table1').dataTable({
                    "oLanguage": {
                        "oPaginate": {
                            "sFirst": "<<",
                            "sLast": ">>",
                            "sNext": ">",
                            "sPrevious": "<"
                        }
                    },
                    "sPaginationType": "full_numbers",
                    "bSort": false,
                    "bInfo": false,
                    "bFilter": false,
                    "bLengthChange": false
                });
            }
        }
    </script>
</asp:Content>
