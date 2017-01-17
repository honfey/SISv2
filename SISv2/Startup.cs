using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SISv2.Startup))]
namespace SISv2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
