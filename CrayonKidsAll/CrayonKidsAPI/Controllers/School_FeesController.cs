using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using CrayonKidsAPI.Models;

namespace CrayonKidsAPI.Controllers
{
    public class School_FeesController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        // GET: api/School_Fees
        public IQueryable<School_Fees> GetSchool_Fees()
        {
            return db.School_Fees;
        }

        // GET: api/School_Fees/5
        [ResponseType(typeof(School_Fees))]
        public IHttpActionResult GetSchool_Fees(int id)
        {
            School_Fees school_Fees = db.School_Fees.Find(id);
            if (school_Fees == null)
            {
                return NotFound();
            }

            return Ok(school_Fees);
        }

        // PUT: api/School_Fees/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSchool_Fees(int id, School_Fees school_Fees)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != school_Fees.School_Fees_ID)
            {
                return BadRequest();
            }

            db.Entry(school_Fees).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!School_FeesExists(id))
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

        // POST: api/School_Fees
        [ResponseType(typeof(School_Fees))]
        public IHttpActionResult PostSchool_Fees(School_Fees school_Fees)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var studentID = (from a in db.Students
                          orderby a.Student_ID descending
                          select a.Student_ID).FirstOrDefault();
            //studentID++;
            school_Fees.Student_ID = studentID;

            db.School_Fees.Add(school_Fees);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = school_Fees.School_Fees_ID }, school_Fees);
        }

        // DELETE: api/School_Fees/5
        [ResponseType(typeof(School_Fees))]
        public IHttpActionResult DeleteSchool_Fees(int id)
        {
            School_Fees school_Fees = db.School_Fees.Find(id);
            if (school_Fees == null)
            {
                return NotFound();
            }

            db.School_Fees.Remove(school_Fees);
            db.SaveChanges();

            return Ok(school_Fees);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool School_FeesExists(int id)
        {
            return db.School_Fees.Count(e => e.School_Fees_ID == id) > 0;
        }
    }
}