using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace k8.docker.app.server.user.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserSrvController : ControllerBase
    {
        // GET api/values
        // GET api/values
        [HttpGet("api/GetAppVersion")]
        public ActionResult<string> Get()
        {
            string appVersion = Environment.GetEnvironmentVariable("APP_VERSION");
            return string.Concat("APP_VERSION : ", appVersion);
        }


        [HttpGet("GetServerClient")]
        public ActionResult<string> GetServerClient()
        {
            return "Hi from server!!!!";
        }
    }
}
