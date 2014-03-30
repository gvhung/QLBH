using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Data;
using SaleManager.Common; 

namespace SaleManager.Service
{
    public class ProviderService
    {
        private readonly SaleMgnEntities _entities = new SaleMgnEntities();

        public Provider GetProviderById(int id)
        {
            return _entities.Providers.Where(t => t.Status == (int)Status.ACTIVE).First(t => t.Id == id);
        }
    }
}
