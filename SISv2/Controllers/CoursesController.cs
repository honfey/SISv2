using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.AspNet.Identity;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity.Validation;
using SISv2.Models;

namespace SISv2.Controllers
{
    public class CoursesController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: Courses
        public ActionResult Index()
        {
            return View(db.Course.ToList());
        }

        // GET: Courses/Details/5
        public ActionResult Details(string id)
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

        // GET: Courses/Create
        public ActionResult Create()
        {


            return View();
        }

        // POST: Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseCode,PackageId,Name,Fee")] Course course)
        {


            if (ModelState.IsValid)
            {
                course.cb = User.Identity.GetUserId();
                course.cd = DateTime.Now;
                course.st = 1;
                var checking = db.Course.Any(x => x.CourseCode == course.CourseCode);
                if (checking)
                {
                    ModelState.AddModelError("", "THIS CourseCode has been used !");
                    return View(course);
                }
                if (course.Intake != null && course.Intake.Count() > 0)
                {

                    foreach (var i in course.Intake)
                    {
                        i.CourseCode = course.CourseCode;
                        db.Entry(i).State = EntityState.Modified;
                    }

                }

                try
                {
                    db.Course.Add(course);
                    db.SaveChanges();
                }
                catch (DbEntityValidationException ex)
                {
                    foreach (var entityValidationErrors in ex.EntityValidationErrors)
                    {
                        foreach (var validationError in entityValidationErrors.ValidationErrors)
                        {
                            Response.Write("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                        }
                    }
                }

                return RedirectToAction("Index");

            }

            return View(course);
        
    }

        // GET: Courses/Edit/5
        public ActionResult Edit(string id)
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

        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseCode,PackageId,Name,Fee")]Course course)
        {
            if (ModelState.IsValid)
            {
                course.ub =User.Identity.GetUserId();
                course.ud = DateTime.Now;
                course.st = 1;
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }

        // GET: Courses/Delete/5
        public ActionResult Delete(string id)
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

        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete([Bind(Include = "CourseCode,PackageId,Name,Fee")]Course course)
        {
            if (ModelState.IsValid)
            {
                course.ub = User.Identity.GetUserId();
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
