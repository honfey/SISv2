using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SISv2.Models;

namespace SISV2.Controllers
{
    public class MarkTypeController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: MarkType
        public ActionResult Index()
        {
            return View(db.MarkType.ToList());
        }

        // GET: MarkType/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MarkType markType = db.MarkType.Find(id);
            if (markType == null)
            {
                return HttpNotFound();
            }
            return View(markType);
        }

        // GET: MarkType/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MarkType/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,cd,cb,ud,ub,st")] MarkType markType)
        {
            if (ModelState.IsValid)
            {
                db.MarkType.Add(markType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(markType);
        }

        // GET: MarkType/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MarkType markType = db.MarkType.Find(id);
            if (markType == null)
            {
                return HttpNotFound();
            }
            return View(markType);
        }

        // POST: MarkType/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,cd,cb,ud,ub,st")] MarkType markType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(markType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(markType);
        }

        // GET: MarkType/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MarkType markType = db.MarkType.Find(id);
            if (markType == null)
            {
                return HttpNotFound();
            }
            return View(markType);
        }

        // POST: MarkType/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MarkType markType = db.MarkType.Find(id);
            db.MarkType.Remove(markType);
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
