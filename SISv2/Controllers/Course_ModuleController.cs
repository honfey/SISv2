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
    public class Course_ModuleController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: Course_Module
        public ActionResult Index()
        {
            var trainerName = from t in db.Trainer
                              select new { t.Id, name = t.FirstName + " " + t.LastName };
            ViewBag.TrainerId = new SelectList(trainerName, "Id", "Name");
            var course_Module = db.Course_Module.Include(c => c.Course).Include(c => c.Module).Include(c => c.Trainer);
            return View(course_Module.ToList());
        }

        // GET: Course_Module/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course_Module course_Module = db.Course_Module.Find(id);
            if (course_Module == null)
            {
                return HttpNotFound();
            }
            return View(course_Module);
        }

        // GET: Course_Module/Create
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Course, "CourseCode", "Name");
            ViewBag.ModuleId = new SelectList(db.Module, "Id", "Name");

            var trainerName = from t in db.Trainer
                              select new { t.Id, name = t.FirstName + " " + t.LastName };
            ViewBag.TrainerId = new SelectList(trainerName, "Id", "Name");
            return View();
        }

        // POST: Course_Module/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CourseId,ModuleId,TrainerId,Status")] Course_Module course_Module)
        {
            if (ModelState.IsValid)
            {
                course_Module.cb =User.Identity.GetUserId();
                course_Module.cd = DateTime.Now;
                course_Module.st =1;

                db.Course_Module.Add(course_Module);
                db.SaveChanges();
                return RedirectToAction("Index");

            }

            ViewBag.CourseId = new SelectList(db.Course, "CourseCode", "Name", course_Module.CourseId);
            ViewBag.ModuleId = new SelectList(db.Module, "Id", "Name", course_Module.ModuleId);
            var trainerName = from t in db.Trainer
                              select new { t.Id, name = t.FirstName + " " + t.LastName };
            ViewBag.TrainerId = new SelectList(trainerName, "Id", "Name", course_Module.TrainerId);
            //ViewBag.TrainerId = new SelectList(db.Trainer, "Id", "Name", course_Module.TrainerId);
            return View(course_Module);
        }

        // GET: Course_Module/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course_Module course_Module = db.Course_Module.Find(id);
            if (course_Module == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Course, "CourseCode", "Name", course_Module.CourseId);
            ViewBag.ModuleId = new SelectList(db.Module, "Id", "Name", course_Module.ModuleId);

            //ViewBag.TrainerId = new SelectList(db.Trainers, "Id", "Name", course_Module.TrainerId);
            var trainerName = from t in db.Trainer
                              select new { t.Id, name = t.FirstName + " " + t.LastName };
            ViewBag.TrainerId = new SelectList(trainerName, "Id", "Name");
            return View(course_Module);
        }

        // POST: Course_Module/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CourseId,ModuleId,TrainerId,Status")] Course_Module course_Module)
        {
            if (ModelState.IsValid)
            {
                course_Module.ub = User.Identity.GetUserId();
                course_Module.ud = DateTime.Now;
                course_Module.st = 1;
                db.Entry(course_Module).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Course, "CourseCode", "Name", course_Module.CourseId);
            ViewBag.ModuleId = new SelectList(db.Module, "Id", "Name", course_Module.ModuleId);
            //ViewBag.TrainerId = new SelectList(db.Trainers, "Id", "Name", course_Module.TrainerId);
            var trainerName = from t in db.Trainer
                              select new { t.Id, name = t.FirstName + " " + t.LastName };
            ViewBag.TrainerId = new SelectList(trainerName, "Id", "Name", course_Module.TrainerId);
            //ViewBag.TrainerId = new SelectList(db.Trainer, "Id", "Name", course_Module.TrainerId);

            return View(course_Module);
        }

        // GET: Course_Module/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course_Module course_Module = db.Course_Module.Find(id);
            if (course_Module == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Course, "CourseCode", "Name", course_Module.CourseId);
            ViewBag.ModuleId = new SelectList(db.Module, "Id", "Name", course_Module.ModuleId);

            //ViewBag.TrainerId = new SelectList(db.Trainers, "Id", "Name", course_Module.TrainerId);
            var trainerName = from t in db.Trainer
                              select new { t.Id, name = t.FirstName + " " + t.LastName };
            ViewBag.TrainerId = new SelectList(trainerName, "Id", "Name");
            return View(course_Module);
        }

        // POST: Course_Module/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete([Bind(Include = "Id,CourseId,ModuleId,TrainerId,Status")] Course_Module course_Module)
        {
            if (ModelState.IsValid)
            {
                course_Module.ub = User.Identity.GetUserId();
                
                course_Module.st = 0;
                db.Entry(course_Module).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
         
            return View(course_Module);
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
