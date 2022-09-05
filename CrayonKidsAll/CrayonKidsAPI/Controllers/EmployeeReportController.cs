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
    public class EmployeeReportController : ApiController
    {
        [System.Web.Mvc.Route("api/EmployeeReport/getEmployees")]
        [HttpPost]
        public dynamic getReportData(Search sd)
        {
            CrayonKidsEntities db = new CrayonKidsEntities();
            db.Configuration.ProxyCreationEnabled = false;

            List<Employee> lists;
            lists = db.Employees.Where(zz => zz.Hire_Date >= sd.startdate && zz.Hire_Date <= sd.enddate).ToList();

            return getExpandoReport(lists);
        }


        private dynamic getExpandoReport(List<Employee> emp)
        {
            dynamic output = new ExpandoObject();
            var empList = emp.GroupBy(rr => rr.Province);
            List<dynamic> products = new List<dynamic>();
            foreach (var group in empList)
            {
                dynamic product = new ExpandoObject();
                product.ProvinceName = group.Key;
                product.Total = group.Count();
                products.Add(product);
            }
            output.Employees = products;

            //dynamic output = new ExpandoObject();
            //var empList = emp.GroupBy(rr => rr.Province);
            //List<dynamic> employees = new List<dynamic>();
            //foreach (var item in empList)
            //{
            //    dynamic employee = new ExpandoObject();
            //    employee.ProvinceName = item.Key;
            //    employee.Total = item.Count();
            //    employee.Add();
            //}
            //output.Employees = employees;


            List<dynamic> items = new List<dynamic>();
            foreach (var item in empList)
            {
                dynamic PName = new ExpandoObject();
                PName.PName = item.Key;
                PName.Total = item.Count();
                List<dynamic> flexi = new List<dynamic>();
                foreach (var x in item)
                {
                    dynamic obj = new ExpandoObject();
                    obj.Full_Name = x.Name + " " + x.Surname;
                    obj.Hire_Date = x.Hire_Date;
                    obj.City = x.City;
                    flexi.Add(obj);
                }
                PName.Employee = flexi;
                items.Add(PName);
            }
            output.EmpNames = items;
            return output;
        }
    }
}