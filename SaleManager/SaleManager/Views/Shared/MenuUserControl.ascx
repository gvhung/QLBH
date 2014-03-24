<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="SaleManager.Common" %>
<%@ Import Namespace="SaleManager.Library.Helper" %>
<%
    if (!AccessFactory.IsLogined())
        return;

    if (AccessFactory.CurrentUserRole == (int)UserGroup.SALE)
    {
%>
<li><%: Html.ActionLink("Khách hàng", "Index", "Customer")%></li>
<li><%: Html.ActionLink("Thống kê", "OrderManager", "Customer")%></li>
<%
    }
    else if (AccessFactory.CurrentUserRole == (int)UserGroup.SALE_MANAGER)
    {
%>
<li><%: Html.ActionLink("Seller", "SaleList", "Sale")%></li>
<li><%: Html.ActionLink("Khách hàng", "CustomerList", "Sale")%></li>
<%
    }
    else if (AccessFactory.CurrentUserRole == (int)UserGroup.COMPANY_OWNER)
    {
%>
<li><%: Html.ActionLink("Bán hàng", "SaleManager", "Manager")%></li>
<li><%: Html.ActionLink("Công nợ", "PaymentManager", "Manager")%></li>
<li><%: Html.ActionLink("Xuất kho", "ExportManager", "Manager")%></li>
<li><%: Html.ActionLink("Nhập kho", "ImportManager", "Manager")%></li>
<li><%: Html.ActionLink("Tổng kho", "StorageManager", "Manager")%></li>
<%
    }
%>
