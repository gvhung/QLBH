using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace SaleManager.Common
{
   public class Constant
   {
      public const string UserLogined = "UserLogined";

      public const string CUSTOMER_TYPE_PERSONAL = "Cá nhân";
      public const string CUSTOMER_TYPE_COMPANY = "Công ty";
      public const string CUSTOMER_CODE = "C"; //next number is id

      #region Pages
      static RedirectToRouteResult _loginPage;
      public static RedirectToRouteResult LoginPage
      {
         get
         {
            if (_loginPage == null)
            {
               var dictionary = new Dictionary<string, object> { { "action", "LogOn" }, { "controller", "Account" } };
               _loginPage = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(dictionary));
            }
            return _loginPage;
         }
      }

      static RedirectToRouteResult _homePage;
      public static RedirectToRouteResult HomePage
      {
         get
         {
            if (_homePage == null)
            {
               var dictionary = new Dictionary<string, object> { { "action", "Index" }, { "controller", "Home" } };
               _homePage = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(dictionary));
            }
            return _homePage;
         }
      }

      #endregion
   }
}
