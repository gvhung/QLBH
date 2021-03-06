﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using SaleManager.Common;
using SaleManager.Library.Helper;

namespace SaleManager.Library.Filter
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class CompanyOwnerFilter : FilterAttribute, IAuthorizationFilter 
    {
        public void OnAuthorization(AuthorizationContext filterContext)
        {
            if (!AccessFactory.IsCompanyOwnerLogined())
                filterContext.Result = Constant.LoginPage;
        }
    }
}
