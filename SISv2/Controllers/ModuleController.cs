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
    public class ModuleController : Controller
    {
        private SISV2Entities db = new SISV2Entities();

        // GET: Module
        public ActionResult Index()
        {
            return View(db.Module.ToList());
        }

        // GET: Module/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Module module = db.Module.Find(id);
            if (module == null)
            {
                return HttpNotFound();
            }
            return View(module);
        }

        // GET: Module/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Module/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ModuleCode,Name,cd,cb,ud,ub,st")] Module module)
        {
            if (ModelState.IsValid)
            {
                var checking = db.Module.Any(x => x.ModuleCode == module.ModuleCode);
                if (checking)
                {
                    ModelState.AddModelError("", "This ModuleCode has been used !");
                    return View(module);
                }

                module.cb = User.Identity.GetUserId();
                module.cd = DateTime.Now;
                module.st = 1;
            
                db.Module.Add(module);
                db.SaveChanges();
                return RedirectToAction("Index", "Module");
            }

            return View(module);
        }

        // GET: Module/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Module module = db.Module.Find(id);
            if (module == null)
            {
                return HttpNotFound();
            }
            return View(module);
        }

        // POST: Module/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ModuleCode,Name,cd,cb,ud,ub,st")] Module module)
        {
            if (ModelState.IsValid)
            {
                module.ub = User.Identity.GetUserId();
                module.ud = DateTime.Now;
                module.st = 1;

                db.Entry(module).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(module);
        }

        // GET: Module/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Module module = db.Module.Find(id);
            if (module == null)
            {
                return HttpNotFound();
            }
            return View(module);
        }

        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Module module = db.Module.Find(id);
        //    if (module == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(module);
        //}

        // POST: Module/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete([Bind(Include = "Id,ModuleCode,Name,cd,cb,ud,ub,st")] Module module)
        {
            if (ModelState.IsValid)
            {
                module.ub = User.Identity.GetUserId();
                module.st = 0;

                db.Entry(module).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(module);
        }

        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Module module = db.Module.Find(id);
        //    db.Module.Remove(module);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}
