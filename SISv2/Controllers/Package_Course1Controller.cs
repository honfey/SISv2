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
    public class Package_Course1Controller : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: Package_Course1
        public ActionResult Index()
        {
            var package_Course = db.Package_Course.Include(p => p.Course).Include(p => p.Student);
            return View(package_Course.ToList());
        }

        // GET: Package_Course1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Package_Course package_Course = db.Package_Course.Find(id);
            if (package_Course == null)
            {
                return HttpNotFound();
            }
            return View(package_Course);
        }

        // GET: Package_Course1/Create
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Course, "Id", "CourseCode");
            ViewBag.StudentId = new SelectList(db.Student, "Id", "Name");
            return View();
        }

        // POST: Package_Course1/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CourseId,StudentId,TotalPrice,FirstPay,MonthlyInterest,TotalMonthlyP,AfterPlnPay,InterestRate,MonthlyPayment,TotalLeft,cd,cb,ud,ub,st")] Package_Course package_Course)
        {
            if (ModelState.IsValid)
            {
                package_Course.st = 1;
                package_Course.cb = User.Identity.GetUserId();
                package_Course.cd = DateTime.Now;
                db.Package_Course.Add(package_Course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseId = new SelectList(db.Course, "Id", "CourseCode", package_Course.CourseId);
            ViewBag.StudentId = new SelectList(db.Student, "Id", "Name", package_Course.StudentId);
            return View(package_Course);
        }

        // GET: Package_Course1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Package_Course package_Course = db.Package_Course.Find(id);
            if (package_Course == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Course, "Id", "CourseCode", package_Course.CourseId);
            ViewBag.StudentId = new SelectList(db.Student, "Id", "StudentId", package_Course.StudentId);
            return View(package_Course);
        }

        // POST: Package_Course1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CourseId,StudentId,TotalPrice,FirstPay,MonthlyInterest,TotalMonthlyP,AfterPlnPay,InterestRate,MonthlyPayment,TotalLeft,cd,cb,ud,ub,st")] Package_Course package_Course)
        {
            if (ModelState.IsValid)
            {
                package_Course.ub = User.Identity.GetUserId();
                package_Course.ud = DateTime.Now;
                db.Entry(package_Course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Course, "Id", "CourseCode", package_Course.CourseId);
            ViewBag.StudentId = new SelectList(db.Student, "Id", "StudentId", package_Course.StudentId);
            return View(package_Course);
        }

        // GET: Package_Course1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Package_Course package_Course = db.Package_Course.Find(id);
            if (package_Course == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Course, "Id", "CourseCode", package_Course.CourseId);
            ViewBag.StudentId = new SelectList(db.Student, "Id", "StudentId", package_Course.StudentId);
            return View(package_Course);
        }

        // POST: Package_Course1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete([Bind(Include = "Id,CourseId,StudentId,TotalPrice,FirstPay,MonthlyInterest,TotalMonthlyP,AfterPlnPay,InterestRate,MonthlyPayment,TotalLeft,cd,cb,ud,ub,st")] Package_Course package_Course)
        {
            if (ModelState.IsValid)
            {
                package_Course.ub = User.Identity.GetUserId();
                package_Course.ud = DateTime.Now;
                package_Course.st = 0;
                db.Entry(package_Course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Course, "Id", "CourseCode", package_Course.CourseId);
            ViewBag.StudentId = new SelectList(db.Student, "Id", "StudentId", package_Course.StudentId);
            return View(package_Course);
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
