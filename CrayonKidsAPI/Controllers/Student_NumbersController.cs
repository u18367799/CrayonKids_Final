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
    public class Student_NumbersController : ApiController
    {
        [System.Web.Mvc.Route("api/Student_Numbers/getStudentNumbers")]
        [HttpGet]
        public dynamic getReportData()
        {
            CrayonKidsEntities db = new CrayonKidsEntities();
            db.Configuration.ProxyCreationEnabled = false;
            List<Student> student;


            student = db.Students.ToList();


            return getExpandoReport(student);
        }
        private dynamic getExpandoReport(List<Student> student)
        {
            dynamic output = new ExpandoObject();
            var studentList = student.OrderBy(ss => ss.Student_Name);

            List<dynamic> students = new List<dynamic>();
            foreach (var item in studentList)
            {
                dynamic s = new ExpandoObject();
                s.Student_Name = item.Student_Name;
                s.Student_Surname = item.Student_Surname;
                s.Student_Grade = item.Student_Grade;

                students.Add(s);
            }
            output.Students = students;

            return output;
        
        }
    }
}