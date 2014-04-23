using Microsoft.Owin;
using ResponseMois.Model;
using ResponseMois.Service;
using ResponseMois.Design;
using Owin;

[assembly: OwinStartupAttribute(typeof(ResponseMois.Startup))]
namespace ResponseMois
{
    public partial class Startup
    {
        private BookService bookService = new BookService();
        private UserService userService = new UserService();

        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);


            // only debug

            TableSchemaGenerator generator = new TableSchemaGenerator();
            //generator.Generate();

            Book book = new Book();
            // bookService.Persist(book);

            User user = new User();
            // userService.Persist(user);
        }
    }
}