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
    public class InvoiceController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: Invoice
        //public ActionResult Index()
        //{
        //    var invoices = db.Invoices.Include(i => i.Student);
        //    return View(invoices.ToList());
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

        // POST: Invoice/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,StudentId,Ref,Date,Description,Amount,GST,GSTAmt,Total,FinalTotal,Color,cd,cb,ud,ub,st")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                if(invoice.GST == null)
                {
                    invoice.GST = 0;
                }
                if(invoice.Amount != null)
                {
                    invoice.FinalTotal = invoice.Amount;
                    invoice.GSTAmt = invoice.GST;
                    invoice.Total = invoice.FinalTotal - invoice.GSTAmt;
                }

                db.Invoice.Add(invoice);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //{
            //    db.Invoices.Add(invoice);
            //    db.SaveChanges();
            //    return RedirectToAction("Index");
            //}

            ViewBag.StudentId = new SelectList(db.Student, "Id", "", invoice.StudentId);
            return View(invoice);
        }

        public ActionResult Invoice(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoice.Find(id);
            if(invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Invoice([Bind(Include = "Id,StudentId,Ref,Date,Description,Amount,GST,GSTAmt,Total,FinalTotal,Color,cd,cb,ud,ub,st")] Invoice invoice)
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
        public ActionResult Edit([Bind(Include = "Id,StudentId,Ref,Date,Description,Amount,GST,GSTAmt,Total,FinalTotal,Color,cd,cb,ud,ub,st")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                if(invoice.GST == null)
                {
                    invoice.GST = 0;
                }
                if(invoice.Amount != null)
                {
                    invoice.FinalTotal = invoice.Amount;
                    invoice.GSTAmt = invoice.GST;
                    invoice.Total = invoice.FinalTotal - invoice.GSTAmt;
                }
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
            db.Invoice.Remove(invoice);
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
