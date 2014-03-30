using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Data;
using SaleManager.Common;

namespace SaleManager.Service
{
    public class PaymentService
    {
        private readonly SaleMgnEntities _entities = new SaleMgnEntities();

        public IEnumerable<OrderPayment> GetPaymentByDate(DateTime datefrom, DateTime dateto)
        {
            return _entities.OrderPayments.OrderBy(p => p.Id).
                Where(a => a.Status == (int)Status.ACTIVE
                      && DateTime.Compare(a.CreatedDate, datefrom) >= 0
                      && DateTime.Compare(a.CreatedDate, dateto) <= 0);
        }
    }
}
