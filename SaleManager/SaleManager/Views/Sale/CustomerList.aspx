<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="SaleManager.Common" %>
<%@ Import Namespace="SaleManager.Data" %>
<%@ Import Namespace="SaleManager.Library.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CustomerList
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Danh sách khách hàng</h2>
    <form id="form" method="POST">
    <table>
         <tr>
            <th>Từ khóa</th>
            <th>Seller</th>
            <th>Trạng thái</th>
            <th></th>
        </tr>
        <tr>
            <td><%=Html.TextBox("Search") %></td>
            <td><%=Html.DropDownList("Seller", new SelectList(Model.Sellers, "Id", "Name"), new { onchange = "ChangeSeller();" })%></td>
            <td><%=Html.DropDownList("CustomerStatus", new SelectList(Model.Status, "Type", "Name"), new { onchange = "ChangeCustomerStatus();" })%></td>
            <td><input type="button" value="Tìm kiếm" onclick="Submit()"/></td>
        </tr>
    </table>
    <%=Html.Hidden("SelectedSeller")%>
    <%=Html.Hidden("SelectedCustomerStatus")%>
    </form>
    <br/>
    <br/>
    <table class="table1">
        <thead>
            <th>STT</th>
            <th>Tên</th>
            <th>Loại khách hàng</th>
            <th>Số điện thoại 1</th>
            <th>Số điện thoại 2</th>
            <th>Email</th>
            <th>Tỉnh/Thành</th>
            <th>Trạng thái</th>
        </thead>
        <tbody>
            <%
               var stt = 1;
               foreach (var customer in Model.Customers)
               {
            %>
            <tr>
            <td><%=stt++ %></td>
            <td><%=customer.Name ?? ""%></td>
            <td><%=customer.CustomerType == (int)CustomType.PERSONAL? Constant.CUSTOMER_TYPE_PERSONAL : Constant.CUSTOMER_TYPE_COMPANY%></td>
            <td><%=customer.PhoneNumber1 ?? ""%></td>
            <td><%=customer.PhoneNumber2??"" %></td>
            <td><%=customer.Email ?? ""%></td>
            <td><%=AccessFactory.Cities[customer.CityId]%></td>
            <td>
                <a id="<%=customer.Id %>" href="#"  onclick="ChangeStatus('<%= customer.Id %>', '<%= (Status)customer.Status%>')">
                    <%=AccessFactory.GetStatus(customer.Status)%>
                </a>
                
            </td>       
            </tr>
            <% } %>
            
        </tbody>
    </table>
    
    <div id='wrapStatus' style='display: none;'>
        <div>
            <input id="StatusA" type="radio" name="Status" value="<%=Status.ACTIVE.ToString() %>"
                onchange="ChangeState(this.value)" /><%=Constant.STATUS_ACTIVE%></div>
        <div>
            <input id="StatusD" type="radio" name="Status" value="<%=Status.DELETE.ToString() %>"
                onchange="ChangeState(this.value)" /><%=Constant.STATUS_DELETE%></div>
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
    <link type='text/css' href='/Styles/customerlist.css' rel='stylesheet' media='screen' />
       <script src="/Scripts/jqueryUI/jquery.simplemodal.1.4.4.min.js" type="text/javascript"></script>
    <script src="/Scripts/jqueryUI/basic.js" type="text/javascript"></script>
    <link type='text/css' href='/Styles/basic.css' rel='stylesheet' media='screen' />
    <script src="/Scripts/jqueryUI/jquery-ui-1.9.1.custom.js" type="text/javascript"></script>
    <script>
        $(function () {
            $(document).ready(function () {
                $("#SelectedSeller").val("99");
                $("#SelectedCustomerStatus").val("99");
            });
        });

        function ChangeSeller() {
            $("#SelectedSeller").val($("#Seller").val());
        }

        function ChangeCustomerStatus() {
            $("#SelectedCustomerStatus").val($("#CustomerStatus").val());
        }

        function Submit() {
            $("#form").submit();
        }

        function ChangeState(status) {
            $("#TempStatus").val(status);
        }

        function ChangeStatus(name, status) {
            $("#radio").buttonset();
            $('#StatusA').prop('checked', true);
            $("#TempName").val(name);
            $("#TempStatus").val(status);
            $("#Error").val("");
            $("#Save").attr("disabled", false);
            $("#wrapStatus").modal();
        }

        function CancelChangeStatus() {
            $.modal.close();
        }
        function SubmitChangeStatus() {
            var url = "UpdateCustomer";
            CallServerMethod(url, { Name: $("#TempName").val(), Status: $("input[type='radio']:checked").val() }, SubmitChangeStatusCallback);
        }

        function SubmitChangeStatusCallback(parameters) {

            if (parameters.finish == true) {
                var id = $("#TempName").val();
                var value = $("#TempStatus").val();
                var text = value == "REVIEW" ? "Hoạt động" : "Ngưng hoạt động";

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
