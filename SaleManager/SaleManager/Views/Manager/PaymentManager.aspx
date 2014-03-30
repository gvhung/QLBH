<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PaymentManager
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Quản lý công nợ</h2>
    <div style="display: inline">
        Từ ngày<input type="text" id="DateFrom" />
        đến
        <input type="text" id="DateTo" />
        <input type="button" value="Tìm" onclick="Search()" />
        <br />
        <div id="Content">
        </div>
    </div>
    <br/>
    <div>
        <table class="table1">
            <tr>
                <th>Tiên mặt</th>
                <th>Chuyển khoảng</th>
            </tr>
            <tr>
                <td><span id="TotalCash"></span></td>
                <td><span id="TotalTransfer"></span></td>
            </tr>
            
        </table>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <link rel="stylesheet" href="/Styles/jquery-ui.css">
    <link rel="stylesheet" href="/Styles/demo_table.css">
    <script src="/Scripts/jqueryUI/jquery.dataTables.min.js"></script>
    <script src="/Scripts/jqueryUI/jquery.ui.core.js"></script>
    <script src="/Scripts/jqueryUI/jquery.ui.widget.js"></script>
    <script src="/Scripts/jqueryUI/jquery.ui.datepicker.js"></script>
    <script src="/Scripts/jqueryUI/jquery.ui.datepicker-vi.js"></script>
    <script>
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional[""]);
            $("#DateFrom").datepicker($.datepicker.regional["vi"]);
            $("#DateTo").datepicker($.datepicker.regional["vi"]);
            $("#DateFrom").datepicker("setDate", new Date());
            $("#DateTo").datepicker("setDate", new Date());
            Search();
        });

        function Search() {
            var url = "SearchPayment";
            var datefrom = $("#DateFrom").datepicker({ dateFormat: 'dd,MM,yyyy' }).val();
            var dateto = $("#DateTo").datepicker({ dateFormat: 'dd,MM,yyyy' }).val();
            var data = { DateFrom: datefrom, DateTo: dateto };
            CallServerMethod(url, data, SearchCallback);
        }

        function SearchCallback(parameter) {
            if (parameter.finish) {
                $("#Content").html(parameter.data);
                $("#TotalCash").html(parameter.totalCash);
                $("#TotalTransfer").html(parameter.totalTransfer);

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
