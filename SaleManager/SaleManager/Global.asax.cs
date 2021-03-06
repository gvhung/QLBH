﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SaleManager
{
   // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
   // visit http://go.microsoft.com/?LinkId=9394801

   public class MvcApplication : System.Web.HttpApplication
   {
      public static void RegisterRoutes(RouteCollection routes)
      {
         routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

         routes.MapRoute(
             "Default", // Route name
             "{controller}/{action}/{id}", // URL with parameters
             new { controller = "Account", action = "LogOn", id = UrlParameter.Optional } // Parameter defaults
         );

         routes.MapRoute(
            "Customer", // Route name
            "{controller}/{action}/{id}", // URL with parameters
            new { controller = "Customer", action = "Index", id = UrlParameter.Optional } // Parameter defaults
        );

         //User list
         routes.MapRoute(
              "SaleList", // Route name
              "{controller}/{action}", // URL with parameters
              new { controller = "Sale", action = "SaleList" } // Parameter defaults
          );

         routes.MapRoute(
             "CustomerList", // Route name
             "{controller}/{action}", // URL with parameters
             new { controller = "Sale", action = "CustomerList" } // Parameter defaults
         );

         routes.MapRoute(
           "Manager", // Route name
           "{controller}/{action}", // URL with parameters
           new { controller = "Manager", action = "SaleManager" } // Parameter defaults
       );
      }

      protected void Application_Start()
      {
         AreaRegistration.RegisterAllAreas();

         RegisterRoutes(RouteTable.Routes);
      }
   }
}