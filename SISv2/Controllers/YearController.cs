using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SISv2.Models;

namespace SISv2.Controllers
{
    public class YearController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: Year
        public ActionResult Index()
        {
            return View(db.Year.ToList());
        }

        // GET: Year/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Year year = db.Year.Find(id);
            if (year == null)
            {
                return HttpNotFound();
            }
            return View(year);
        }

        // GET: Year/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Year/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Year1,cd,cb,ud,ub,st")] Year year)
        {
            if (ModelState.IsValid)
            {
                db.Year.Add(year);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var types = new List<SelectListItem>();
            types.Add(new SelectListItem() { Text = "Select...", Value = string.Empty });
            types.Add(new SelectListItem() { Text = "OTC", Value = "0" });
            types.Add(new SelectListItem() { Text = "Generic", Value = "1" });
            types.Add(new SelectListItem() { Text = "Brand", Value = "2" });
            types.Add(new SelectListItem() { Text = "Non-Merchandise", Value = "9" });

            ViewBag.Year1 = types;

            return View(year);
        }

        // GET: Year/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Year year = db.Year.Find(id);
            if (year == null)
            {
                return HttpNotFound();
            }
            return View(year);
        }

        // POST: Year/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Year1,cd,cb,ud,ub,st")] Year year)
        {
            if (ModelState.IsValid)
            {
                db.Entry(year).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(year);
        }

        // GET: Year/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Year year = db.Year.Find(id);
            if (year == null)
            {
                return HttpNotFound();
            }
            return View(year);
        }

        // POST: Year/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Year year = db.Year.Find(id);
            db.Year.Remove(year);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
