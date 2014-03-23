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
    
   public enum UserGroup
   {
      ADMINISTRATOR = 1,
      USER = 2,
      COMPANY_OWNER = 3,
      SALE = 4,
      SALE_MANAGER = 5,
      STAFF = 6,
      STOCK = 7
   }

   public enum CustomType
   {
      PERSONAL = 0,
      COMPANY = 1
   }

   public enum Gender
   {
       MALE = 0,
       FEMALE = 1
   }

   public enum ISSEEN
   {
       NEW = 0,
       OLD = 1
   }

   public enum PaymentType
   {
       CASH = 1,
       TRANSFER = 2
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
