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
      public const string UserRole = "UserRole";
      public const string CITY = "CITY";
      public const string ALL = "Tất cả";
      public const int ALL_VALUE = 99;

      public const string CUSTOMER_TYPE_PERSONAL = "Cá nhân";
      public const string CUSTOMER_TYPE_COMPANY = "Công ty";
      public const string CUSTOMER_CODE = "C"; //next number is id

      public const string GENDER_MALE = "Nam";
      public const string GENDER_FEMALE = "Nữ";

      public const string STATUS_DELETE = "Xóa";
      public const string STATUS_ACTIVE = "Hoạt động";
      public const string STATUS_DEACTIVE = "Ngưng hoạt động";
      public const string STATUS_REVIEW = "Chờ duyệt";
      public const string STATUS_DONE = "Hoàn tất";


       public static string ConvertCurrency(double money)
       {
           return money.ToString("# ### ### ### ### ### ### ### vnđ");
       }

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
