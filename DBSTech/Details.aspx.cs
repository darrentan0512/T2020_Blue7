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
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = $"CustomerID: {Session["customerID"].ToString()}";

            CustomerDetails custObj = api_getCustomerDetails(Session["customerID"].ToString());
            Label1.Text = $"First Name: {custObj.firstName} <br/> Last Name: {custObj.lastName}";

            List<DepositAccounts> depositObj = api_getListOfDepositAccounts(custObj.customerId);
        }

        public CustomerDetails api_getCustomerDetails(string customerID)
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

            return custDetailsObj;
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


        public List<DepositAccounts> api_getListOfDepositAccounts(string customerID)
        {
            var client = new RestClient($"http://techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com/accounts/deposit/{customerID}");
            var request = new RestRequest(Method.GET);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Connection", "keep-alive");
            request.AddHeader("Accept-Encoding", "gzip, deflate");
            request.AddHeader("Host", "techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com");
            request.AddHeader("Postman-Token", "ca165b53-0b3a-4bf7-8b03-1c38840583ad,aa0d7177-c0c8-4df3-be4f-0ef54c995a4a");
            request.AddHeader("Cache-Control", "no-cache");
            request.AddHeader("Accept", "*/*");
            request.AddHeader("User-Agent", "PostmanRuntime/7.19.0");
            request.AddHeader("token", "608cf106-2384-46de-8271-5c1f0b40ee5c");
            request.AddHeader("identity", "Group7");
            IRestResponse response = client.Execute(request);

            List<DepositAccounts> custDetailsObj = JsonConvert.DeserializeObject<List<DepositAccounts>>(response.Content);

            return custDetailsObj;
        }

        public class DepositAccounts
        {
            public string accountId { get; set; }
            public string type { get; set; }
            public string displayName { get; set; }
            public string accountNumber { get; set; }
        }
    }
}