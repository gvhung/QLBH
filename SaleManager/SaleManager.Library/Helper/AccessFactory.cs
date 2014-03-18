using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;
using System.Web.SessionState;
using SaleManager.Data;
using SaleManager.Service;

namespace SaleManager.Library.Helper
{
   public class AccessFactory
   {
      private static HttpSessionState Session
      {
         get { return HttpContext.Current.Session; }
      }

      public static Cache Cache
      {
         get { return HttpContext.Current.Cache; }
      }

      public static User CurrentUser
      {
         get
         {
            var user = (User)Session[Constant.UserLogined];
            if (user == null)
               return new User();

            return (User)Session[Constant.UserLogined];
         }
         set { Session[Constant.UserLogined] = value; }
      }

      public static void Login(string username)
      {
         //var service = new UserService();
         //var user = service.GetUserByUserName(username);
         //Session[Constant.UserLogined] = user;
      }

      public static void Logout()
      {
         Session[Constant.UserLogined] = null;
         Session.Abandon();
      }

      public static bool IsLogined()
      {
         if (Session == null)
         {
            return false;
         }
         else if (Session[Constant.UserLogined] == null)
         {
            Session[Constant.UserLogined] = new User();
            return false;
         }
         return ((SaleManager.Data.User)Session[Constant.UserLogined]).Name != null;
      }
   }
}
