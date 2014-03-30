<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SaleManager
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Thống kê bán hàng</h2>
    <div style="display: inline">
        Từ ngày<input type="text" id="DateFrom" />
        đến
        <input type="text" id="DateTo" />
        <input type="button" value="Tìm" onclick="Search()" />
        <br />
        <br />
        <div id="Content">
        </div>
    </div>
    <br/>
    <div style="display: inline">
        <table class="table1">
            <tr>
                <th></th>
                <th>Số lượng</th>
                <th>Tổng giá trị</th>
            </tr>
            <tr>
                <td>Tổng đơn hàng</td>
                <td><span id="TotalCount"></span></td>
                <td><span id="TotalSum"></span></td>
            </tr>
            <tr>
                <td>Đơn hàng mới</td>
                <td><span id="NewCount"></span></td>
                <td><span id="NewSum"></span></td>
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
            var url = "SearchOrder";
            var datefrom = $("#DateFrom").datepicker({ dateFormat: 'dd,MM,yyyy' }).val();
            var dateto = $("#DateTo").datepicker({ dateFormat: 'dd,MM,yyyy' }).val();
            var data = { DateFrom: datefrom, DateTo: dateto };
            CallServerMethod(url, data, SearchCallback);
        }

        function SearchCallback(parameter) {
            if (parameter.finish) {
                $("#Content").html(parameter.data);
                $("#TotalCount").html(parameter.totalCount);
                $("#TotalSum").html(parameter.totalSum);
                $("#NewCount").html(parameter.newCount);
                $("#NewSum").html(parameter.newSum);

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
