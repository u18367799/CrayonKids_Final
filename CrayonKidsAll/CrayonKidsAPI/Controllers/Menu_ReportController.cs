using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Data.Entity;
using System.Web.Http;
using System.Web.Http.Cors;
using System.IO;
using System.Web.Hosting;
using System.Net.Http.Headers;
using System.Data;
using CrayonKidsAPI.Models;

namespace CrayonKidsAPI.Controllers
{
    public class Menu_ReportController : ApiController
    {
        [System.Web.Mvc.Route("api/Menu_Report/getMenuItems")]
        [HttpPost]
        public dynamic getReportData(Search sd)
        {
            CrayonKidsEntities db = new CrayonKidsEntities();
            db.Configuration.ProxyCreationEnabled = false;

            List<Menu_Item> menuItem;
            menuItem = db.Menu_Item.Where(zz => zz.Menu_Item_Purchase_Date >= sd.startdate && zz.Menu_Item_Purchase_Date <= sd.enddate).ToList();

            return getExpandoReport(menuItem);
        }

        private dynamic getExpandoReport(List<Menu_Item> menuItem)
        {
            dynamic outObject = new ExpandoObject();
            var menuList = menuItem.GroupBy(rr => rr.Menu_Item_Description);
            var position = 1;
            List<dynamic> menuItems = new List<dynamic>();
            foreach (var group in menuList)
            {
                dynamic menu = new ExpandoObject();
                menu.Position = position++;
                menu.ProductName = group.Key;
                menu.TotalQuantity = group.Sum(ss => ss.Menu_Items_Purchased);
                menuItems.Add(menu);
            }
            outObject.Menu_Items = menuItems;

            return outObject;
        }
    }
}