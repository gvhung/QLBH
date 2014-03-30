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
        #region sale
        public ActionResult SaleManager()
        {
            return View();
        }

        public ActionResult SearchOrder()
        {
            try
            {
                var table = new StringBuilder();
                var datefrom = DateTime.ParseExact(Request["DateFrom"], "dd/MM/yyyy", null);
                var dateto = DateTime.ParseExact(Request["DateTo"], "dd/MM/yyyy", null);
                var oService = new OrderService();
                var cService = new CustomerService();
                var orders = oService.GetOrderByDate(datefrom, dateto);
                var totalcount = orders.Count();
                var newcount = orders.Count(c => c.IsSeen == false);
                double totalsum = 0, newsum = 0;


                table.Append("<table id='table1' class='table1'>");
                table.Append("<thead>");
                table.Append("<tr>");
                table.Append("<th>Mã đơn hàng</th>");
                table.Append("<th>Giá đơn hàng</th>");
                table.Append("<th>Tỉnh/thành khách hàng</th>");
                table.Append("<th>Trạng thái đơn hàng</th>");
                table.Append("</tr>");
                table.Append("</thead>");

                table.Append("<tbody>");
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


                table.Append("</tbody>");
                table.Append("</table>");
                oService.UpdateOrderInSeen(orders);

                return Json(new
                {
                    finish = true,
                    data = table.ToString(),
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
        #endregion

        #region payment
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


                table.Append("<table id='table1' class='table1'>");
                table.Append("<thead>");
                table.Append("<tr>");
                table.Append("<th>Mã đơn hàng</th>");
                table.Append("<th>Khách hàng</th>");
                table.Append("<th>Hình thức thanh toán</th>");
                table.Append("<th>Tổng giá trị</th>");
                table.Append("</tr>");
                table.Append("</thead>");

                table.Append("<tbody>");
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


                table.Append("</tbody>");
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
        #endregion

        #region export
        public ActionResult ExportManager()
        {
            return View();
        }

        public ActionResult SearchExport()
        {
            try
            {
                var table = new StringBuilder();
                var datefrom = DateTime.ParseExact(Request["DateFrom"], "dd/MM/yyyy", null);
                var dateto = DateTime.ParseExact(Request["DateTo"], "dd/MM/yyyy", null);
                var eService = new ExportService();
                var oService = new OrderService();
                var tService = new StockService();
                var cService = new CustomerService();
                var exports = eService.GetExportByDate(datefrom, dateto);


                table.Append("<table id='table1' class='table1'>");
                table.Append("<thead>");
                table.Append("<tr>");
                table.Append("<th>Mã đơn hàng</th>");
                table.Append("<th>Khách hàng</th>");
                table.Append("<th>Tên kho</th>");
                table.Append("<th>Ngày xuất kho</th>");
                table.Append("</tr>");
                table.Append("</thead>");

                table.Append("<tbody>");
                foreach (var export in exports)
                {
                    var order = oService.GetOrderById(export.OrderId);
                    var customer = cService.GetCustomerById(order.CustomerId);
                    var stock = tService.GetStockById(export.StockId);
                    table.Append("<tr>");
                    table.AppendFormat("<td>{0}</td>", order.Code);
                    table.AppendFormat("<td>{0}</td>", customer.Name);
                    table.AppendFormat("<td>{0}</td>", stock.Name);
                    table.AppendFormat("<td>{0}</td>", export.CreatedDate.ToShortDateString());
                    table.Append("</tr>");
                }

                table.Append("</tbody>");
                table.Append("</table>");

                return Json(new
                {
                    finish = true,
                    data = table.ToString()
                });
            }
            catch (Exception e)
            {

                return Json(new { finish = false, data = e.ToString() });

            }
        }
        #endregion

        #region import
        public ActionResult ImportManager()
        {
            return View();
        }

        public ActionResult SearchImport()
        {
            try
            {
                var table = new StringBuilder();
                var datefrom = DateTime.ParseExact(Request["DateFrom"], "dd/MM/yyyy", null);
                var dateto = DateTime.ParseExact(Request["DateTo"], "dd/MM/yyyy", null);
                var iService = new ImportService();
                var pService = new ProviderService();
                var tService = new StockService();
                var imports = iService.GetExportByDate(datefrom, dateto);


                table.Append("<table id='table1' class='table1'>");
                table.Append("<thead>");
                table.Append("<tr>");
                table.Append("<th>Nhà cung cấp</th>");
                table.Append("<th>Ngày giờ</th>");
                table.Append("<th>Tên kho</th>");
                table.Append("</tr>");
                table.Append("</thead>");

                table.Append("<tbody>");
                foreach (var import in imports)
                {
                    var provider = pService.GetProviderById(import.ProviderId);
                    var stock = tService.GetStockById(import.StockId);
                    table.Append("<tr>");
                    table.AppendFormat("<td>{0}</td>", provider.Name);
                    table.AppendFormat("<td>{0}</td>", import.CreatedDate.ToShortDateString());
                    table.AppendFormat("<td>{0}</td>", stock.Name);
                    table.Append("</tr>");
                }


                table.Append("</tbody>");
                table.Append("</table>");

                return Json(new
                {
                    finish = true,
                    data = table.ToString()
                });
            }
            catch (Exception e)
            {

                return Json(new { finish = false, data = e.ToString() });

            }
        }
        #endregion

        #region storage
        public ActionResult StorageManager()
        {
            return View();
        }

        public ActionResult SearchStorage()
        {
            try
            {
                var table = new StringBuilder();
                var sService = new StorageService();
                var pService = new ProductService();
                var tService = new StockService();
                var storages = sService.GetAllStorage().OrderBy(p => p.StockId).ThenBy(p => p.ProductId);

                table.Append("<table id='table1' class='table1'>");
                table.Append("<thead>");
                table.Append("<tr>");
                table.Append("<th>Sản phẩm</th>");
                table.Append("<th>Tên kho</th>");
                table.Append("<th>Số lượng kho</th>");
                table.Append("<th>Số lượng an toàn</th>");
                table.Append("</tr>");
                table.Append("</thead>");

                table.Append("<tbody>");
                foreach (var storage in storages)
                {
                    var product = pService.GetProductById(storage.ProductId);
                    var stock = tService.GetStockById(storage.StockId);
                    table.Append("<tr>");
                    table.AppendFormat("<td>{0}</td>", product.Name);
                    table.AppendFormat("<td>{0}</td>", stock.Name);
                    table.AppendFormat("<td>{0}</td>", storage.Quantity);
                    table.AppendFormat("<td>{0}</td>", product.SafeQuantity);
                    table.Append("</tr>");
                }


                table.Append("</tbody>");
                table.Append("</table>");

                return Json(new
                {
                    finish = true,
                    data = table.ToString()
                });
            }
            catch (Exception e)
            {

                return Json(new { finish = false, data = e.ToString() });

            }
        }
        #endregion
    }
}
