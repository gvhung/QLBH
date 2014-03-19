using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SaleManager.Common;
using SaleManager.Data;
using SaleManager.Library.Helper;
using SaleManager.Models;
using SaleManager.Service;

namespace SaleManager.Controllers
{
   public class CustomerController : Controller
   {
      //
      // GET: /Customer/

      public ActionResult Index()
      {
         return View(Init());
      }

      [HttpPost]
      public ActionResult Index(CustomerModel model)
      {
         var m = Init();
         model.cities = m.cities;
         model.customertypes = m.customertypes;

         //save data
         var cService = new CustomerService();
         var customer = new Customer();
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

         return View(model);
      }

      private CustomerModel Init()
      {
         var model = new CustomerModel();
         var ciService = new CityService();
         var cService = new CustomerService();

         model.cities = ciService.GetAllCity().ToList();
         model.customertypes = cService.GetAllCustomerType();

         return model;
      }

   }
}
