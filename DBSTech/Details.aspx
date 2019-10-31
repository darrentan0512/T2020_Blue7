<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="DBSTech.Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body id="page-top">
    <form runat="server">
        <div id="wrapper">

            <div id="content-wrapper">
                <nav class="navbar navbar-light bg-light">
                    <a class="navbar-brand d-flex justify-content-start" href="#">
                        <img src="https://www.dbs.com.sg/iwov-resources/flp/images/dbs_logo.svg" height="40" class="d-inline-block align-top" alt="">
                    </a>
                    <h3 class="navbar-dark d-flex justify-content-center" style="padding-top: 20px;">Welcome,
                            <asp:Literal ID="Literal_Name" runat="server"></asp:Literal>
                    </h3>
                    <p class="navbar-text d-flex justify-content-end">
                        Last login :
                            <asp:Literal ID="Literal_LastLogin" runat="server"></asp:Literal>
                    </p>
                </nav>
                <br>
                <div class="container-fluid">

                    <!-- Icon Cards-->

                    <!-- Area Chart Example
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            Area Chart Example</div>
          <div class="card-body">
            <canvas id="myAreaChart" width="100%" height="30"></canvas>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div> -->

                    <!-- Area Chart Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-chart-area"></i>
                            Expenses
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <canvas id="myPieChart" width="100%" height="60"></canvas>
                                </div>
                                <div class="col-md-6">
                                    <canvas id="myBarChart" width="100%" height="60"></canvas>
                                </div>
                            </div>

                        </div>
                        <div class="card-footer small text-muted"></div>
                    </div>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Account Transaction Details
                        </div>
                        <div class="card-body">
                            <div class="row" class="form-group">
                                <div class="col-md-4 col-xs-12">
                                    Accounts :
                                    <asp:DropDownList ID="ddl_accounts" runat="server" OnSelectedIndexChanged="ddl_accounts_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="col-md-3 col-xs-12">
                                    Date From :
                                    <input type="date" class="form-control" id="html_date_from" placeholder="Date For" name="date_from" runat="server">
                                </div>

                                <div class="col-md-3 col-xs-12">
                                    Date To :
                                    <input type="date" class="form-control" id="html_date_to" placeholder="Date To" name="date_to" runat="server">
                                </div>
                                <div class="col-md-1 col-xs-12">
                                    <asp:Button ID="btn_Submit" runat="server" Text="Search" class="btn btn-primary" OnClick="Button1_Click" />
                                </div>
                            </div>
                            <hr />
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Type</th>
                                            <th>Amount</th>
                                            <th>Date</th>
                                            <th>Category</th>
                                            <th>Reference Number</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <asp:Literal ID="Literal_Display" runat="server"></asp:Literal>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer small text-muted"></div>
                    </div>

                </div>
                <!-- /.container-fluid -->



            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong" onclick="getMarketingMsg()">
            DBS Messages
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Messages</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <ul class="list-group">
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>

                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="vendor/datatables/jquery.dataTables.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="js/demo/datatables-demo.js"></script>
        <%--  <script src="js/demo/chart-area-demo.js"></script>--%>
    </form>

            <script>
            function getMarketingMsg() {
                console.log("get some messages");
                const userAction = async () => {
                    const response = await fetch('http://techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com/marketing', {
                        method: 'GET',
                        headers: {
                            'identity': 'Group7',
                            'token': '608cf106-2384-46de-8271-5c1f0b40ee5c'
                        }
                    });
                    const myJson = await response.json(); //extract JSON from the http response
                    console.log(myJson);
                    // do something with myJson
                }
            }
        </script>
        <script>
            $.ajax({
                method: "GET",
                url: "http://techtrek-api-gateway.ap-southeast-1.elasticbeanstalk.com/marketing",
                headers: {
                    identity: 'Group7',
                    token: '608cf106-2384-46de-8271-5c1f0b40ee5c'
                }
            }).done(function (data) {
                console.log(data);
                for (var i = 0; i < data.length; i++) {


                    $('.list-group').append('<li class="list-group-item">' + data[i]['summary'] + '</li>');


                }
            });
        </script>
    <script>
        function codeAddress() {


            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';

            // Pie Chart Example

            var pieChartData = [];

            $.ajax({
                type: "POST",
                url: "Details.aspx/getPieChartData",
                contentType: "application/json; charset=utf-8",
                data: "{}",
                dataType: "json",
                success: function (msg) {
                    pc(msg.d);
                }
            });

            function pc(pieChartData) {
                var labels = [];
                var data = [];
                for (var i = 0; i < pieChartData.length; i++) {
                    labels[i] = pieChartData[i]['Category'];
                    data[i] = pieChartData[i]['Count'];
                }
                console.log(labels);
                console.log(data);

                var ctx = document.getElementById("myPieChart");
                var myPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                            data: data,
                            backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
                        }],
                    },
                });
            }

            var barChartData = [];

            $.ajax({
                type: "POST",
                url: "Details.aspx/getBarChartData",
                contentType: "application/json; charset=utf-8",
                data: "{}",
                dataType: "json",
                success: function (msg) {
                    bc(msg.d);
                }
            });

            function bc(barChartData) {
                // Bar Chart Example
                var ctx = document.getElementById("myBarChart");

                var labels = []
                var debitData = []
                var creditData = []
                for (var i = 0; i < barChartData.length; i++) {
                    labels[i] = barChartData[i]['month'];
                    debitData[i] = barChartData[i]['data'][0];
                    creditData[i] = barChartData[i]['data'][1];
                }
                console.log(debitData);
                console.log(creditData);
                console.log(labels);
                var myLineChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ["January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                        datasets: [
                            {
                                label: "Debit",
                                backgroundColor: "#3e95cd",
                                data: debitData
                            }, {
                                label: "Credit",
                                backgroundColor: "#B22222",
                                data: creditData
                            }
                        ]
                    },
                    options: {
                        title: {
                            display: true,
                            text: 'Debit Credit Account'
                        },
                        scales: {
                            yAxes: [{
                                display: true,
                                ticks: {
                                    min: 0, // minimum value
                                }
                            }]
                        }
                    }
                });
            }
        }
        window.onload = codeAddress;

    </script>

</body>
</html>
