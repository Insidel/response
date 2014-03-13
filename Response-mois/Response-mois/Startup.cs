using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Response_mois.Startup))]
namespace Response_mois
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
