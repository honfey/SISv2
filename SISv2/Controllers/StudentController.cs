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

        // GET: Student
        public ActionResult Index(string Month, string Year, string SearchName)
        {
            if (!string.IsNullOrWhiteSpace(SearchName) && !string.IsNullOrWhiteSpace(Month) && !string.IsNullOrWhiteSpace(Year))
            {
                ViewBag.Year = new SelectList(db.Year, "Id", "Year1");
                ViewBag.Month = new SelectList(db.Month, "Id", "Month1");
                var StudentName = db.Student.Where(x => x.Name.ToString().ToLower().Contains(SearchName) && x.Intake.Year.Year1.ToString().Contains(Year) && x.Intake.Month.Month1.ToString().Contains(Month));
                return View(StudentName);
            }
            else if (!string.IsNullOrWhiteSpace(Month) && !string.IsNullOrWhiteSpace(Year))
            {
                ViewBag.Year = new SelectList(db.Year, "Id", "Year1");
                ViewBag.Month = new SelectList(db.Month, "Id", "Month1");
                var StudentName = db.Student.Where(x => x.Intake.Year.Year1.ToString().Contains(Year) && x.Intake.Month.Month1.ToString().Contains(Month));
                return View(StudentName);
            }
            else if (!string.IsNullOrWhiteSpace(Month) && !string.IsNullOrWhiteSpace(SearchName))
            {
                ViewBag.Year = new SelectList(db.Year, "Id", "Year1");
                ViewBag.Month = new SelectList(db.Month, "Id", "Month1");
                var StudentName = db.Student.Where(x => x.Name.ToString().ToLower().Contains(SearchName) && x.Intake.Month.Month1.ToString().Contains(Month));
                return View(StudentName);
            }
            else if (!string.IsNullOrWhiteSpace(Year) && !string.IsNullOrWhiteSpace(SearchName))
            {
                ViewBag.Year = new SelectList(db.Year, "Id", "Year1");
                ViewBag.Month = new SelectList(db.Month, "Id", "Month1");
                var StudentName = db.Student.Where(x => x.Name.ToString().ToLower().Contains(SearchName) && x.Intake.Year.Year1.ToString().Contains(Year));
                return View(StudentName);
            }
            else if (!string.IsNullOrWhiteSpace(Month))
            {
                ViewBag.Year = new SelectList(db.Year, "Id", "Year1");
                ViewBag.Month = new SelectList(db.Month, "Id", "Month1");
                var StudentName = db.Student.Where(x => x.Intake.Month.Month1.ToString().Contains(Month));
                return View(StudentName);
            }
            else if (!string.IsNullOrWhiteSpace(Year))
            {
                ViewBag.Year = new SelectList(db.Year, "Id", "Year1");
                ViewBag.Month = new SelectList(db.Month, "Id", "Month1");
                var StudentName = db.Student.Where(x => x.Intake.Year.Year1.ToString().Contains(Year));
                return View(StudentName);
            }
            else if (!string.IsNullOrWhiteSpace(SearchName))
            {
                ViewBag.Year = new SelectList(db.Year, "Id", "Year1");
                ViewBag.Month = new SelectList(db.Month, "Id", "Month1");
                var StduentName = db.Student.Where(x => x.Name.ToString().ToLower().Contains(SearchName));
                return View(StduentName);
            }
            else
            {
                ViewBag.Year = new SelectList(db.Year, "Id", "Year1");
                ViewBag.Month = new SelectList(db.Month, "Id", "Month1");
                var students = db.Student.Include(s => s.Intake).Include(s => s.SPMResult);
                return View(students.ToList());
            }





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

            var course_intakeName = from c in db.Intake
                                    join i in db.Course on c.CourseCode equals i.CourseCode
                                    select new { c.Id, Name = i.CourseCode + "(" + c.Year.Year1 + "/" + c.Month.Month1 + ")" };

            ViewBag.NationalityId = new SelectList(db.Nationality, "Id", "Name");
            ViewBag.IntakeId = new SelectList(course_intakeName, "Id", "Name");
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
            var studentIntakeMonth = db.Intake.Where(r => r.Id == student.IntakeId);

            int IntakeyearId = 0;
            int IntakemonthId = 0;
            foreach (var items in studentIntakeMonth.ToList())
            {
                IntakeyearId = items.YearId;
                IntakemonthId = items.MonthId;
            }

            var studentIntakeMonth2 = db.Month.Where(s => s.Id == IntakemonthId);
            var studentIntakeYear = db.Year.Where(t => t.Id == IntakeyearId);

            string Month = "";
            string Year = "";
            foreach (var items1 in studentIntakeMonth2.ToList())
            {
                Month = items1.Month1;
            }

            foreach (var items2 in studentIntakeYear.ToList())
            {
                Year = items2.Year1;
            }

            int ConvertYear = Convert.ToInt32(Year) - 2000;




            if (ModelState.IsValid)
            {

                db.Student.Add(student);
                db.SaveChanges();
                student.StudentId = "P" + ConvertYear + Month + student.Id.ToString("D4");
                db.SaveChanges();


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
                    db.Student.Add(student);
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
            ViewBag.IntakeId = new SelectList(db.Intake, "Id", "CourseCode", student.IntakeId);
            //ViewBag.SPMResultId = new SelectList(db.SPMResults, "Id", "Id", student.SPMResultId);
            ViewBag.SPMResultList = new SelectList(resultList, "Value", "Text");
            return View(student);
        }

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

            var course_intakeName = from c in db.Intake
                                    join i in db.Course on c.CourseCode equals i.CourseCode
                                    select new { c.Id, Name = i.CourseCode + "(" + c.Year.Year1 + "/" + c.Month.Month1 + ")" };

            ViewBag.NationalityId = new SelectList(db.Nationality, "Id", "Name", student.NationalityId);
            ViewBag.IntakeId = new SelectList(course_intakeName, "Id", "Name", student.IntakeId);

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

            var course_intakeName = from c in db.Intake
                                    join i in db.Course on c.CourseCode equals i.CourseCode
                                    select new { c.Id, Name = i.CourseCode + "(" + c.Year.Year1 + "/" + c.Month.Month1 + ")" };

            ViewBag.NationalityId = new SelectList(db.Nationality, "Id", "Name", student.NationalityId);
            ViewBag.IntakeId = new SelectList(course_intakeName, "Id", "Name", student.IntakeId);
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
