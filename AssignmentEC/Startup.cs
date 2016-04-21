using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AssignmentEC.Startup))]
namespace AssignmentEC
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
        }
    }
}
