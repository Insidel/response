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
                    .Add(Restrictions.Eq("teacher_id", (int)user.ID))
                    .List<Course>();
            }

        }



    }
}