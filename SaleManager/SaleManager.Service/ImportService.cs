using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Common;
using SaleManager.Data;

namespace SaleManager.Service
{
    public class ImportService
    {
        private readonly SaleMgnEntities _entities = new SaleMgnEntities();
        public IEnumerable<Import> GetExportByDate(DateTime datefrom, DateTime dateto)
        {
            return _entities.Imports.OrderBy(p => p.Id).
                Where(a => a.Status == (int)Status.ACTIVE
                      && DateTime.Compare(a.CreatedDate, datefrom) >= 0
                      && DateTime.Compare(a.CreatedDate, dateto) <= 0);
        }
    }
}
