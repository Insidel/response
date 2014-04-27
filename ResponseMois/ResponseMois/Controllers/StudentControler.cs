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
            CourseService courseService = new CourseService();
            UserService userService = new UserService();

            User u = GetUserLogedInByEmail();
            User user = userService.FindByIdLazy((int)u.ID);  //kvuli nenacteni dalsich veci v pripade emailu /lazy loading
            ViewBag.studentCourses = user.Courses;

            return View();
        }

        //
        // GET: /Student/CourseDetail
        public ActionResult CourseDetail(int id)
        {
            CourseService courseService = new CourseService();
            UserService userService = new UserService();
            Course c = courseService.FindByIdLazy((int)id);
            ViewBag.course = c;
            ViewBag.teacher = ViewBag.course.Teacher;


            return View();
        }


	}
}