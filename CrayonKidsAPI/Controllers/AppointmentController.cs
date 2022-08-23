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

    public class AppointmentController : ApiController
    {
        private CrayonKidsEntities db = new CrayonKidsEntities();


        public IQueryable<Appointment_Booking> GetAppointments()
        {
            return db.Appointment_Booking;
        }

        // GET: api/Employees/5
        [ResponseType(typeof(Appointment_Booking))]
        public IHttpActionResult GetAppointment(int id)
        {
            Appointment_Booking appointment = db.Appointment_Booking.Find(id);
            if (appointment == null)
            {
                return NotFound();
            }

            return Ok(appointment);
        }


        // PUT: api/Employees/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAppointment(int id, Appointment_Booking appointment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != appointment.Appointment_Booking_ID) 
            {
                return BadRequest();
            }

            db.Entry(appointment).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AppointmentExists(id))
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


        // POST: api/Employees
        [ResponseType(typeof(Appointment_Booking))]
        public IHttpActionResult PostAppointment(Appointment_Booking appointment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Appointment_Booking.Add(appointment);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (AppointmentExists(appointment.Appointment_Booking_ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = appointment.Appointment_Booking_ID }, appointment);
        }

        // DELETE: api/Employees/5
        [ResponseType(typeof(Appointment_Booking))]
        public IHttpActionResult DeleteAppointment(int id)
        {
            Appointment_Booking appointment = db.Appointment_Booking.Find(id);
            if (appointment == null)
            {
                return NotFound();
            }

            db.Appointment_Booking.Remove(appointment);
            db.SaveChanges();

            return Ok(appointment);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AppointmentExists(int id)
        {
            return db.Appointment_Booking.Count(e => e.Appointment_Booking_ID == id) > 0;
        }
    }
}

