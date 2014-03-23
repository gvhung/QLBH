using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;
using System.Web.SessionState;
using System.Windows.Forms;
using SaleManager.Common;
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
                return (User)Session[Constant.UserLogined] ?? new User();
            }
            set { Session[Constant.UserLogined] = value; }
        }

        public static string CurrentUserName
        {
            get { return CurrentUser.Name; }
        }

        public static int CurrentUserRole
        {
            get
            {
                if (Session[Constant.UserRole] == null)
                    Session[Constant.UserRole] = CurrentUser.UserGroupId;
                return Convert.ToInt32(Session[Constant.UserRole]);
            }
        }

        public static Dictionary<int, string> Cities
        {
            get
            {
                if (Session[Constant.CITY] == null)
                {
                    var ctService = new CityService();
                    var cities = ctService.GetAllCity();
                    var cityall = cities.ToDictionary(city => city.Id, city => city.Name);
                    Session[Constant.CITY] = cityall;
                }
                return (Dictionary<int, string>)Session[Constant.CITY];
            }
        }

        public static string GetStatus(int status)
        {
            switch (status)
            {
                case (int)Status.DELETE: return Constant.STATUS_DELETE;
                case (int)Status.ACTIVE: return Constant.STATUS_ACTIVE;
                case (int)Status.DEACTIVE: return Constant.STATUS_DEACTIVE;
                case (int)Status.REVIEW: return Constant.STATUS_REVIEW;
                case (int)Status.DONE: return Constant.STATUS_DONE;
                default: return "";
            }
        }

        public static void Login(string username)
        {
            var service = new UserService();
            var user = service.GetUserByUserName(username);
            Session[Constant.UserLogined] = user;
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
            return ((User)Session[Constant.UserLogined]).Name != null;
        }

        public static bool IsSaleLogined()
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
            var user = ((User)Session[Constant.UserLogined]);
            return user.Name != null && user.UserGroupId == (int)SaleManager.Common.UserGroup.SALE;
        }

        public static bool IsSaleManagerLogined()
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
            var user = ((User)Session[Constant.UserLogined]);
            return user.Name != null && user.UserGroupId == (int)SaleManager.Common.UserGroup.SALE_MANAGER;
        }

        public static bool IsCompanyOwnerLogined()
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
            var user = ((User)Session[Constant.UserLogined]);
            return user.Name != null && user.UserGroupId == (int)SaleManager.Common.UserGroup.COMPANY_OWNER;
        }
    }
}
