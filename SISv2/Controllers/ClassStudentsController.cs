using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.AspNet.Identity;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SISv2.Models;

namespace SISv2.Controllers
{
    public class ClassStudentsController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: ClassStudents
        public ActionResult Index(int? id,int? Search)
        {
            if (Search == null)
            {
                var classStudents = db.ClassStudent.Include(c => c.Course_Module).Include(c => c.Student).OrderBy(x => x.Course_ModuleId).Where(x => x.Status == true);
                return View(classStudents.ToList());
            }
            else
            {
                var convert = Convert.ToBoolean(Search);
                var resultName = db.ClassStudent.Include(c => c.Course_Module).Include(c => c.Student).OrderBy(x => x.Course_ModuleId).Where(x => x.Status == convert);
                return View(resultName.ToList());
            }

            
        }

        public ActionResult CreateNewDetail(int? id, DateTime id2)
        {
            var getdata = db.ClassStudent.Where(x => x.Course_ModuleId == id && x.CreateDate == id2);
            return View(getdata);

        }

        public ActionResult deletecreate(int? id)
        {
            var select = db.ClassStudent.Where(x => x.Course_ModuleId == id);

            foreach (var item in select.ToList())
            {
                
                var finding = db.ClassStudent.Single(x => x.Course_ModuleId == item.Course_ModuleId && x.StudentId == item.StudentId);
                finding.Status = false;
                finding.st = 0;
                db.Entry(finding).State = EntityState.Modified;
            }
            //ClassStudent classStudent = db.ClassStudents.Find(id);
            //db.ClassStudents.Remove(classStudent);
            db.SaveChanges();
            return RedirectToAction("Index");
        }





        // GET: ClassStudents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassStudent classStudent = db.ClassStudent.Find(id);
            if (classStudent == null)
            {
                return HttpNotFound();
            }
            return View(classStudent);
        }

        // GET: ClassStudents/Create
        public ActionResult Create()
        {         
            var moduleName = from l in db.Course_Module
                             join c in db.Module on l.ModuleId equals c.Id
                             select new { l.Id, Name = l.CourseId + "  (" + c.ModuleCode + ")" };

            var studentName = from s in db.Student
                              select new { s.Id, Name = s.Name + "(" + s.StudentId + ")" };

            ViewBag.Course_ModuleId = new SelectList(moduleName, "ID", "Name");
            ViewBag.StudentId = new MultiSelectList(studentName, "ID", "Name");



            return View();
        }

        // POST: ClassStudents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ClassStudent classStudent)
        {
            if (ModelState.IsValid)
            {
                classStudent.cb =User.Identity.GetUserId();
                classStudent.cd = DateTime.Now;
                if (classStudent.StudentList != null && classStudent.StudentList.Count() > 0)
                {
                    if (classStudent.Status == null)
                    {
                        classStudent.Status = Convert.ToBoolean(1);
                    }
                    if (classStudent.st == null)
                    {
                        classStudent.st = 1;
                    }
                    List<ClassStudent> cs = new List<ClassStudent>();


                    DateTime todaydate = DateTime.Now.Date;

                    var checking = db.ClassStudent.Any(x => x.Course_ModuleId == classStudent.Course_ModuleId && x.CreateDate == todaydate);
                    if (checking)
                    {
                        var moduleName = from l in db.Course_Module
                                         join c in db.Module on l.ModuleId equals c.Id
                                         select new { l.Id, Name = l.CourseId + "  (" + c.ModuleCode + ")" };

                        ModelState.AddModelError("", "You have already create THIS class today !");
                        ViewBag.Course_ModuleId = new SelectList(moduleName, "ID", "Name");
                        ViewBag.StudentId = new MultiSelectList(db.Student, "ID", "Name");
                        return View(classStudent);
                    }
                    else
                    {


                        foreach (var i in classStudent.StudentList)
                        {

                            cs.Add(new ClassStudent { StudentId = i, Course_ModuleId = classStudent.Course_ModuleId, Day = classStudent.Day, Exam_Day = 1, Trial_Day = 1, Project_Day = 1, CreateDate = DateTime.Now, Status = true,st = 1 });
                        }
                        db.ClassStudent.AddRange(cs);
                    }
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Course_ModuleId = new SelectList(db.Course_Module, "Id", "CourseId", classStudent.Course_ModuleId);
            ViewBag.StudentId = new SelectList(db.Course_Module, "Id", "StudentId", classStudent.StudentId);
            return View(classStudent);
        }


        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassStudent classStudent = db.ClassStudent.Find(id);
            if (classStudent == null)
            {
                return HttpNotFound();
            }
            ViewBag.Course_ModuleId = new SelectList(db.Course_Module, "Id", "CourseId", classStudent.Course_ModuleId);
            ViewBag.StudentId = new SelectList(db.Student, "Id", "StudentId", classStudent.StudentId);
            return View(classStudent);
        }

        // POST: ClassStudents1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Course_ModuleId,StudentId,Day,Exam_Day,Trial_Day,Project_Day,Status,CreateDate,cd,cb,ud,ub,st")] ClassStudent classStudent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(classStudent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Course_ModuleId = new SelectList(db.Course_Module, "Id", "CourseId", classStudent.Course_ModuleId);
            ViewBag.StudentId = new SelectList(db.Student, "Id", "StudentId", classStudent.StudentId);
            return View(classStudent);
        }
        //// GET: ClassStudents/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    ClassStudent classStudent = db.ClassStudent.Find(id);
        //    if (classStudent == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.Course_ModuleId = new SelectList(db.Course_Module, "Id", "CourseId", classStudent.Course_ModuleId);
        //    ViewBag.StudentId = new SelectList(db.Student, "ID", "Name", classStudent.StudentId);
        //    return View(classStudent);
        //}

        //// POST: ClassStudents/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "ClassStudentId,Course_ModuleId,StudentId")] ClassStudent classStudent)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        classStudent.st =1;
        //        classStudent.ub =User.Identity.GetUserId();
        //        classStudent.ud =DateTime.Now;
        //        db.Entry(classStudent).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.Course_ModuleId = new SelectList(db.Course_Module, "Id", "CourseId", classStudent.Course_ModuleId);
        //    ViewBag.StudentId = new SelectList(db.Student, "ID", "Name", classStudent.StudentId);
        //    return View(classStudent);
        //}

        // GET: ClassStudents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassStudent classStudent = db.ClassStudent.Find(id);
            if (classStudent == null)
            {
                return HttpNotFound();
            }
            ViewBag.Course_ModuleId = new SelectList(db.Course_Module, "Id", "CourseId", classStudent.Course_ModuleId);
            ViewBag.StudentId = new SelectList(db.Student, "ID", "Name", classStudent.StudentId);
            return View(classStudent);
        }
        // POST: ClassStudents/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete([Bind(Include = "ClassStudentId,Course_ModuleId,StudentId")] ClassStudent classStudent)
        {
            if (ModelState.IsValid)
            {
                classStudent.ub =User.Identity.GetUserId();
                classStudent.st = 0;
                db.Entry(classStudent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Course_ModuleId = new SelectList(db.Course_Module, "Id", "CourseId", classStudent.Course_ModuleId);
            ViewBag.StudentId = new SelectList(db.Student, "ID", "Name", classStudent.StudentId);
            return View(classStudent);
        }

        public ActionResult Pass(int id)
        {
            return RedirectToRoute(new { Controller = "ModuleStandards", Action = "Add", id = id });
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
}
