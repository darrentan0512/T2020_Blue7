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
                        <h3 class="navbar-dark d-flex justify-content-center" style="padding-top:20px;">Welcome,
                            <asp:Literal ID="Literal_Name" runat="server"></asp:Literal>
                        </h3>
                        <p class="navbar-text d-flex justify-content-end">Last login :
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

                        <div class="card mb-3">
                            <div class='card-header'>
                                Your customer Details
                            </div>
                            <div class='card-body'>
                                <!-- enter account details -->
                            </div>
                        </div>

                        <!-- DataTables Example -->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fas fa-table"></i> Account Transaction Details
                            </div>
                            <div class="card-body">
                                <div class="row" class="form-group">
                                    <div class="col-md-4 col-xs-12">
                                        Accounts :
                                        <asp:DropDownList ID="ddl_accounts" runat="server" OnSelectedIndexChanged="ddl_accounts_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3 col-xs-12">
                                        Date From :
                                        <input type="date" class="form-control" id="date-from" placeholder="Date For" name="date-from">
                                    </div>

                                    <div class="col-md-3 col-xs-12">
                                        Date To :
                                        <input type="date" class="form-control" id="date-to" placeholder="Date To" name="date-to">
                                    </div>
                                    <div class="col-md-1 col-xs-12">
                                        <button type="button" class="btn btn-primary" style="margin-top: 1rem">Search </button>
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
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
            <script src="js/demo/chart-area-demo.js"></script>
        </form>
    </body>

    </html>