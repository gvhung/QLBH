using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Data;
using SaleManager.Common;

namespace SaleManager.Service
{
    public class OrderService
    {
        private readonly QLBHEntities _entities = new QLBHEntities();

        public IEnumerable<Order> GetAllOrder()
        {
            return _entities.Orders.OrderBy(p => p.Id);
        }

        public Order GetOrderById(int id)
        {
            return _entities.Orders.FirstOrDefault(c => c.Id == id);
        }

        public IEnumerable<Order> GetOrderByDate(DateTime datefrom, DateTime dateto)
        {
            return _entities.Orders.OrderBy(p => p.Id).
                Where(a => a.Status == (int)Status.ACTIVE
                      && DateTime.Compare(a.CreatedDate, datefrom) >= 0
                      && DateTime.Compare(a.CreatedDate, dateto) <= 0);
        }


        public IEnumerable<OrderDetail> GetOrderDetailByOrderid(int orderId)
        {
            return _entities.OrderDetails.OrderBy(p => p.Id).
                Where(a => (a.Status == (int)Status.ACTIVE || a.Status == (int)Status.DONE || a.Status == (int)Status.REVIEW)
                      && a.OrderId == orderId);
        }

        public void UpdateOrderInSeen(IEnumerable<Order> orders)
        {
            var us = _entities.Orders.Where(c => orders.Contains(c));
            foreach (var u in us)
            {
                u.IsSeen = true;
            }
            
            _entities.SaveChanges();
        }
    }
}
