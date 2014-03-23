<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="SaleManager.Library.Helper" %>
<%
    if (AccessFactory.IsLogined())
    {
%>
        Chào mừng, <b><%= AccessFactory.CurrentUserName %></b>!
        [ <%: Html.ActionLink("Đăng xuất", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Đăng nhập", "LogOn", "Account") %> ]
<%
    }
%>
