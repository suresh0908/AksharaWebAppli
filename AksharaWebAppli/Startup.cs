using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AksharaWebAppli.Startup))]
namespace AksharaWebAppli
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
