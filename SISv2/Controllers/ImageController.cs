using SISv2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Hosting;
using System.Web.Mvc;


namespace SISV2.Controllers
{
    public class ImageController : Controller
    {
        private string webConfigPath = "~/" + WebConfigurationManager.AppSettings["UploadImage"];
        private SISV2Entities db = new SISV2Entities();

        // GET: Image
        public ActionResult Index()
        {
            return View(db.Image.ToList());
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(List<HttpPostedFileBase> images)
        {
            if(ModelState.IsValid && images != null)
            {
                List<Image> imgs = new List<Image>();
                foreach (var obj in images)
                {
                    if (obj != null && obj.ContentLength != 0 && obj.FileName != "")
                    {
                        string fDate = string.Format("{0:yyyMMMdddhhmmsstt}", DateTime.Now);
                        string documentName = obj.FileName.Trim().Replace(" ", "_");
                        string pathToSave = Server.MapPath(webConfigPath);
                        string filename = fDate + '_' + documentName;
                        obj.SaveAs(Path.Combine(pathToSave, filename));
                        imgs.Add(new Image { FileName = filename });
                    }
                }
                db.Image.AddRange(imgs);
                db.SaveChanges();
                return RedirectToAction("Index");      
            }
            return View(images);
        }
        public ActionResult DownloadImage(string FileName)
        {
            return File(webConfigPath + FileName, GetContentType(FileName), Server.UrlEncode(FileName));
        }
        private string GetContentType(string FileName)
        {
            string contentType = "application/octestream";
            string ext = Path.GetExtension(FileName).ToLower();
            Microsoft.Win32.RegistryKey registryKey = Microsoft.Win32.Registry.ClassesRoot.OpenSubKey(ext);

            if (registryKey != null && registryKey.GetValue("Content Type") != null)
                contentType = registryKey.GetValue("Content Type").ToString();

            return contentType;
        }

        public ActionResult DeleteImage(string images, int id)
        {
            string pathToSave = HostingEnvironment.MapPath("~") + WebConfigurationManager.AppSettings["UploadImage"];
            string fullPath = pathToSave + images;
            int rs = 0;
            if (System.IO.File.Exists(fullPath))
            {
                System.IO.File.Delete(fullPath);
                Image i = db.Image.Find(id);
                i.FileName = null;
                db.Image.Remove(i);
                rs = db.SaveChanges();
            }
            return Json(new { deleteRow = rs }, JsonRequestBehavior.AllowGet);
        }
    }
}

