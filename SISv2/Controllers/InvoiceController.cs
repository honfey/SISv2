using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SISv2.Models;
using Microsoft.AspNet.Identity;

namespace SISv2.Controllers
{
    public class InvoiceController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: Invoice
        //public ActionResult Index()
        //{
        //    var invoice = db.Invoice.Include(i => i.Student);
        //    return View(invoice.ToList());
        //}

        public ActionResult Index(string SearchString)
        {
            if (!String.IsNullOrEmpty(SearchString))
            {
                var temp = db.Invoice.OrderBy(i => i.Student.Name).Where(j => j.Student.Name.ToLower().Contains(SearchString.ToLower()));
                return View(temp);
            }
            var invoice = db.Invoice.Include(p => p.Student).Include(p => p.Student);
            return View(db.Invoice);
        }

        // GET: Invoice/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoice.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        // GET: Invoice/Create
        public ActionResult Create()
        {
            ViewBag.StudentId = new SelectList(db.Student, "Id", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                invoice.cb = User.Identity.GetUserId();
                invoice.cd = DateTime.Now;
                invoice.st = 1;

                db.Invoice.Add(invoice);

                //if (invoice.Amount != null && invoice.Amount.Count() > 0)
                //{
                //    List<Amount> uh = new List<Amount>();

                //    foreach (var i in invoice.Amount)
                //        uh.Add(new Amount
                //        {
                //            InvoiceId = invoice.Id,
                //            Description = i.Description,
                //            Amt = i.Amt,
                //            GST = i.GST,
                //            GSTAmt = i.GSTAmt,
                //            Total = i.Total,
                //            FinalTotal = i.FinalTotal
                //        });

                //    db.Amount.AddRange(uh);
                //}

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StudentId = new SelectList(db.Student, "Id", "Name", invoice.StudentId);
            return View(invoice);
        }

        // POST: Invoice/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create2(Invoice invoice)
        //{
        //    //if (invoice.Amount != null && invoice.Amount.Count() > 0)
        //    //{

        //    //    foreach (var i in invoice.Amount)
        //    //    {
        //    //        if (i.Description != null && i.Amt != null)
        //    //        {
        //    //            i.InvoiceId = invoice.Id;
        //    //            db.Entry(i).State = EntityState.Modified;
        //    //        }
        //    //    }

        //    //}
        //    if (invoice.Amount != null && invoice.Amount.Count() > 0)
        //    {
        //        foreach (var i in invoice.Amount)
        //        {
        //            i.InvoiceId = invoice.Id;
        //            db.Entry(i).State = EntityState.Modified;
        //        }
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        db.Invoice.Add(invoice);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.StudentId = new SelectList(db.Student, "Id", "Name", invoice.StudentId);
        //    return View(invoice);
        //}

        public ActionResult Invoice(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoice.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Invoice(Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                db.Entry(invoice).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(invoice);
        }

        // GET: Invoice/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoice.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            ViewBag.StudentId = new SelectList(db.Student, "Id", "Name", invoice.StudentId);
            return View(invoice);
        }

        // POST: Invoice/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,StudentId,Ref,Date,Color,cd,cb,ud,ub,st")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                if(invoice.Amount != null && invoice.Amount.Count() > 0)
                {
                    foreach(var i in invoice.Amount)
                    {
                        i.InvoiceId = invoice.Id;

                        if(i.Id == 0)
                        {
                            db.Entry(i).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(i).State = EntityState.Modified;
                        }
                    }
                }
                invoice.ub = User.Identity.GetUserId();
                invoice.ud = DateTime.Now;
                invoice.st = 1;

                db.Entry(invoice).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StudentId = new SelectList(db.Student, "Id", "Name", invoice.StudentId);
            return View(invoice);
        }

        // GET: Invoice/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoice.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        // POST: Invoice/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Invoice invoice = db.Invoice.Find(id);

            var oldAmount = db.Amount.Where(x => x.InvoiceId == invoice.Id);
            if (oldAmount != null && oldAmount.Count() > 0)
                db.Amount.RemoveRange(oldAmount);

            invoice.ub = User.Identity.GetUserId();
            invoice.st = 0;

            db.Invoice.Remove(invoice);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        public ActionResult DeleteAmount(int id)
        {
            int rs = 0;
            Amount i = db.Amount.Find(id);
            db.Amount.Remove(i);
            rs = db.SaveChanges();
            return Json(new { deleteRow = rs }, JsonRequestBehavior.AllowGet);
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
