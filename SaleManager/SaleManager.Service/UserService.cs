using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Data;
using SaleManager.Common;

namespace SaleManager.Service
{
   public class UserService
   {
      private readonly SaleManager.Data.QLBHEntities _entities = new QLBHEntities();

      public SaleManager.Data.User GetUserById(int id)
      {
         return _entities.Users.Where(t => t.Status == (int)Status.ACTIVE).First(t => t.Id == id);
      }

      public IEnumerable<SaleManager.Data.User> GetAllUser()
      {
         return _entities.Users.OrderBy(p => p.Id).Where(a => a.Status == (int)Status.ACTIVE);
      }

      public SaleManager.Data.User GetUserByUserName(string username)
      {
         return _entities.Users.Where(t => t.Status == (int)Status.ACTIVE).SingleOrDefault(t => t.Name == username);
      }
   }
}
