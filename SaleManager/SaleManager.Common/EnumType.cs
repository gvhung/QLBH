using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManager.Common
{
   public enum Status
   {
      DELETE = -1,
      ACTIVE = 0,
      DEACTIVE = 1,
      REVIEW = 2,
      DONE = 3
   }

   public enum UserRole
   {
      ADMINISTRATOR = 0,
      COMPANY_OWNER = 1,
      SALE = 2,
      SALE_MANAGER = 3,
      STAFF = 4,
      STOCK = 5
   }

   //public enum ShippingType : short
   //{
   //   AirportPickUp = 1,
   //   DoorToDoor = 2
   //}

   //public enum PaymentType : short
   //{
   //   Cash = 1,
   //   CreditCard = 2
   //}

   //public enum OrderStatus : short
   //{
   //   Initial = 1,
   //   Transfering = 2,
   //   Received = 3,
   //   Closed = 4
   //}
}
