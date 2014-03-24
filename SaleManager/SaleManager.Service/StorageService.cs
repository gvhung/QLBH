using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManager.Common;
using SaleManager.Data;

namespace SaleManager.Service
{
    public class StorageService
    {
        private readonly QLBHEntities _entities = new QLBHEntities();

        public Storage GetStorageById(int id)
        {
            return _entities.Storages.Where(t => t.Status == (int)Status.ACTIVE).First(t => t.Id == id);
        }

        public IEnumerable<Storage> GetAllStorage()
        {
            return _entities.Storages.OrderBy(p => p.Id).Where(a => a.Status == (int)Status.ACTIVE);
        }
    }
}
