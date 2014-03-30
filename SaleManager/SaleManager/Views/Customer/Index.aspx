<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Thêm khách hàng</h2>
    <form id="CustomerForm" action="Index.aspx" method="POST">
    <table border="0">
        <tr>
            <td>
                Tên khách hàng
            </td>
            <td>
                <%=Html.TextBox("Name") %>
            </td>
        </tr>
        <%--<tr>
            <td>Mã khách hàng</td>
            <td><input type="text" id="Code" /></td>
        </tr>--%>
        <tr>
            <td>
                Loại khách hàng
            </td>
            <td>
                <%=Html.DropDownList("Type", new SelectList(Model.customertypes, "Type", "Name"))%>
            </td>
        </tr>
        <tr>
            <td>
                Điện thoại 1
            </td>
            <td>
                <%=Html.TextBox("Phone1") %>
            </td>
        </tr>
        <tr>
            <td>
                Điện thoại 2
            </td>
            <td>
                <%=Html.TextBox("Phone2") %>
            </td>
        </tr>
        <tr>
            <td>
                Fax
            </td>
            <td>
                <%=Html.TextBox("Fax")%>
            </td>
        </tr>
        <tr>
            <td>
                Email
            </td>
            <td>
                <%=Html.TextBox("Email")%>
            </td>
        </tr>
        <tr>
            <td>
                Địa chỉ
            </td>
            <td>
                <%=Html.TextBox("Address", null, new { @style = "width: 500px;" })%>
            </td>
        </tr>
        <tr>
            <td>
                Tỉnh/Thành
            </td>
            <td>
                <%=Html.DropDownList("City", new SelectList(Model.cities, "Id", "Name"))%>
            </td>
        </tr>
        <tr>
            <td>
                Ghi chú
            </td>
            <td>
                <%=Html.TextArea("Note", null, new { rows = 5, cols = 50 })%>
            </td>
        </tr>
        <tr>
            <td>
                <%=Html.Hidden("Save") %>
            </td>
            <td>
                <div id="Error" style="color: red;">-
                    <%=Model.Error%>
                </div>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="text-align: right">
                <input type="button" value="Nhập lại" onclick="Reset();" />
                <input type="button" value="Lưu" onclick="SaveCustomer();" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script>
        function Reset() {
            $("#Name").val("");
            $("#Phone1").val("");
            $("#Phone2").val("");
            $("#Email").val("");
            $("#Fax").val("");
            $("#Address").val("");
            $("#Note").val("");
            $("#Error").val("");
        }

        function SaveCustomer() {
            if ($("#Name").val() == "") {
                $("#Error").text("Tên khách hàng không được trống.");
                $("#Error").attr("style", "color: red;display:block");
                return false;
            }
            else if ($("#Phone1").val() == "" && $("#Phone2").val() == "") {
                $("#Error").text("Số điện thoại không được trống.");
                $("#Error").attr("style", "color: red;display:block");
                return false;
            }
            else if ($("#Address").val() == "") {
                $("#Error").text("Địa chỉ không được trống.");
                $("#Error").attr("style", "color: red;display:block");
                return false;
            }
            $("#form").submit();

            var url = "SaveCustomer";
            var data = {Name: $("#Name").val(), Phone1: $("#Phone1").val(), Phone2: $("#Phone2").val(), 
                        Email:  $("#Email").val(), Fax: $("#Fax").val(), Address: $("#Address").val(),
                        Note: $("#Note").val(), Type:  $("#Type").val(), City: $("#City").val() };
            CallServerMethod(url, data, SaveCustomerCallback);
            //return true;
        }

        function SaveCustomerCallback(parameters) {
            if (parameters.finish) {
                $("#Error").text("Lưu thành công");
            } else {
                $("#Error").text(parameters.data);
            }
        }

        
    </script>
</asp:Content>
