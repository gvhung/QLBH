using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SaleManager.Data;

namespace SaleManager.Models
{
   public class CustomerModel
   {
      public string Name { get; set; }
      public string Phone1 { get; set; }
      public string Phone2 { get; set; }
      public string Email { get; set; }
      public string Fax { get; set; }
      public string Address { get; set; }
      public string Note { get; set; }
      public int Type { get; set; }
      public int City { get; set; }
      public string Error { get; set; }
      public bool Save { get; set; }

      public IList<City> cities { get; set; }
      public IList<CustomerType> customertypes { get; set; } 
   }
}