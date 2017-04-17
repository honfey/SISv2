using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SISv2.Models;
using System.Data.Entity.Validation;
using System.IO;
using System.Web.Configuration;
using Microsoft.AspNet.Identity;

namespace SISv2.Controllers
{
    public class StudentController : Controller
    {
        private SISV2Entities db = new SISV2Entities();
        List<SelectListItem> resultList = new List<SelectListItem>()
             {
                //new SelectListItem{ Text="---Select Grade---", Value = "" },
                new SelectListItem{ Text="A+", Value = "A+" },
                new SelectListItem{ Text="A", Value = "A" },
                new SelectListItem{ Text="A-", Value = "A-" },
                new SelectListItem{ Text="B+", Value = "B+" },
                new SelectListItem{ Text="B", Value = "B" },
                new SelectListItem{ Text="C+", Value = "C+" },
                new SelectListItem{ Text="C", Value = "C" },
                new SelectListItem{ Text="D", Value = "D" },
                new SelectListItem{ Text="E", Value = "E" },
                new SelectListItem{ Text="G", Value = "G" },
                new SelectListItem{ Text="TH", Value = "TH" }
    };

        List<SelectListItem> siblingGender = new List<SelectListItem>()
             {
                new SelectListItem{ Text="Male", Value = "Male" },
                new SelectListItem{ Text="Female", Value = "Female" },
    };
        private string webConfigPath = "~/" + WebConfigurationManager.AppSettings["FileName"];

        // GET: Student
        public ActionResult Index()
        {
            var student = db.Student.Include(s => s.Nationality);
            return View(student.ToList());
        }



        public ActionResult FileUpload ()
        {
            
            return RedirectToAction("actionname", "controller name");
        }


        // GET: Student/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Student.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // GET: Student/Create
        public ActionResult Create()
        {
            //viewbag.state = new selectlist(db.)
            
            ViewBag.NationalityId = new SelectList(db.Nationality, "Id", "Name");
            //ViewBag.SPMResultId = new SelectList(db.SPMResults, "Id", "Id");
            ViewBag.SPMResultList = new SelectList(resultList, "Value", "Text");

            return View();
        }
        

        // POST: Student/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Student student)
        {

            if (ModelState.IsValid)
            {
                student.cd = DateTime.Now;
                student.cb = User.Identity.GetUserId();
                db.Student.Add(student);
                db.SaveChanges();

                //HttpPostedFileBase obj = Request.Files["FileName"];
                //if (obj.ContentLength != 0 && obj.FileName != "")
                //{
                //    string fDate = string.Format("  {0:yyyyMddhhmmsstt}", DateTime.Now);
                //    string documentName = obj.FileName.Trim().Replace(" ", "_");
                //    string pathToSave = Server.MapPath(webConfigPath);
                //    string filename = fDate + "_" + documentName;
                //    obj.SaveAs(Path.Combine(pathToSave, filename));
                //    student.StudentPicture = filename;
                //}

                if (student.Parent != null && student.Parent.Count() > 0)
                {

                    foreach (var i in student.Parent)
                    {
                        i.StudentId = student.Id;
                        db.Entry(i).State = EntityState.Modified;
                    }

                }

                if (student.Guardian != null && student.Guardian.Count() > 0)
                {
                    foreach (var i in student.Guardian)
                    {
                        i.StudentId = student.Id;
                        db.Entry(i).State = EntityState.Modified;
                    }
                }

                if (student.Address != null && student.Address.Count() > 0)
                {
                    foreach (var i in student.Address)
                    {
                        i.StudentId = student.Id;
                        db.Entry(i).State = EntityState.Modified;
                    }
                }

                if (student.SPMResult != null && student.SPMResult.Count() > 0)
                {
                    foreach (var i in student.SPMResult)
                    {
                        if (i.SubjectName != null && i.Grade != null)
                        {
                            i.StudentId = student.Id;
                            db.Entry(i).State = EntityState.Modified;
                        }
                    }
                }

                if (student.Sibling != null && student.Sibling.Count() > 0)
                {

                    foreach (var i in student.Sibling)
                    {
                        i.StudentId = student.Id;
                        db.Entry(i).State = EntityState.Modified;
                    }

                }

                try
                {
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

            ViewBag.NationalityId = new SelectList(db.Nationality, "Id", "Name", student.NationalityId);
            //ViewBag.SPMResultId = new SelectList(db.SPMResults, "Id", "Id", student.SPMResultId);
            ViewBag.SPMResultList = new SelectList(resultList, "Value", "Text");
            return View(student);
        }

        //public ActionResult DownloadImage(string StudentPicture)
        //{
        //    return File(webConfigPath + StudentPicture, GetContentType(StudentPicture), Server.UrlEncode(StudentPicture));
        //}
        //private string GetContentType(string StudentPicture)
        //{
        //    string contentType = "application/octestream";
        //    string ext = Path.GetExtension(StudentPicture).ToLower();
        //    Microsoft.Win32.RegistryKey registryKey = Microsoft.Win32.Registry.ClassesRoot.OpenSubKey(ext);

        //    if (registryKey != null && registryKey.GetValue("Content Type") != null)
        //        contentType = registryKey.GetValue("Content Type").ToString();

        //    return contentType;
        //}
        // GET: Student/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Student.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }

            ViewBag.NationalityId = new SelectList(db.Nationality, "Id", "Name", student.NationalityId);

            ViewBag.SiblingGender = new SelectList(siblingGender, "Value", "Text");
            ViewBag.SPMResultList = new SelectList(resultList, "Value", "Text");
            return View(student);
        }

        // POST: Student/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Student student)
        {
            var errors = ModelState.Values.SelectMany(v => v.Errors);

            if (ModelState.IsValid)
            {
                if (student.Sibling != null && student.Sibling.Count() > 0)
                {

                    foreach (var i in student.Sibling)
                    {
                        i.StudentId = student.Id;

                        if (i.Id == 0)
                        {

                            db.Entry(i).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(i).State = EntityState.Modified;
                        }
                    }

                    //db.Siblings.AddRange(student.Siblings);
                }


                if (student.Address != null && student.Address.Count() > 0)
                {

                    foreach (var i in student.Address)
                    {
                        i.StudentId = student.Id;

                        if (i.Id == 0)
                        {
                            db.Entry(i).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(i).State = EntityState.Modified;
                        }
                    }

                    //db.Addresses.AddRange(student.Addresses);
                }

                if (student.SPMResult != null && student.SPMResult.Count() > 0)
                {

                    foreach (var i in student.SPMResult)
                    {
                        i.StudentId = student.Id;

                        if (i.Id == 0)
                        {
                            db.Entry(i).State = EntityState.Added;
                        }
                        else
                        {
                            db.Entry(i).State = EntityState.Modified;
                        }
                    }

                    //db.SPMResults.AddRange(student.SPMResults);
                }

                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            ViewBag.NationalityId = new SelectList(db.Nationality, "Id", "Name", student.NationalityId);
            //ViewBag.SPMResultId = new SelectList(db.SPMResults, "Id", "Id", student.SPMResultId);

            ViewBag.SiblingGender = new SelectList(siblingGender, "Value", "Text");
            ViewBag.SPMResultList = new SelectList(resultList, "Value", "Text");

            return View(student);
        }

        // GET: Student/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Student.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete([Bind(Include = "Id,SubjectName,Grade,cd,cb,ud,ub,st")] Student student)
        {
            if (ModelState.IsValid)
            {
                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(student);
        }

        public ActionResult DeleteAddress(int id)
        {
            int rs = 0;
            Address i = db.Address.Find(id);
            db.Address.Remove(i);
            rs = db.SaveChanges();
            return Json(new { deletedRow = rs }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteSubject(int id)
        {
            int rs = 0;
            SPMResult i = db.SPMResult.Find(id);
            db.SPMResult.Remove(i);
            rs = db.SaveChanges();
            return Json(new { deletedRow = rs }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteSibling(int id)
        {
            int rs = 0;
            Sibling i = db.Sibling.Find(id);
            db.Sibling.Remove(i);
            rs = db.SaveChanges();
            return Json(new { deletedRow = rs }, JsonRequestBehavior.AllowGet);
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
