using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ResponseMois.Model
{
    public class Course : AbstractEntity
    {
        public virtual string name { get; set; }
        public virtual int teacher_id { get; set; } //FK
        public virtual int schoolYear { get; set; }  
        public virtual DateTime meetingTime { get; set; }
        public virtual string note { get; set; }

        public Course()
        {

        }
        public Course(string name, int teacher_id, int schoolYear, DateTime meetingTime, string note)
        {
            this.name = name;
            this.teacher_id = teacher_id;
            this.schoolYear = schoolYear;
            this.meetingTime = meetingTime;
            this.note = note;
        }

    }
}