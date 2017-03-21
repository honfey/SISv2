﻿using System;
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
    public class Package_CourseController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: Package_Course
        //public ActionResult Index()
        //{
        //    var package_Course = db.Package_Course.Include(p => p.Course).Include(p => p.Student);
        //    return View(package_Course.ToList());
        //}

        public ActionResult Index(string SearchString)
        {
            if (!String.IsNullOrEmpty(SearchString))
            {
                var temp = db.Package_Course.OrderBy(i => i.Student.Name).Where(j => j.Student.Name.ToLower().Contains(SearchString.ToLower()));
                return View(temp);
            }
            var package_Course = db.Package_Course.Include(p => p.Course).Include(p => p.Student);
            return View(db.Package_Course);
        }

        // GET: Package_Course/Details/5
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

        // GET: Package_Course/Create
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "CourseCode", "Name");
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name");
            return View();
        }

        // POST: Package_Course/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CourseId,StudentId,TotalPrice,FirstPay,MonthlyInterest,InterestRate,MonthlyPayment,AfterPlnPay,TotalLeft,cd,cb,ud,ub,st")] Package_Course package_Course)
        {
            if (ModelState.IsValid)
            {
                if(package_Course.MonthlyInterest == 0 || package_Course.MonthlyInterest == null)
                {
                    package_Course.InterestRate = 0;
                    package_Course.MonthlyPayment = package_Course.TotalPrice - package_Course.FirstPay;
                    package_Course.TotalLeft = package_Course.TotalPrice - package_Course.FirstPay;
                }
                else if(package_Course.InterestRate == 0 || package_Course.InterestRate == null)
                {
                    package_Course.MonthlyPayment = (package_Course.TotalPrice - package_Course.FirstPay) / package_Course.MonthlyInterest;
                    package_Course.TotalMonthlyP = package_Course.MonthlyPayment * package_Course.MonthlyInterest;
                    package_Course.TotalLeft = package_Course.TotalPrice - package_Course.FirstPay;
                }
                else
                {
                    package_Course.MonthlyPayment = ((package_Course.TotalPrice / 100 * Convert.ToDecimal(package_Course.InterestRate)) - package_Course.FirstPay) / Convert.ToDecimal(package_Course.MonthlyInterest);
                    package_Course.AfterPlnPay = package_Course.TotalPrice * ((100 - Convert.ToDecimal(package_Course.InterestRate)) / 100);
                    package_Course.TotalMonthlyP = package_Course.MonthlyPayment * package_Course.MonthlyInterest;
                    package_Course.TotalLeft = package_Course.TotalPrice - package_Course.FirstPay;
                }
            
                db.Package_Course.Add(package_Course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseId = new SelectList(db.Courses, "CourseCode", "Name", package_Course.CourseId);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", package_Course.StudentId);
            return View(package_Course);
        }

        // GET: Package_Course/Edit/5
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
            ViewBag.CourseId = new SelectList(db.Courses, "CourseCode", "Name", package_Course.CourseId);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", package_Course.StudentId);
            return View(package_Course);
        }

        // POST: Package_Course/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CourseId,StudentId,TotalPrice,FirstPay,MonthlyInterest,InterestRate,MonthlyPayment,AfterPlnPay,TotalMonthlyP,TotalLeft,Amount,cd,cb,ud,ub,st")] Package_Course package_Course)
        {
            if (ModelState.IsValid)
            {
                if(package_Course.MonthlyInterest == 0 || package_Course.MonthlyInterest == null)
                {
                    package_Course.InterestRate = 0;
                    package_Course.MonthlyPayment = package_Course.TotalPrice - package_Course.FirstPay;
                    package_Course.TotalLeft = package_Course.TotalLeft - package_Course.Amount;
                }
                else if(package_Course.InterestRate == 0 || package_Course.InterestRate == null)
                {
                    package_Course.MonthlyPayment = (package_Course.TotalPrice - package_Course.FirstPay) / package_Course.MonthlyInterest;
                    package_Course.TotalMonthlyP = package_Course.MonthlyPayment * package_Course.MonthlyInterest;
                    package_Course.TotalLeft = package_Course.TotalLeft - package_Course.Amount;
                }
                else
                {
                    package_Course.MonthlyPayment = ((package_Course.TotalPrice / 100 * Convert.ToDecimal(package_Course.InterestRate)) - package_Course.FirstPay) / Convert.ToDecimal(package_Course.MonthlyInterest);
                    package_Course.AfterPlnPay = package_Course.TotalPrice * ((100 - Convert.ToDecimal(package_Course.InterestRate)) / 100);
                    package_Course.TotalMonthlyP = package_Course.MonthlyPayment * package_Course.MonthlyInterest;
                    package_Course.TotalLeft = package_Course.TotalLeft - package_Course.Amount;
                }

                db.Entry(package_Course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseCode", "Name", package_Course.CourseId);
            ViewBag.StudentId = new SelectList(db.Students, "Id", "Name", package_Course.StudentId);
            return View(package_Course);
        }

        // GET: Package_Course/Delete/5
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
            return View(package_Course);
        }

        // POST: Package_Course/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Package_Course package_Course = db.Package_Course.Find(id);
            db.Package_Course.Remove(package_Course);
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
