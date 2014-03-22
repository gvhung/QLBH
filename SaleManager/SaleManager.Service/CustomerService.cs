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
      private readonly QLBHEntities _entities = new QLBHEntities();

      public IList<CustomerType> GetAllCustomerType()
      {
         var list = new List<CustomerType>();
         list.Add(new CustomerType() { Type = (int)CustomType.PERSONAL, Name = Constant.CUSTOMER_TYPE_PERSONAL });
         list.Add(new CustomerType() { Type = (int)CustomType.COMPANY, Name = Constant.CUSTOMER_TYPE_COMPANY });
         return list;
      }

      public IList<CustomerStatus> GetAllCustomerStatus()
      {
          var list = new List<CustomerStatus>();
          list.Add(new CustomerStatus() { Type = (int)Status.ACTIVE, Name = Constant.STATUS_ACTIVE });
          list.Add(new CustomerStatus() { Type = (int)Status.DEACTIVE, Name = Constant.STATUS_DEACTIVE });
          list.Add(new CustomerStatus() { Type = (int)Status.REVIEW, Name = Constant.STATUS_REVIEW });
          return list;
      }

      public IEnumerable<Customer> GetAllCustomer()
      {
         return _entities.Customers.OrderBy(p => p.Id);
      }

      public void InsertCustomer(Customer customer)
      {
         _entities.Customers.AddObject(customer);
         _entities.SaveChanges();
      }

      public Customer GetCustomerById(int id)
      {
          return _entities.Customers.First(t => t.Id == id);
      }

      public void UpdateCustomer(Customer customer)
      {
          var u = _entities.Customers.FirstOrDefault(i => i.Id == customer.Id);
          u.Name = customer.Name;
          u.Code = customer.Code;
          u.CustomerType = customer.CustomerType;
          u.PhoneNumber1 = customer.PhoneNumber1;
          u.PhoneNumber2 = customer.PhoneNumber2;
          u.Email = customer.Email;
          u.FaxNumber = customer.FaxNumber;
          u.Address = customer.Address;
          u.CityId = customer.CityId;
          u.Note = customer.Note;
          u.ReferUserId = customer.ReferUserId;
          u.ApprovedUserId = customer.ApprovedUserId;
          u.Status = customer.Status;
          u.LastModifiedBy = customer.LastModifiedBy;
          u.LastModifiedDate = DateTime.Now;
          _entities.SaveChanges();
      }

      public void DeleteCustomer(Customer customer)
      {
          var u = _entities.Customers.FirstOrDefault(i => i.Id == customer.Id);
          _entities.DeleteObject(u);
          _entities.SaveChanges();
      }
   }
}
