using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ResponseMois.Model;

namespace ResponseMois.Service
{
    public class UserService : AbstractService<User>
    {

        public User GetUserByEmail(String email)
        {
            User user = null;
            IList<User> users = EntityManager.GetAll(new User(), "from User");
            foreach (User u in users)
            {
                if (u.email == email)
                {
                    user = u;
                }
            }

            return user;
        }

    }
}