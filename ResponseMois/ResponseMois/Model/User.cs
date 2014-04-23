using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ResponseMois.Model
{
    public class User : AbstractEntity
    {
        public virtual string firstName { get; set; }
        public virtual string lastName { get; set; }
        public virtual string userName { get; set; }
        public virtual string password { get; set; }
        public virtual string role { get; set; }
        public virtual DateTime birthDate { get; set; }
        public virtual string sex { get; set; }
        public virtual string address { get; set; }
        public virtual string city { get; set; }
        public virtual int postNumber { get; set; }
        public virtual int telephone { get; set; }
        public virtual string email { get; set; }
        public virtual int telephoneParent { get; set; }
        public virtual string emailParent { get; set; }
        public virtual string class_teacher_id { get; set; }
        
        public virtual IList<Course> Courses { get; set; }

        public virtual void addCourse(Course course)
        {
            Courses.Add(course);
        }

        public User(){

        }
        public User(string userName, string password, string role, string firstName, string lastName, DateTime birthDate, string sex, string address, string city,
                    int postNumaber, int telephone, string email, int telephoneParent, string emailParent, string class_teacher_id)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.userName = userName;
            this.password = password;
            this.role = role;
            this.birthDate = birthDate;
            this.sex = sex;
            this.address = address;
            this.city = city;
            this.postNumber = postNumber;
            this.telephone = telephone;
            this.email = email;
            this.telephoneParent = telephoneParent;
            this.emailParent = emailParent;
            this.class_teacher_id = class_teacher_id;
        }

        
    }
}