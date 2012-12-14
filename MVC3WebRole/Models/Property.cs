using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Microsoft.WindowsAzure.StorageClient;

namespace MVC3WebRole.Models
{
    public class Property : TableServiceEntity
    {

       public string rentalPropId { get; set; }
       // public string tenancyId { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public bool occupied { get; set; }
       
    }
}