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
using UserGroup = SaleManager.Common.UserGroup;

namespace SaleManager.Controllers
{
    [SaleManagerFilter]
    public class SaleController : Controller
    {
        #region sales
        public ActionResult SaleList()
        {
            var uService = new UserService();
            var model = new SaleListModel
            {
                UserList = uService.GetAllUserWithDeActive()
                    .Where(c => c.UserGroupId == (int) UserGroup.SALE &&
                                c.ReferUserId == AccessFactory.CurrentUser.Id)
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult UpdateSaleStatus()
        {
            try
            {
                string name = Request["Name"];
                string status = Request["Status"];
                var uService = new UserService();
                var user = uService.GetUserByUserName(name);
                if (user != null)
                {
                    if (status == Status.ACTIVE.ToString())
                        user.Status = (int)Status.ACTIVE;
                    else
                        user.Status = (int)Status.DEACTIVE;
                    uService.UpdateUser(user);
                }

                return Json(new { finish = true });
            }
            catch (Exception)
            {

                return Json(new { finish = false });
            }

        }
        #endregion

        #region Customers
        public ActionResult CustomerList()
        {
            var model = initCustomerListModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult CustomerList(CustomerListModel model)
        {
            model = initCustomerListModel(model.SelectedSeller, model.SelectedCustomerStatus, model.Search);
            return View(model);
        }

        [HttpPost]
        public ActionResult UpdateCustomer()
        {
            try
            {
                int id = Convert.ToInt32(Request["Name"]);
                string status = Request["Status"];
                var cService = new CustomerService();
                var customer = cService.GetCustomerById(id);
                if (customer != null)
                {
                    if (status == Status.ACTIVE.ToString())
                    {
                        customer.Status = (int)Status.ACTIVE;
                        customer.ApprovedUserId = AccessFactory.CurrentUser.Id;
                        customer.LastModifiedBy = AccessFactory.CurrentUser.Id;
                        cService.UpdateCustomer(customer);
                    }
                    else if (status == Status.DELETE.ToString())
                    {
                        cService.DeleteCustomer(customer);
                    }
                }

                return Json(new { finish = true });
            }
            catch (Exception)
            {

                return Json(new { finish = false });
            }
        }

        private CustomerListModel initCustomerListModel(int selectedUser = Constant.ALL_VALUE, 
                                                        int seletedStatus = Constant.ALL_VALUE,
                                                        string searchKey = "")
        {
            var model = new CustomerListModel();
            var uService = new UserService();
            var cService = new CustomerService();

            var sellers = uService.GetAllUser().Where(c => c.ReferUserId == AccessFactory.CurrentUser.Id).ToList();
            sellers.Insert(0, new User() { Id = Constant.ALL_VALUE, Name = Constant.ALL });
            model.Sellers = sellers;

            var statuses = cService.GetAllCustomerStatus();
            statuses.Insert(0, new CustomerStatus() { Name = Constant.ALL, Type = Constant.ALL_VALUE });
            model.Status = statuses;

            var allcustomer = new List<Customer>();

            var sellersfilter = sellers;
            if (selectedUser != Constant.ALL_VALUE)
                sellersfilter = sellersfilter.Where(c => c.Id == selectedUser).ToList();

            searchKey = searchKey != null ? searchKey.Trim().ToLower() : "";

            foreach (var seller in sellersfilter)
            {
                allcustomer.AddRange(cService.GetAllCustomer().Where(c => c.ReferUserId == seller.Id).ToList());
            }

            if (seletedStatus != Constant.ALL_VALUE)
                allcustomer = allcustomer.Where(c => c.Status == seletedStatus).ToList();

            if (searchKey != "")
                //allcustomer = (from c in allcustomer
                //               where c.Name.ToLower().Contains(searchKey)
                //               select c).OrderBy(c => c.Name).ToList();
                allcustomer = allcustomer.Where(c => (c.Name != null && c.Name.ToLower().Contains(searchKey))
                    || (c.PhoneNumber1 != null && c.PhoneNumber1.ToLower().Contains(searchKey))
                    || (c.PhoneNumber2 != null && c.PhoneNumber2.ToLower().Contains(searchKey)) 
                    || (c.Email != null && c.Email.Contains(searchKey))
                                                     ).ToList();

            model.Customers = allcustomer;

            model.SelectedSeller = Constant.ALL_VALUE;
            model.SelectedCustomerStatus = Constant.ALL_VALUE;
            model.Search = "";

            return model;
        }

         #endregion
    }
}
