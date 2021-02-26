using addtocart.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace addtocart.Controllers
{
    public class HomeController : Controller
    {
        db_ecommerceEntities db = new db_ecommerceEntities();
        public ActionResult Index()
        {
            return View(db.tbl_product.OrderByDescending(x=>x.pro_id).ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}