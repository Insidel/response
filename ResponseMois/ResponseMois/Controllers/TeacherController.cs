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
using NHibernate;

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
            if (ModelState.IsValid)
            {
                User loggedUser = GetUserLogedInByEmail();
                Course c = new Course();
                c.name = model.name;
                c.schoolYear = model.schoolYear;
                c.meetingTime = model.meetingTime;
                c.note = model.note;
                c.Teacher = loggedUser;
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
                u.userName = model.userName;
                u.firstName = model.firstName;
                u.role = SecurityController.ROLE_STUDENT;
                u.firstName = model.firstName;
                u.lastName = model.lastName;
                u.birthDate = model.birthDate;
                u.sex = model.sex;
                u.email = model.email;
                u.telephone = model.telephone;
                u.address = model.address;
                u.city = model.city;
                u.postNumber = model.postNumber;
                u.telephoneParent = model.telephoneParent;
                u.emailParent = model.emailParent;
                u.password = FormsAuthentication.HashPasswordForStoringInConfigFile("martin", "SHA1").ToLower();

                UserService userService = new UserService();
                userService.Persist(u);
            }

            return RedirectToAction("StudentsEdit", new { Message = "Student byl přidán." });
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

        //
        // GET: /Teacher/StudentRemove
        public ActionResult StudentRemove(int id)
        {
            CourseService courseService = new CourseService();
            courseService.Delete<User>(id);

            return RedirectToAction("StudentsEdit", new { Message = "Student byl smazán." });
        }


        //
        // GET: /Teacher/CourseDetail
        public ActionResult CourseDetail(int id)
        {
            CourseService courseService = new CourseService();
            ViewBag.course = courseService.FindByIdLazy((int)id);

            ViewBag.teacher = ViewBag.course.Teacher;

            return View();
        }


        //
        // GET: /Teacher/CourseAssignStudents
        public ActionResult CourseAssignStudents(int id)
        {
            UserService userService = new UserService();
            IList<User> userList = userService.GetAllStudents();  //GetAllStudentsNotInCourse();

            ViewBag.students = userList;
            ViewBag.courseID = id;

            return View();
        }


        //
        // POST: /Teacher/CourseAssignStudents
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CourseAssignStudents(int[] selectedObjects, int courseID)
        {
            UserService userService = new UserService();
            CourseService courseService = new CourseService();

            Course c = courseService.FindByIdLazy(courseID);

            foreach (int checkBoxSelected in selectedObjects)
            {
                User u = userService.FindByIdLazy(checkBoxSelected);
                c.addStudent(u);
                u.addCourse(c);
                userService.Persist(u);
                courseService.Persist(c);
            }

            return RedirectToAction("CourseDetail/"+courseID, new { Message = "Student byl pridan." });
        }


	}
}