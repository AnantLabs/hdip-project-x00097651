using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.StorageClient;

using MVC3WebRole.Models;

namespace MVC3WebRole.Controllers
{
    public class TenantController : Controller
    {
        //
        // GET: /TableStorage/

        public ActionResult Index()
        {
           

            //Initialize variables needed to manipulate table
            CloudStorageAccount csAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue("Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString"));
            CloudTableClient ctClient = csAccount.CreateCloudTableClient();
            var context = ctClient.GetDataServiceContext();

            //Create table if it doesn't exist
            ctClient.CreateTableIfNotExist("MyAzureTable");

            //Get all items from table
            var tableStorageItems = from items in context.CreateQuery<Tenant>("MyAzureTable") where items.PartitionKey == "Tenant" select items;

            //Return items to View for listing
            return View(tableStorageItems);
        }

        //
        // GET: /TableStorage/Details/5

        public ActionResult Details(string PartitionKey, string RowKey  /*int id*/)
        {
            PartitionKey = "Tenant";
            //Initialize variables needed to manipulate table
            CloudStorageAccount csAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue("Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString"));
            CloudTableClient ctClient = csAccount.CreateCloudTableClient();
            var context = ctClient.GetDataServiceContext();


            //Fetch item from table to display on the page
            var result = (from item in context.CreateQuery<Tenant>("MyAzureTable")
                          where item.PartitionKey == PartitionKey && item.RowKey == RowKey
                          select item).FirstOrDefault();

            return View(result);
        }

        //
        // GET: /TableStorage/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /TableStorage/Create

        [HttpPost]
        public ActionResult Create(Tenant item)
        {
            try
            {
                //Initialize variables needed to manipulate table
                CloudStorageAccount csAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue("Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString"));
                CloudTableClient ctClient = csAccount.CreateCloudTableClient();
                var context = ctClient.GetDataServiceContext();

                //Some random unique Partition and Row keys for the item
              //  item.PartitionKey = Guid.NewGuid().ToString();

                item.PartitionKey = "Tenant";
                item.RowKey = Guid.NewGuid().ToString();

                //Upload item to Table
                context.AddObject("MyAzureTable", item);
                context.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /TableStorage/Edit/5

        public ActionResult Edit(string PartitionKey, string RowKey  /*int id*/)
        {
            PartitionKey = "Tenant";

            //Initialize variables needed to manipulate table
            CloudStorageAccount csAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue("Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString"));
            CloudTableClient ctClient = csAccount.CreateCloudTableClient();
            var context = ctClient.GetDataServiceContext();


            //Fetch item from table to display old values to be edited
            var result = (from item in context.CreateQuery<Tenant>("MyAzureTable")
                          where item.PartitionKey == PartitionKey && item.RowKey == RowKey
                          select item).FirstOrDefault();

            return View(result);
        }

        //
        // POST: /TableStorage/Edit/5

        [HttpPost]
        public ActionResult Edit(Tenant modifiedItem /*int id, FormCollection collection*/)
        {
            try
            {
                //Initialize variables needed to manipulate table
                CloudStorageAccount csAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue("Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString"));
                CloudTableClient ctClient = csAccount.CreateCloudTableClient();
                var context = ctClient.GetDataServiceContext();

                var result = (from item in context.CreateQuery<Tenant>("MyAzureTable")
                              where item.PartitionKey == modifiedItem.PartitionKey && item.RowKey == modifiedItem.RowKey
                              select item).FirstOrDefault();

                //delete old item
                context.DeleteObject(result);

                //Add new modified item
                context.AddObject("MyAzureTable", modifiedItem);
                context.SaveChanges();

               

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /TableStorage/Delete/5

        public ActionResult Delete(string PartitionKey, string RowKey /*int id*/)
        {
            PartitionKey = "Tenant";
            //Initialize variables needed to manipulate table
            CloudStorageAccount csAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue("Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString"));
            CloudTableClient ctClient = csAccount.CreateCloudTableClient();
            var context = ctClient.GetDataServiceContext();


           
            var result = (from item in context.CreateQuery<Tenant>("MyAzureTable")
                          where item.PartitionKey == PartitionKey && item.RowKey == RowKey
                          select item).FirstOrDefault();

            return View(result);
        }

        //
        // POST: /TableStorage/Delete/5

        [HttpPost]
        public ActionResult Delete(Tenant itemToDelete /*int id, FormCollection collection*/)
        {
            try
            {
                //Initialize variables needed to manipulate table
                CloudStorageAccount csAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue("Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString"));
                CloudTableClient ctClient = csAccount.CreateCloudTableClient();
                var context = ctClient.GetDataServiceContext();

                // fetch item we want to delete
                var result = (from item in context.CreateQuery<Tenant>("MyAzureTable")
                              where item.PartitionKey == itemToDelete.PartitionKey && item.RowKey == itemToDelete.RowKey
                              select item).FirstOrDefault();

                //delete it
                context.DeleteObject(result);
                context.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
