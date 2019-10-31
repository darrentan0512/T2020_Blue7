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
            Literal_Name.Text = custObj.lastName + " " + custObj.firstName;
            Literal_LastLogin.Text = DateTime.Parse(custObj.lastLogIn).ToString("dd MMM yyyy HH:mm");

            List<DepositAccounts> depositObj = api_getListOfDepositAccounts(custObj.customerId);
            ddl_accounts.DataSource = depositObj;
            ddl_accounts.DataTextField = "accountDisplay";
            ddl_accounts.DataValueField = "accountId";
            ddl_accounts.DataBind();

            displayGridView();
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
            public string accountDisplay { get { return displayName + " - " + accountNumber; } }
        }

        public List<Transactions> api_getListOfTransactions(string accountId)
        {
            var client = new RestClient($"http://techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com/transactions/{accountId}?from=01-01-2018&to=02-01-2019");
            var request = new RestRequest(Method.GET);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Connection", "keep-alive");
            request.AddHeader("Accept-Encoding", "gzip, deflate");
            request.AddHeader("Host", "techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com");
            request.AddHeader("Postman-Token", "11dd9441-13fa-498b-a131-2ff6d3f10a23,6e235017-a5be-4b44-b292-6213fd793060");
            request.AddHeader("Cache-Control", "no-cache");
            request.AddHeader("Accept", "*/*");
            request.AddHeader("User-Agent", "PostmanRuntime/7.19.0");
            request.AddHeader("token", "608cf106-2384-46de-8271-5c1f0b40ee5c");
            request.AddHeader("identity", "Group7");
            IRestResponse response = client.Execute(request);

            List<Transactions> custDetailsObj = JsonConvert.DeserializeObject<List<Transactions>>(response.Content);

            return custDetailsObj;
        }

        public class Transactions
        {
            public string transactionId { get; set; }
            public string accountId { get; set; }
            public string type { get; set; }
            public string amount { get; set; }
            public string date { get; set; }
            public string tag { get; set; }
            public string referenceNumber { get; set; }
        }

        protected void ddl_accounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            displayGridView();
        }

        private void displayGridView()
        {
            string accountId = ddl_accounts.SelectedValue;

            List<Transactions> ListOFTransactions = api_getListOfTransactions(accountId);
            Literal_Display.Text = "";

            for (int i = ListOFTransactions.Count - 1; i >= 0; i--)
            {
                Literal_Display.Text += $"<tr><td> {ListOFTransactions[i].type} </td><td> {ListOFTransactions[i].amount} </td><td> {DateTime.Parse(ListOFTransactions[i].date).ToString("dd MMM yyyy")} </td><td> {ListOFTransactions[i].tag} </td><td> {ListOFTransactions[i].referenceNumber} </td></tr>";
            }
        }
    }
}