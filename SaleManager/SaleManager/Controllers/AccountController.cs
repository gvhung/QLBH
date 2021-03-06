﻿using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using SaleManager.Models;
using SaleManager.Data;
using SaleManager.Library.Helper;
using SaleManager.Models;
using SaleManager.Service;
using UserGroup = SaleManager.Common.UserGroup;

namespace SaleManager.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {
        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LogOnModel model)
        {
            if (ModelState.IsValid)
            {
                //check user & password
                if (CheckLogin(model.UserName, model.Password))
                {
                    AccessFactory.Login(model.UserName);
                    //save cookie
                    if (model.RememberMe)
                        AddCookie(model);
                    else
                        ClearCookie();

                    if (AccessFactory.CurrentUserRole == (int)UserGroup.SALE)
                        return RedirectToAction("Index", "Customer");
                    else if (AccessFactory.CurrentUserRole == (int)UserGroup.SALE_MANAGER)
                        return RedirectToAction("CustomerList", "Sale");
                    else if (AccessFactory.CurrentUserRole == (int)UserGroup.COMPANY_OWNER)
                        return RedirectToAction("SaleManager", "Manager");

                }
                else
                {
                    model.Errors = "Tài khoản hoặc mật khẩu không chính xác.";
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        public ActionResult LogOff()
        {
            AccessFactory.Logout();
            ClearCookie();

            return RedirectToAction("LogOn", "Account");
        }

        private void AddCookie(LogOnModel model)
        {
            var cookie = new HttpCookie("userinfo");
            cookie.Values["UserName"] = model.UserName;
            cookie.Values["Password"] = model.Password;
            Response.Cookies.Add(cookie);
        }

        private void ClearCookie()
        {
            var cookie = Request.Cookies["userinfo"];
            if (cookie != null)
            {
                cookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(cookie);
            }
        }

        public bool CheckLogin(string username, string password)
        {
            var userService = new UserService();
            var user = userService.GetUserByUserName(username);
            string encryptPw = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Trim(), "sha1");
            if (user != null && user.Password == encryptPw) return true;

            return false;
        }
    }
}
