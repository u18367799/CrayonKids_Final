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
    public class ClassController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        // GET: api/Class
        public IQueryable<Class> GetClass()
        {
            return db.Classes;
        }

        // GET: api/Class/5
        [ResponseType(typeof(Class))]
        public IHttpActionResult GetClass(int id)
        {
            Class Class = db.Classes.Find(id);
            if (Class == null)
            {
                return NotFound();
            }

            return Ok(Class);
        }

        // PUT: api/Class/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutClass(int id, Class Class)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != Class.Class_ID)
            {
                return BadRequest();
            }

            db.Entry(Class).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClassExists(id))
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

        // POST: api/Class
        [ResponseType(typeof(Class))]
        public IHttpActionResult PostClass(Class Class)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Classes.Add(Class);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = Class.Class_ID }, Class);
        }

        // DELETE: api/Class/5
        [ResponseType(typeof(Class))]
        public IHttpActionResult DeleteClass(int id)
        {
            Class Class = db.Classes.Find(id);
            if (Class == null)
            {
                return NotFound();
            }

            db.Classes.Remove(Class);
            db.SaveChanges();

            return Ok(Class);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ClassExists(int id)
        {
            return db.Classes.Count(e => e.Class_ID == id) > 0;
        }


    }
}
