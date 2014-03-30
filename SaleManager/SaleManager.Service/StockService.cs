using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Common;
using SaleManager.Data;

namespace SaleManager.Service
{
    public class StockService
    {
        private readonly SaleMgnEntities _entities = new SaleMgnEntities();

        public Stock GetStockById(int id)
        {
            return _entities.Stocks.Where(t => t.Status == (int)Status.ACTIVE).First(t => t.Id == id);
        }

        public IEnumerable<Stock> GetAllStock()
        {
            return _entities.Stocks.OrderBy(p => p.Id).Where(a => a.Status == (int)Status.ACTIVE);
        }
    }
}
