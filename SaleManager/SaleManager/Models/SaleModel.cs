using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SaleManager.Data;

namespace SaleManager.Models
{
    public class SaleModel
    {
    }

    public class SaleListModel
    {
        public IEnumerable<User> UserList { get; set; }
    }

    public class CustomerListModel
    {
        public string Search { get; set; }
        public int SelectedSeller { get; set; }
        public int SelectedCustomerStatus { get; set; }
        public IEnumerable<User> Sellers { get; set; }
        public IEnumerable<CustomerStatus> Status { get; set; }
        public IEnumerable<Customer> Customers { get; set; } 

    }
}