using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Data;
using SaleManager.Common;

namespace SaleManager.Service
{
   public class CustomerService
   {
      private readonly SaleManager.Data.QLBHEntities _entities = new QLBHEntities();

      public IList<SaleManager.Data.CustomerType> GetAllCustomerType()
      {
         var list = new List<SaleManager.Data.CustomerType>();
         list.Add(new CustomerType() { Type = (int)CustomType.PERSONAL, Name = Constant.CUSTOMER_TYPE_PERSONAL });
         list.Add(new CustomerType() { Type = (int)CustomType.COMPANY, Name = Constant.CUSTOMER_TYPE_COMPANY });
         return list;
      }

      public void InsertCustomer(Customer customer)
      {
         _entities.Customers.AddObject(customer);
         _entities.SaveChanges();
      }
   }
}
