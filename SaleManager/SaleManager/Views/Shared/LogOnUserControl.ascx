<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (SaleManager.Library.Helper.AccessFactory.IsLogined())
    {
%>
        Welcome <b><%: Page.User.Identity.Name %></b>!
        [ <%: Html.ActionLink("Log Off", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Log On", "LogOn", "Account") %> ]
<%
    }
%>
