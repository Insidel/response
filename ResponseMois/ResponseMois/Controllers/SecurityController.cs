using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ResponseMois.Service;
using System.Web.Security;
using ResponseMois.Model;
using System.Diagnostics;

namespace ResponseMois.Controllers
{
    public class SecurityController : Controller
    {
        
        protected const string ROLE_TEACHER = "teacher";
        protected const string ROLE_STUDENT = "student";

        UserService userService = new UserService();

        protected override void OnActionExecuting( ActionExecutingContext filterContext ) {
            ViewBag.IsInRoleTeacher = isUserInRole(ROLE_TEACHER);
            ViewBag.IsInRoleStudent = isUserInRole(ROLE_STUDENT);
        }

        protected User GetUserLogedInByEmail()
        {
            // read cookie
            String test = FormsAuthentication.FormsCookieName;
            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

            // check empty cookie
            if (authCookie == null) return null;

            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);

            // find user by email in cookie
            return userService.GetUserByEmail(ticket.Name);
        }

        protected bool isUserInRole(String role)
        {
            User u = GetUserLogedInByEmail();
            if(u != null && role == u.role)
            {
                return true;
            }

            return false;
        }


	}
}