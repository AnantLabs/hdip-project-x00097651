using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Microsoft.WindowsAzure.StorageClient;

namespace MVC3WebRole.Models
{
    public class Tenant : TableServiceEntity
    {


        public string tenancyId { get; set; }
        public string tenantName { get; set; }
        
    }
}