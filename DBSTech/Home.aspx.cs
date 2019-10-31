using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBSTech
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            api_getCustomerID(TextBox1.Text);
            api_getCustomerDetails("2");
        }

        // getCustomerID start
        public customer api_getCustomerID(string username)
        {
            var client = new RestClient($"http://techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com/customers/{username}");
            var request = new RestRequest(Method.GET);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Connection", "keep-alive");
            request.AddHeader("Accept-Encoding", "gzip, deflate");
            request.AddHeader("Host", "techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com");
            request.AddHeader("Postman-Token", "d83cf7e9-546e-40d4-aa25-63c5383bfcf3,3ed5d6ad-d652-47e8-ab15-9a474e55549e");
            request.AddHeader("Cache-Control", "no-cache");
            request.AddHeader("Accept", "*/*");
            request.AddHeader("User-Agent", "PostmanRuntime/7.19.0");
            request.AddHeader("token", "608cf106-2384-46de-8271-5c1f0b40ee5c");
            request.AddHeader("identity", "Group7");
            IRestResponse response = client.Execute(request);

            customer cusObj = JsonConvert.DeserializeObject<customer>(response.Content);

            return cusObj;
        }

        public class customer
        {
            public string userName { get; set; }
            public string customerId { get; set; }
        }
        
        // getCustomerID end

        public void api_getCustomerDetails(string customerID)
        {
            var client = new RestClient($"http://techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com/customers/{customerID}/details");
            var request = new RestRequest(Method.GET);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Connection", "keep-alive");
            request.AddHeader("Accept-Encoding", "gzip, deflate");
            request.AddHeader("Host", "techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com");
            request.AddHeader("Postman-Token", "b597eb42-a5d5-4170-84d3-f2c70bb8fdd8,be03a9a5-5b07-4f48-a753-679c03c54dd1");
            request.AddHeader("Cache-Control", "no-cache");
            request.AddHeader("Accept", "*/*");
            request.AddHeader("User-Agent", "PostmanRuntime/7.19.0");
            request.AddHeader("token", "608cf106-2384-46de-8271-5c1f0b40ee5c");
            request.AddHeader("identity", "Group7");
            IRestResponse response = client.Execute(request);

            CustomerDetails custDetailsObj = JsonConvert.DeserializeObject<CustomerDetails>(response.Content);
        }

        public class CustomerDetails
        {
            public string customerId { get; set; }
            public string gender { get; set; }
            public string firstName { get; set; }
            public string lastName { get; set; }
            public string lastLogIn { get; set; }
            public string dateOfBirth { get; set; }
        }
    }
}