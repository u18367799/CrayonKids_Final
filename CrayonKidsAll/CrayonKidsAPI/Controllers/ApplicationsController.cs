using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using CrayonKidsAPI.Models;

namespace CrayonKidsAPI.Controllers
{
    public class ApplicationsController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        // GET: api/Applications
        public IQueryable<Application> GetApplications()
        {
            return db.Applications;
        }

        [System.Web.Http.Route("api/GetApplications")]
        [HttpGet]

        public System.Object getApplications()
        {
            var application = (from a in db.Applications
                             join b in db.Application_Status on a.Application_Status_ID equals b.Application_Status_ID

                             select new
                             {
                                 a.Application_ID,
                                 a.Application_Status_ID,
                                 a.Application_Date,
                                 a.Parent_Name,
                                 a.Parent_Surname,
                                 a.Parent_Contact_No,
                                 a.Parent_Email,
                                 a.Student_Name,
                                 a.Student_Surname,
                                 a.Student_Grade,
                                 b.Description
                             }).ToList();
            return application;
        }

        [System.Web.Http.Route("api/GetApplication/{id}")]
        [HttpGet]

        public System.Object getApplication(int id)
        {
            var application = (from a in db.Applications
                             join b in db.Application_Status on a.Application_Status_ID equals b.Application_Status_ID
                             where a.Application_ID == id

                             select new
                             {
                                 a.Application_ID,
                                 a.Application_Status_ID,
                                 a.Application_Date,
                                 a.Parent_Name,
                                 a.Parent_Surname,
                                 a.Parent_Contact_No,
                                 a.Parent_Email,
                                 a.Student_Name,
                                 a.Student_Surname,
                                 a.Student_Grade,
                                 b.Description
                             }).FirstOrDefault();
            return application;
        }

        // GET: api/Applications/5
        [ResponseType(typeof(Application))]
        public IHttpActionResult GetApplication(int id)
        {
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return NotFound();
            }

            return Ok(application);
        }

        // PUT: api/Applications/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutApplication(int id, Application application)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != application.Application_ID)
            {
                return BadRequest();
            }

            db.Entry(application).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ApplicationExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Applications
        [ResponseType(typeof(Application))]
        public IHttpActionResult PostApplication(Application application)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Applications.Add(application);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = application.Application_ID }, application);
        }

        // DELETE: api/Applications/5
        [ResponseType(typeof(Application))]
        public IHttpActionResult DeleteApplication(int id)
        {
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return NotFound();
            }

            db.Applications.Remove(application);
            db.SaveChanges();

            return Ok(application);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ApplicationExists(int id)
        {
            return db.Applications.Count(e => e.Application_ID == id) > 0;
        }
    }
}