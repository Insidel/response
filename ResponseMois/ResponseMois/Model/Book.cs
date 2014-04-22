using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ResponseMois.Model
{
    public class Book : AbstractEntity
    {
        public virtual string Title { get; set; }
        public virtual string Isbn { get; set; }
        public virtual string Author { get; set; }

        public override string ToString()
        {
            return "BOOK - Title:" + Title + ", Isbn:" + Isbn + ", Author:" + Author;
        }

        public Book() { }

        public Book(int id, string title, string isbn, string author)
        {
            this.ID = id;
            this.Title = title;
            this.Isbn = isbn;
            this.Author = author;
        }

    }

}
