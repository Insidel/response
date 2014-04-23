using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ResponseMois.Model
{
    public class Course : AbstractEntity
    {
        public virtual string name { get; set; }
        public virtual User Teacher { get; set; } //FK
        public virtual int schoolYear { get; set; }  
        public virtual DateTime meetingTime { get; set; }
        public virtual string note { get; set; }

        public virtual IList<User> Students { get; set; }

        public virtual void addStudent(User Student) 
        {
            Students.Add(Student);
        }

        public Course()
        {

        }


    }
}