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
    public class TrainersController : Controller
    {
        private SISV2Entities db = new SISV2Entities();


        // GET: Trainers
        public ActionResult Index()
        {
            return View(db.Trainer.ToList());
        }

        // GET: Trainers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trainer trainer = db.Trainer.Find(id);
            if (trainer == null)
            {
                return HttpNotFound();
            }
            return View(trainer);
        }

        // GET: Trainers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Trainers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,IC,FirstName,LastName,DateOfBirth,Gender,Email,PhoneNum,Address,Religion,Nationality,Race,cd,cb,ud,ub,st,Education,WorkExperience, Certificate")] Trainer trainer)
        {
            //var trainerCertificate = db.Trainer.Where(r=>r.Id==trainer.CertificateId);
            //int TrainerCertificateId = 0;
            //foreach (var items in trainerCertificate.ToList())
            //{
            //    TrainerCertificateId = items.CertificatedId;
            //}

            if (ModelState.IsValid)
            {
                trainer.cb = User.Identity.GetUserId();
                trainer.cd = DateTime.Now;
                trainer.st = 1;
                db.Trainer.Add(trainer);
                db.SaveChanges();



                if (trainer.Education != null && trainer.Education.Count() > 0)
                {
                    //foreach (var i in trainer.Education)

                    //{
                    //    i.Id = trainer.Id;
                    //    db.Entry(i).State = EntityState.Modified;
                    //}

                }
                //if (trainer.Certificate != null && trainer.Education.Count() > 0)
                //{
                //    foreach (var i in trainer.Education)
                //    {
                //        if (i.Name != null && i.WorkExperience != null)
                //        {
                //            i.TrainerId = trainer.Id;
                //            db.Entry(i).State = EntityState.Modified;
                //        }
                //    }
                //}
                //if (trainer.WorkExperience != null && trainer.WorkExperience.Count() > 0)
                //{
                //    foreach (var i in trainer.WorkExperience)
                //    {
                //        if (i.WorkExperience != null && i.WorkExperience != null)
                //        {
                //            i.WorkExperience = trainer.Id;
                //            db.Entry(i).State = EntityState.Modified;
                //        }
                //    }
                //}

                return RedirectToAction("Index");
            }


            return View(trainer);
        }
        // GET: Trainers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trainer trainer = db.Trainer.Find(id);
            if (trainer == null)
            {
                return HttpNotFound();
            }
            return View(trainer);
        }

        // POST: Trainers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,IC,FirstName,LastName,DateOfBirth,Gender,Email,PhoneNum,Address,Religion,Nationality,Race,cd,cb,ud,ub,st")] Trainer trainer)
        {
            if (ModelState.IsValid)
            {
                trainer.ub = User.Identity.GetUserId();
                trainer.ud = DateTime.Now;
                db.Entry(trainer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id = new SelectList(db.ReportCard, "Id", "Id", trainer.Id);
            ViewBag.Id = new SelectList(db.Student, "Id", "StudentId", trainer.Id);
            return View(trainer);
        }

        // GET: Trainers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trainer trainer = db.Trainer.Find(id);
            if (trainer == null)
            {
                return HttpNotFound();
            }
            return View(trainer);
        }

        // POST: Trainers/Delete/5
        [HttpPost,ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
       
            {
                Trainer trainer = db.Trainer.Find(id);
                trainer.ub = User.Identity.GetUserId();
                trainer.ud = DateTime.Now;
                trainer.st = 0;
                db.Trainer.Remove(trainer);
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
