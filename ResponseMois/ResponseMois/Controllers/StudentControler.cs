using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ResponseMois.Service;
using ResponseMois.Model;
using System.Web.Security;
using System.Diagnostics;

namespace ResponseMois.Controllers
{
    [Authorize]
    public class StudentController : SecurityController
    {

        

        //
        // GET: /Student/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Courses()
        {
            if (!isUserInRole(ROLE_STUDENT))
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            ViewBag.Message = "Přehled kurzů a výsledků v nich.";

            return View();
        }

	}
}