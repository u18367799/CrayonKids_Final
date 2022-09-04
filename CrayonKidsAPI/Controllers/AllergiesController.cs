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
    public class AllergiesController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        // GET: api/Allergy
        public IQueryable<Allergy> GetAllergy()
        {
            return db.Allergies;
        }

        // GET: api/Allergy/5
        [ResponseType(typeof(Allergy))]
        public IHttpActionResult GetAllergy(int id)
        {
            Allergy allergy = db.Allergies.Find(id);
            if (allergy == null)
            {
                return NotFound();
            }

            return Ok(allergy);
        }

        // PUT: api/Allergy/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAllergy(int id, Allergy allergy)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != allergy.Allergy_ID)
            {
                return BadRequest();
            }

            db.Entry(allergy).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AllergyExists(id))
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

        // POST: api/Allergy
        [ResponseType(typeof(Allergy))]
        public IHttpActionResult PostAllergy(Allergy allergy)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Allergies.Add(allergy);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = allergy.Allergy_ID }, allergy);
        }

        // DELETE: api/Allergy/5
        [ResponseType(typeof(Allergy))]
        public IHttpActionResult DeleteAllergy(int id)
        {
            Allergy allergy = db.Allergies.Find(id);
            if (allergy == null)
            {
                return NotFound();
            }

            db.Allergies.Remove(allergy);
            db.SaveChanges();

            return Ok(allergy);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AllergyExists(int id)
        {
            return db.Allergies.Count(e => e.Allergy_ID == id) > 0;
        }
    }
}
