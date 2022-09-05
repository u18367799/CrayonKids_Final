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
    public class Menu_ItemController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        // GET: api/Menu_Item
        public IQueryable<Menu_Item> GetMenu_Item()
        {
            return db.Menu_Item;
        }

        // GET: api/Menu_Item/5
        [ResponseType(typeof(Menu_Item))]
        public IHttpActionResult GetMenu_Item(int id)
        {
            Menu_Item menu_Item = db.Menu_Item.Find(id);
            if (menu_Item == null)
            {
                return NotFound();
            }

            return Ok(menu_Item);
        }

        // PUT: api/Menu_Item/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMenu_Item(int id, Menu_Item menu_Item)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != menu_Item.Menu_Item_ID)
            {
                return BadRequest();
            }

            db.Entry(menu_Item).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Menu_ItemExists(id))
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

        // POST: api/Menu_Item
        [ResponseType(typeof(Menu_Item))]
        public IHttpActionResult PostMenu_Item(Menu_Item menu_Item)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Menu_Item.Add(menu_Item);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = menu_Item.Menu_Item_ID }, menu_Item);
        }

        // DELETE: api/Menu_Item/5
        [ResponseType(typeof(Menu_Item))]
        public IHttpActionResult DeleteMenu_Item(int id)
        {
            Menu_Item menu_Item = db.Menu_Item.Find(id);
            if (menu_Item == null)
            {
                return NotFound();
            }

            db.Menu_Item.Remove(menu_Item);
            db.SaveChanges();

            return Ok(menu_Item);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Menu_ItemExists(int id)
        {
            return db.Menu_Item.Count(e => e.Menu_Item_ID == id) > 0;
        }
    }
}