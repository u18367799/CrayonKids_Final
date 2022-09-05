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
    public class Parent_GuardianController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        // GET: api/Parent_Guardian
        public IQueryable<Parent_Guardian> GetParent_Guardian()
        {
            return db.Parent_Guardian;
        }

        // GET: api/Parent_Guardian/5
        [ResponseType(typeof(Parent_Guardian))]
        public IHttpActionResult GetParent_Guardian(int id)
        {
            Parent_Guardian parent_Guardian = db.Parent_Guardian.Find(id);
            if (parent_Guardian == null)
            {
                return NotFound();
            }

            return Ok(parent_Guardian);
        }

        // PUT: api/Parent_Guardian/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutParent_Guardian(int id, Parent_Guardian parent_Guardian)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != parent_Guardian.Parent_Guardian_ID)
            {
                return BadRequest();
            }

            db.Entry(parent_Guardian).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Parent_GuardianExists(id))
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

        // POST: api/Parent_Guardian
        [ResponseType(typeof(Parent_Guardian))]
        public IHttpActionResult PostParent_Guardian(Parent_Guardian parent_Guardian)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var tempID = (from a in db.User_Tbl
                          orderby a.User_ID descending
                          select a.User_ID).FirstOrDefault();
            tempID++;
            parent_Guardian.User_ID = tempID++;
            db.Parent_Guardian.Add(parent_Guardian);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (Parent_GuardianExists(parent_Guardian.Parent_Guardian_ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = parent_Guardian.Parent_Guardian_ID }, parent_Guardian);
        }

        // DELETE: api/Parent_Guardian/5
        [ResponseType(typeof(Parent_Guardian))]
        public IHttpActionResult DeleteParent_Guardian(int id)
        {
            Parent_Guardian parent_Guardian = db.Parent_Guardian.Find(id);
            if (parent_Guardian == null)
            {
                return NotFound();
            }

            db.Parent_Guardian.Remove(parent_Guardian);
            db.SaveChanges();

            return Ok(parent_Guardian);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Parent_GuardianExists(int id)
        {
            return db.Parent_Guardian.Count(e => e.Parent_Guardian_ID == id) > 0;
        }
    }
}