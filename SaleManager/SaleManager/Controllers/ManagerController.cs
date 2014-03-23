using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using SaleManager.Common;
using SaleManager.Library.Filter;
using SaleManager.Library.Helper;
using SaleManager.Service;

namespace SaleManager.Controllers
{
    [CompanyOwnerFilter]
    public class ManagerController : Controller
    {
        public ActionResult SaleManager()
        {
            return View();
        }

        public ActionResult SearchOrder()
        {
            try
            {
                var table= new StringBuilder();
                var datefrom = DateTime.ParseExact(Request["DateFrom"], "dd/MM/yyyy", null);
                var dateto = DateTime.ParseExact(Request["DateTo"], "dd/MM/yyyy", null);
                var oService = new OrderService();
                var cService = new CustomerService();
                var orders = oService.GetOrderByDate(datefrom, dateto);
                var totalcount = orders.Count();
                var newcount = orders.Count(c => c.IsSeen == false);
                double totalsum = 0, newsum = 0;
               

                table.Append("<table class='table1'>");
                table.Append("<tr>");
                table.Append("<th>Mã đơn hàng</th>");
                table.Append("<th>Giá đơn hàng</th>");
                table.Append("<th>Tỉnh/thành khách hàng</th>");
                table.Append("<th>Trạng thái đơn hàng</th>");
                table.Append("</tr>");
                
                foreach (var order in orders)
                {
                    var total = oService.GetOrderDetailByOrderid(order.Id).Sum(c => c.TotalQuantity);
                    var customer = cService.GetCustomerById(order.CustomerId);
                    if (order.IsSeen == false)
                        table.Append("<tr style='background:grey'>");
                    else
                        table.Append("<tr>");
                    table.AppendFormat("<td>{0}</td>", order.Code);
                    table.AppendFormat("<td>{0}</td>", Constant.ConvertCurrency(total));
                    table.AppendFormat("<td>{0}</td>", customer.City.Name);
                    table.AppendFormat("<td>{0}</td>", AccessFactory.GetStatus(order.Status));
                    table.Append("</tr>");

                    totalsum += total;
                    if (order.IsSeen == false)
                        newsum += total;
                }

                table.Append("</table>");
                oService.UpdateOrderInSeen(orders);   
                
                return Json(new {finish = true, data = table.ToString(),
                                 totalCount = totalcount,
                                 totalSum = Constant.ConvertCurrency(totalsum),
                                 newCount = newcount,
                                 newSum = Constant.ConvertCurrency(newsum)
                });
            }
            catch (Exception e)
            {

                return Json(new { finish = false, data = e.ToString() });

            }
            
            
        }

        public ActionResult PaymentManager()
        {
            return View();
        }

        public ActionResult SearchPayment()
        {
            try
            {
                var table = new StringBuilder();
                var datefrom = DateTime.ParseExact(Request["DateFrom"], "dd/MM/yyyy", null);
                var dateto = DateTime.ParseExact(Request["DateTo"], "dd/MM/yyyy", null);
                var pService = new PaymentService();
                var oService = new OrderService();
                var cService = new CustomerService();
                var payments = pService.GetPaymentByDate(datefrom, dateto);
                double totalCash = 0, totalTransfer = 0;


                table.Append("<table class='table1'>");
                table.Append("<tr>");
                table.Append("<th>Mã đơn hàng</th>");
                table.Append("<th>Khách hàng</th>");
                table.Append("<th>Hình thức thanh toán</th>");
                table.Append("<th>Tổng giá trị</th>");
                table.Append("</tr>");

                foreach (var payment in payments)
                {
                    var total = oService.GetOrderDetailByOrderid(payment.OrderId).Sum(c => c.TotalQuantity);
                    var order = oService.GetOrderById(payment.OrderId);
                    var customer = cService.GetCustomerById(order.CustomerId);
                    if (order.IsSeen == false)
                        table.Append("<tr style='background:grey'>");
                    else
                        table.Append("<tr>");
                    table.AppendFormat("<td>{0}</td>", order.Code);
                    table.AppendFormat("<td>{0}</td>", customer.Name);
                    table.AppendFormat("<td>{0}</td>", payment.PaymentType.Name);
                    table.AppendFormat("<td>{0}</td>", Constant.ConvertCurrency(total));
                    table.Append("</tr>");

                    if (payment.PaymentType.Id == (int)PaymentType.CASH)
                        totalCash += total;
                    else
                        totalTransfer += total;
                }

                table.Append("</table>");

                return Json(new
                {
                    finish = true,
                    data = table.ToString(),
                    totalCash = Constant.ConvertCurrency(totalCash),
                    totalTransfer = Constant.ConvertCurrency(totalTransfer)
                });
            }
            catch (Exception e)
            {

                return Json(new { finish = false, data = e.ToString() });

            }
        }

        
    }
}
