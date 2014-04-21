using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ResponseMois.Service;
using ResponseMois.Model;
using System.Web.Security;
using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace ResponseMois.Controllers
{
    [Authorize]
    public class TeacherController : SecurityController
    {

        public TeacherController()
            : this(new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
        {
        }

        public TeacherController(UserManager<ApplicationUser> userManager)
        {
            UserManager = userManager;
        }

        public UserManager<ApplicationUser> UserManager { get; private set; }

        //
        // GET: /Teacher/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TestsEdit()
        {
            if (!isUserInRole(ROLE_TEACHER))
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            ViewBag.Message = "Úprava testů.";

            return View();
        }

        public ActionResult StudentsEdit()
        {
            if (!isUserInRole(ROLE_TEACHER))
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            ViewBag.Message = "Úprava studentů.";

            UserService userService = new UserService();
            IList<User> userList = userService.GetAllStudents(); 

            ViewBag.students = userList;
            return View();
        }

        public ActionResult CoursesEdit()
        {
            if (!isUserInRole(ROLE_TEACHER))
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            ViewBag.Message = "Úprava kurzů.";

            CourseService courseService = new CourseService();
            User u = GetUserLogedInByEmail();
            IList<Course> courseList = courseService.GetAllCoursesToUser(u); 

            ViewBag.courses = courseList;

            return View();
        }
        //
        // GET: /Teacher/CourseAdd
        public ActionResult CourseAdd()
        {
            return View();
        }


        //
        // POST: /Teacher/CourseAdd
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CourseAdd(Course model)
        {
            Debug.Write("ano");
            if (ModelState.IsValid)
            {
                User loggedUser = GetUserLogedInByEmail();
                Course c = new Course();
                c.name = model.name;
                c.schoolYear = model.schoolYear;
                c.meetingTime = model.meetingTime;
                c.note = model.note;
                c.teacher_id = (int)loggedUser.ID;
                CourseService courseService = new CourseService();
                courseService.Persist(c);
            }

            return RedirectToAction("CoursesEdit", new { Message = "Kurz byl přidán." });
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(User model)
        {
            if (ModelState.IsValid)
            {
                User u = new User();
                u.firstName = model.firstName;
                u.role = SecurityController.ROLE_STUDENT;
                UserService userService = new UserService();
                userService.Persist(u);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        //
        // GET: /Teacher/CourseRemove
        public ActionResult CourseRemove(int id)
        {
            CourseService courseService = new CourseService();
            courseService.Delete<Course>(id);

            return RedirectToAction("CoursesEdit", new { Message = "Kurz byl smazán." });
        }
	}
}