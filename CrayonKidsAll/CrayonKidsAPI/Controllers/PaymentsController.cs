﻿using System;
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
    public class PaymentsController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();

        // GET: api/Payments
        public IQueryable<Payment> GetPayments()
        {
            return db.Payments;
        }

        [System.Web.Http.Route("api/getPayments/{id}")]
        [HttpGet]

        public System.Object getPayments(int id)
        {
            var payments = (from a in db.Payments
                                  where a.Student_ID == id
                                  select new
                                  {
                                      a.Payment_ID,
                                      a.Student_ID,
                                      a.Payment_Date,
                                      a.Proof_Of_Payment,
                                      a.Payment_Status

                                  }).ToList();
            return payments;
        }

        // GET: api/Payments/5
        [ResponseType(typeof(Payment))]
        public IHttpActionResult GetPayment(int id)
        {
            Payment payment = db.Payments.Find(id);
            if (payment == null)
            {
                return NotFound();
            }

            return Ok(payment);
        }

        // PUT: api/Payments/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPayment(int id, Payment payment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != payment.Payment_ID)
            {
                return BadRequest();
            }

            db.Entry(payment).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaymentExists(id))
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

        // POST: api/Payments
        [ResponseType(typeof(Payment))]
        public IHttpActionResult PostPayment(Payment payment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Payments.Add(payment);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = payment.Payment_ID }, payment);
        }

        // DELETE: api/Payments/5
        [ResponseType(typeof(Payment))]
        public IHttpActionResult DeletePayment(int id)
        {
            Payment payment = db.Payments.Find(id);
            if (payment == null)
            {
                return NotFound();
            }

            db.Payments.Remove(payment);
            db.SaveChanges();

            return Ok(payment);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PaymentExists(int id)
        {
            return db.Payments.Count(e => e.Payment_ID == id) > 0;
        }
    }
}