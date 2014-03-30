using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Common;
using SaleManager.Data;

namespace SaleManager.Service
{
   public class CityService
   {
      private readonly SaleManager.Data.SaleMgnEntities _entities = new SaleMgnEntities();

      public IEnumerable<SaleManager.Data.City> GetAllCity()
      {
         return _entities.Cities.OrderBy(p => p.Name).Where(a => a.Status == (int)Status.ACTIVE);
      }
   }
}
