using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using SaleManager.Common;
using SaleManager.Data;
using SaleManager.Library.Filter;
using SaleManager.Library.Helper;
using SaleManager.Models;
using SaleManager.Service;

namespace SaleManager.Controllers
{
   [SaleFilter]
   public class CustomerController : Controller
   {
      public ActionResult Index()
      {
         return View(Init());
      }

      [HttpPost]
      public ActionResult Index(CustomerModel model)
      {
         var m = Init();
         var cService = new CustomerService();
         var customer = new Customer();
         model.cities = m.cities;
         model.customertypes = m.customertypes;
         model.Error = "";
         //valid exist data
         var valid = cService.GetAllCustomer()
            .Where(c => (!string.IsNullOrEmpty(model.Email) && c.Email == model.Email) ||
                        (!string.IsNullOrEmpty(model.Phone1) && c.PhoneNumber1 == model.Phone1) ||
                        (!string.IsNullOrEmpty(model.Phone2) && c.PhoneNumber1 == model.Phone2) ||
                        (!string.IsNullOrEmpty(model.Phone1) && c.PhoneNumber2 == model.Phone1) ||
                        (!string.IsNullOrEmpty(model.Phone2) && c.PhoneNumber2 == model.Phone2));

         if (!valid.Any())
         {
            //save data
            customer.Name = model.Name;
            customer.Code = Constant.CUSTOMER_CODE;
            customer.CustomerType = model.Type;
            customer.PhoneNumber1 = model.Phone1;
            customer.PhoneNumber2 = model.Phone2;
            customer.Email = model.Email;
            customer.FaxNumber = model.Fax;
            customer.Address = model.Address;
            customer.CityId = model.City;
            customer.Note = model.Note;
            customer.ReferUserId = AccessFactory.CurrentUser.Id;
            customer.ApprovedUserId = AccessFactory.CurrentUser.Id;
            customer.Status = (int) Status.REVIEW;
            customer.LastModifiedBy = AccessFactory.CurrentUser.Id;
            customer.LastModifiedDate = DateTime.Now;

            cService.InsertCustomer(customer);
            model.Save = true;
         }
         else
         {
            model.Error = "Khách hàng đã tồn tại";
            model.Save = false;
         }

         return View(model);
      }

      private CustomerModel Init()
      {
         var model = new CustomerModel();
         var ciService = new CityService();
         var cService = new CustomerService();

         model.cities = ciService.GetAllCity().ToList();
         model.customertypes = cService.GetAllCustomerType();
         model.Error = "";
         model.Save = false;
         return model;
      }


      #region order manager
      public ActionResult OrderManager()
      {
          return View();
      }

      public ActionResult SearchCustomer()
      {
          try
          {
              var table = new StringBuilder();
              var datefrom = DateTime.ParseExact(Request["DateFrom"], "dd/MM/yyyy", null);
              var dateto = DateTime.ParseExact(Request["DateTo"], "dd/MM/yyyy", null);
              var oService = new OrderService();
              var orders = oService.GetOrderByDate(datefrom, dateto).
                            Where(c => c.ReferUserId == AccessFactory.CurrentUser.Id);

              table.Append("<table class='table1'>");
              table.Append("<tr>");
              table.Append("<th>Mã đơn hàng</th>");
              table.Append("<th>Tổng giá trị</th>");
              table.Append("<th>Ngày tạo</th>");
              table.Append("</tr>");

              foreach (var order in orders)
              {
                  var total = oService.GetOrderDetailByOrderid(order.Id).Sum(c => c.TotalQuantity);

                  table.Append("<tr>");
                  table.AppendFormat("<td>{0}</td>", order.Code);
                  table.AppendFormat("<td>{0}</td>", Constant.ConvertCurrency(total));
                  table.AppendFormat("<td>{0}</td>", order.CreatedDate.ToString("dd/MM/yyyy"));
                  table.Append("</tr>");
              }

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
