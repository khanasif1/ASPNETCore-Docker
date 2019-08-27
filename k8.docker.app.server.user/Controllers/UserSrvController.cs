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
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "!!!!!Response from server!!!!!" };
        }       
    }
}
