<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="SaleManager.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SaleList
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Danh sách seller phụ trách</h2>
    <table class="table1">
        <tr>
            <th>
                Tên đăng nhập
            </th>
            <th>
                Họ
            </th>
            <th>
                Tên
            </th>
            <th>
                Giới tính
            </th>
            <th>
                Trạng thái
            </th>
        </tr>
        <% foreach (var user in Model.UserList)
           { %>
        <tr>
            <td>
                <%= user.Name %>
            </td>
            <td>
                <%= user.LastName %>
            </td>
            <td>
                <%= user.FirstName %>
            </td>
            <td>
                <%= user.Gender == Convert.ToBoolean((int)Gender.MALE) ? Constant.GENDER_MALE : Constant.GENDER_FEMALE%>
            </td>
            <td>
                <a id="<%=user.Name %>" href="#" onclick="ChangeStatus('<%= user.Name %>', '<%= (Status)user.Status%>')">
                    <%=(Status)user.Status == Status.ACTIVE ? Constant.STATUS_ACTIVE : Constant.STATUS_DEACTIVE%></a>
            </td>
        </tr>
        <% } %>
    </table>
    <div id='wrapStatus' style='display: none;'>
        <div>
            <input id="StatusA" type="radio" name="Status" value="<%=Status.ACTIVE.ToString() %>"
                onchange="ChangeState(this.value)" /><%=Constant.STATUS_ACTIVE%></div>
        <div>
            <input id="StatusD" type="radio" name="Status" value="<%=Status.DEACTIVE.ToString() %>"
                onchange="ChangeState(this.value)" /><%=Constant.STATUS_DEACTIVE%></div>
        <br/>
        <div>
            <div id="Error" style="color: red">
                &nbsp;</div>
        </div>
        <div>
            <input id="Cancel" type="button" value="Hủy" onclick="CancelChangeStatus()" />
            <input id="Save" type="button" value="Thay đổi" onclick="SubmitChangeStatus();" /></div>
        
        <input type="hidden" id="TempName" value="" />
        <input type="hidden" id="TempStatus" value="" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="/Scripts/jqueryUI/jquery.simplemodal.1.4.4.min.js" type="text/javascript"></script>
    <script src="/Scripts/jqueryUI/basic.js" type="text/javascript"></script>
    <link type='text/css' href='/Styles/basic.css' rel='stylesheet' media='screen' />
    <script src="/Scripts/jqueryUI/jquery-ui-1.9.1.custom.js" type="text/javascript"></script>
    <script>
        function ChangeStatus(name, status) {
            $("#radio").buttonset();
            if (status == "ACTIVE") {
                $('#StatusA').prop('checked', true);
            } else {
                $('#StatusD').prop('checked', true);
            }
            $("#TempName").val(name);
            $("#Error").val("");
            $("#wrapStatus").modal();
        }

        function ChangeState(status) {
            $("#TempStatus").val(status);
        }

        function CancelChangeStatus() {
            $.modal.close();
        }
        function SubmitChangeStatus() {
            var url = "UpdateSaleStatus";
            CallServerMethod(url, { Name: $("#TempName").val(), Status: $("#TempStatus").val() }, SubmitChangeStatusCallback);
        }

        function SubmitChangeStatusCallback(parameters) {
            if (parameters.finish == true) {
                var id = $("#TempName").val();
                var value = $("#TempStatus").val();
                var text = value == "ACTIVE" ? "Hoạt động" : "Ngưng hoạt động";

                $("#" + id).attr("onclick", "ChangeStatus('" + id + "', '" + value + "')");
                $("#" + id).text(text);

                $("#TempName").val("");
                $("#TempStatus").val("");
                $("#Error").text("Cập nhật thành công.");
                $("#Save").attr("disabled", "disabled");

                
            } else {
                $("#Error").text("Không thể thay đổi trạng thái.");
            }

        }
    </script>
</asp:Content>
