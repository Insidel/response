using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ResponseMois.Model;
using NHibernate;
using NHibernate.Criterion;

namespace ResponseMois.Service
{
    public class CourseService : AbstractService<Course>
    {
        public IList<Course> GetAllCoursesToUser(User user)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                return session
                    .CreateCriteria(typeof(Course))
                    .Add(Restrictions.Eq("Teacher", user))
                    .List<Course>();
            }

        }

        public IList<Course> GetAllStudentsToCourse(Course course)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
              /**
                return session
                    .CreateCriteria(typeof(Course))
                    .CreateAlias("Students", "sxc")
                    .Add(Restrictions.Eq("sxc.CourseID", course.ID))
                    .List<User>();
                **/
            }

        }



    }
}