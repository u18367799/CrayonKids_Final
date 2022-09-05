using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Web.Http;
using System.Web.Http.Description;
using CrayonKidsAPI.Models;

namespace CrayonKidsAPI.Controllers
{
    public class User_TblController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        [System.Web.Http.Route("api/User/registerNewUser")]
        [System.Web.Mvc.HttpPost]
        public HttpResponseMessage RegisterNewUser([FromBody] User_Tbl user)
        {
          
            db.Configuration.ProxyCreationEnabled = false;

            User_Tbl pUser = new User_Tbl();
            pUser.User_Type_ID = 2;
            var hash = GenerateHash(user.Password);
            pUser.Password = hash;
            pUser.Username = user.Username;
            
                try
                {
                    db.User_Tbl.Add(pUser);
                    db.SaveChanges();
                }
                catch (Exception)
                {
                return Request.CreateResponse(HttpStatusCode.BadRequest, pUser);
            }
                var response = Request.CreateResponse(HttpStatusCode.OK, pUser);
                return response;
            
        }

        public static string GenerateHash(string inputString)
        {

            using (SHA256 shaHash = SHA256.Create())
            {
                byte[] builder = shaHash.ComputeHash(Encoding.UTF8.GetBytes(inputString));
                StringBuilder myBuilder = new StringBuilder();
                for (int counter = 0; counter < builder.Length; counter++)
                {
                    myBuilder.Append(builder[counter].ToString("x2"));
                }

                myBuilder.ToString();

                return myBuilder.ToString();
            }
        }

        //Parent Login
        [Route("api/ParentLogin")]
        [HttpPost]
        public dynamic ParentLogin([FromBody] User_Tbl usr)
        {
            //check if user exists
            User_Tbl checkUserExist = db.User_Tbl.Where(usrw => usrw.Username == usr.Username).FirstOrDefault();
            if (checkUserExist == null)
            {
                dynamic retEmptyUser = new ExpandoObject();
                retEmptyUser.Message = "User does not exist!";
                return retEmptyUser;
            }

            var hash = GenerateHash(usr.Password);
            User_Tbl usrr = db.User_Tbl.Where(usrw => usrw.Username == usr.Username && usrw.Password == hash)
                             .Include(zz => zz.Parent_Guardian)
                             .FirstOrDefault();
            if (usrr != null)
            {
                var user = (from a in db.Parent_Guardian
                            where a.User_ID == usrr.User_ID
                            select new
                            {
                                a.Parent_Guardian_ID,
                                a.User_ID,
                                a.Parent_Name,
                                a.Parent_Surname,
                                a.Parent_Email_Address,
                            }).FirstOrDefault();
                return user;
            }
            else
            {
                dynamic user = new ExpandoObject();
                user.Message = "Invalid Password!";
                return user;
            }

        }

        //Employee Login
        [Route("api/EmployeeLogin")]
        [HttpPost]
        public dynamic EmployeeLogin([FromBody] User_Tbl usr)
        {
            //check if user exists
            User_Tbl checkUserExist = db.User_Tbl.Where(usrw => usrw.Username == usr.Username).FirstOrDefault();
            if (checkUserExist == null)
            {
                dynamic retEmptyUser = new ExpandoObject();
                retEmptyUser.Message = "User does not exist!";
                return retEmptyUser;
            }

            var hash = GenerateHash(usr.Password);
            User_Tbl usrr = db.User_Tbl.Where(usrw => usrw.Username == usr.Username && usrw.Password == hash)
                             .Include(zz => zz.Parent_Guardian)
                             .FirstOrDefault();
            if (usrr != null)
            {
                var user = (from a in db.Employees
                            where a.User_ID == usrr.User_ID
                            select new
                            {
                                a.Employee_ID,
                                a.User_ID,
                                a.Name,
                                a.Surname,
                                a.Email_Address
                            }).FirstOrDefault();
                return user;
            }
            else
            {
                dynamic user = new ExpandoObject();
                user.Message = "Invalid Password!";
                return user;
            }

        }

    }

}