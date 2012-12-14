using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Microsoft.WindowsAzure.StorageClient;

namespace MVC3WebRole.Models
{
    public class Tenancy : TableServiceEntity
    {
        

        public string tenancyId { get; set; }
        public string rentalPropId { get; set; }
        public DateTime startDate { get; set; }
        public DateTime endDate { get; set; }
        public double rent { get; set; }
    }
}