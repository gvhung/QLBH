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

        public ActionResult SaveCustomer()
        {
            try
            {
                var Name = Request["Name"];
                var Phone1 = Request["Phone1"];
                var Phone2 = Request["Phone2"];
                var Email = Request["Email"];
                var Fax = Request["Fax"];
                var Address = Request["Address"];
                var Note = Request["Note"];
                var Type = Convert.ToInt32(Request["Type"]);
                var City = Convert.ToInt32(Request["City"]);


                var model = Init();
                var cService = new CustomerService();
                var customer = new Customer();
                model.Error = "";
                //valid exist data
                var valid = cService.GetAllCustomer()
                   .Where(c => (!string.IsNullOrEmpty(Email) && c.Email == Email) ||
                               (!string.IsNullOrEmpty(Phone1) && c.PhoneNumber1 == Phone1) ||
                               (!string.IsNullOrEmpty(Phone2) && c.PhoneNumber1 == Phone2) ||
                               (!string.IsNullOrEmpty(Phone1) && c.PhoneNumber2 == Phone1) ||
                               (!string.IsNullOrEmpty(Phone2) && c.PhoneNumber2 == Phone2));

                if (!valid.Any())
                {
                    //save data

                    customer.Name = Name;
                    customer.CustomerType = Type;
                    customer.PhoneNumber1 = Phone1;
                    customer.PhoneNumber2 = Phone2;
                    customer.Code = Constant.CUSTOMER_CODE;
                    customer.Email = Email;
                    customer.FaxNumber = Fax;
                    customer.Address = Address;
                    customer.CityId = City;
                    customer.Note = Note;
                    customer.ReferUserId = AccessFactory.CurrentUser.Id;
                    customer.ApprovedUserId = AccessFactory.CurrentUser.Id;
                    customer.Status = (int)Status.REVIEW;
                    customer.LastModifiedBy = AccessFactory.CurrentUser.Id;
                    customer.LastModifiedDate = DateTime.Now;

                    cService.InsertCustomer(customer);
                }
                else
                {
                    return Json(new { finish = false, data = "Khách hàng đã tồn tại" });
                }

            }
            catch (Exception e)
            {
                return Json(new { finish = false, data = e.ToString() });
            }
            return Json(new { finish = true, data = "Lưu thành công" });
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
                customer.Status = (int)Status.REVIEW;
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

                table.Append("<table id='table1' class='table1'>");
                table.Append("<thead>");
                table.Append("<tr>");
                table.Append("<th>Mã đơn hàng</th>");
                table.Append("<th>Tổng giá trị</th>");
                table.Append("<th>Ngày tạo</th>");
                table.Append("</tr>");
                table.Append("</thead>");

                table.Append("<tbody>");
                foreach (var order in orders)
                {
                    var total = oService.GetOrderDetailByOrderid(order.Id).Sum(c => c.TotalQuantity);

                    table.Append("<tr>");
                    table.AppendFormat("<td>{0}</td>", order.Code);
                    table.AppendFormat("<td>{0}</td>", Constant.ConvertCurrency(total));
                    table.AppendFormat("<td>{0}</td>", order.CreatedDate.ToString("dd/MM/yyyy"));
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
