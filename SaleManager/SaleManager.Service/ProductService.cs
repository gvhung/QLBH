using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Data;
using SaleManager.Common; 

namespace SaleManager.Service
{
    public class ProductService
    {
        private readonly SaleMgnEntities _entities = new SaleMgnEntities();

        public Product GetProductById(int id)
        {
            return _entities.Products.Where(t => t.Status == (int)Status.ACTIVE).First(t => t.Id == id);
        }
    }
}
