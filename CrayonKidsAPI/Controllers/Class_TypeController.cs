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
    public class Class_TypeController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        // GET: api/Class_Type
        public IQueryable<Class_Type> GetClass_Type()
        {
            return db.Class_Type;
        }

        // GET: api/Class_Type/5
        [ResponseType(typeof(Class_Type))]
        public IHttpActionResult GetClass_Type(int id)
        {
            Class_Type class_Type = db.Class_Type.Find(id);
            if (class_Type == null)
            {
                return NotFound();
            }

            return Ok(class_Type);
        }

        // PUT: api/Class_Type/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutClass_Type(int id, Class_Type class_Type)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != class_Type.Class_Type_ID)
            {
                return BadRequest();
            }

            db.Entry(class_Type).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Class_TypeExists(id))
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

        // POST: api/Class_Type
        [ResponseType(typeof(Class_Type))]
        public IHttpActionResult PostClass_Type(Class_Type class_Type)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Class_Type.Add(class_Type);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = class_Type.Class_Type_ID }, class_Type);
        }

        // DELETE: api/Class_Type/5
        [ResponseType(typeof(Class_Type))]
        public IHttpActionResult DeleteClass_Type(int id)
        {
            Class_Type class_Type = db.Class_Type.Find(id);
            if (class_Type == null)
            {
                return NotFound();
            }

            db.Class_Type.Remove(class_Type);
            db.SaveChanges();

            return Ok(class_Type);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Class_TypeExists(int id)
        {
            return db.Class_Type.Count(e => e.Class_Type_ID == id) > 0;
        }
    }
}