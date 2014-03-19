﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Thêm khách hàng</h2>
    <form method="POST">
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
                <%=Html.DropDownList("Type", new SelectList(Model.customertypes, "Type", "Name"), new { onchange = "ChangeCustomerType();" })%>
            </td>
            ,
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
                <%=Html.DropDownList("City", new SelectList(Model.cities, "Id", "Name"), new { onchange = "ChangeCity();" })%>
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
            </td>
            <td>
                <div id="Error" style="color: red; display: none">
                </div>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="text-align: right">
                <input type="button" value="Nhập lại" onclick="Reset();" />
                <input type="submit" value="Lưu" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script>
//        $(function() {
//            $(document).ready(function() {
//                $("Type").val($("#customertype").val());
//                $("City").val($("#cityname").val());
//            });
//        });

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

        function ChangeCustomerType() {
//            $("Type").val($("#customertype").val());
        }

        function ChangeCity() {
//            $("City").val($("#cityname").val());
        }
    </script>
</asp:Content>