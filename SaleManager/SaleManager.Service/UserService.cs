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
        private readonly QLBHEntities _entities = new QLBHEntities();

        public User GetUserById(int id)
        {
            return _entities.Users.Where(t => t.Status == (int)Status.ACTIVE).First(t => t.Id == id);
        }

        public IEnumerable<User> GetAllUser()
        {
            return _entities.Users.OrderBy(p => p.Id).Where(a => a.Status == (int)Status.ACTIVE);
        }

        public IEnumerable<User> GetAllUserWithDeActive()
        {
            return _entities.Users.OrderBy(p => p.Id);
        }

        public User GetUserByUserName(string username)
        {
            return _entities.Users.SingleOrDefault(t => t.Name == username);
        }

        public void UpdateUser(User user)
        {
            var u = _entities.Users.FirstOrDefault(i => i.Id == user.Id);
            u.UserGroupId = user.UserGroupId;
            u.Name = user.Name;
            u.Password = user.Password;
            u.FirstName = user.FirstName;
            u.LastName = user.LastName;
            u.Gender = user.Gender;
            u.ReferUserId = user.ReferUserId;
            u.Status = user.Status;
            u.LastModifiedBy = user.LastModifiedBy;
            u.LastModifiedDate = DateTime.Now;
            _entities.SaveChanges();
        }

        public void DeleteUser(User user)
        {
            var u = _entities.Users.FirstOrDefault(i => i.Id == user.Id);
            _entities.DeleteObject(u);
            _entities.SaveChanges();
        }
    }
}
