using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace k8.docker.app.client.user.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserClientController : ControllerBase
    {        
        // GET api/values
        [HttpGet("api/GetAppVersion")]
        public ActionResult<string> Get()
        {
            string appVersion = Environment.GetEnvironmentVariable("APP_VERSION");
            return string.Concat("APP_VERSION : ", appVersion);
        }
        // GET api/serverdata
        [HttpGet("api/GetServerMessage")]
        public async Task<string> GetServerMessage()
        {
            string baseUrl = Environment.GetEnvironmentVariable("Server_URI");
            //if (baseUrl.Equals(string.Empty))
            //    baseUrl = "http://api-server:5002/";//"http://localhost:32768/";

            try
            {
                using (HttpClient client = new HttpClient())
                {
                    HttpResponseMessage response = await client.GetAsync(string.Concat(baseUrl, "api/UserSrv/GetServerClient"));
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                        return await response.Content.ReadAsStringAsync();
                    else
                        return "Some error";
                }
            }
            catch (Exception ex)
            {
                return string.Concat("Error !!!- ", ex.Message);
            }
        }
    }
}
