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
    public class CoursesIntakeController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: CoursesIntake
        public ActionResult Index()
        {
            return View(db.Course.ToList());
        }

        // GET: CoursesIntake/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Course.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // GET: CoursesIntake/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CoursesIntake/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CourseCode,Name,cd,cb,ud,ub,st,year,month")] Course course)
        {
            if (ModelState.IsValid)
            {
                course.st = 1;
                course.cb = User.Identity.GetUserId();
                course.cd = DateTime.Now;
                db.Course.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }

        // GET: CoursesIntake/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Course.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: CoursesIntake/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CourseCode,Name,cd,cb,ud,ub,st,year,month")] Course course)
        {
            if (ModelState.IsValid)
            {
                course.ub = User.Identity.GetUserId();
                course.ud = DateTime.Now;
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }

        // GET: CoursesIntake/Edit/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Course.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: CoursesIntake/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(Course course)
        {
            if (ModelState.IsValid)
            {
                course.ub = User.Identity.GetUserId();
                course.ud = DateTime.Now;
                course.st = 0;
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
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
