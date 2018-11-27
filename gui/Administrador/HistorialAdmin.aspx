<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HistorialAdmin.aspx.cs" Inherits="TEColones.gui.Administrador.HistorialAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>TEColones - Historial Admin</title>



    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var data = google.visualization.arrayToDataTable(<%=getGraphInfo()%>);

            var options = {
                title: 'Toneladas de reciclaje por Sede'
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);

            if (document.addEventListener) {
                window.addEventListener('resize', drawChart);
            }
            else if (document.attachEvent) {
                window.attachEvent('onresize', drawChart);
            }
            else {
                window.resize = drawChart;
            }
        }
    </script>

</head>

<body>
    <!--Linea Azul arriba de la pagina-->
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark" style="background-color: #0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>
            <div class="form-inline">
                <asp:Button ID="btnCerrarSesion" runat="server" CssClass="btn btn-outline-light" Text="CERRAR SESION" UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>
            </div>
        </nav>

        <div class="container-fluid" style="margin-top: 75px">
            <div class="row">
                <!-- Esta columna se encarga de manejar las promociones y abrir las configuraciones.  -->
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="card border-info" style="margin-bottom: 15px">
                        <div class="card-body text-center">
                            <h5 class="card-title">Consultar Historial</h5>
                            <div class="row">
                                <div class="col-lg-2 col-md-0 col-sm-0  "></div>
                                <div class="col-lg-8 col-md-12 col-sm-12">
                                    <div class="card-body text-center">
                                        <div class="row">
                                            <div style="margin-top: 50px; margin-left: 50px; margin-right: 10px;">
                                                <asp:DropDownList ID="DDList_Ano" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <div style="margin-top: 50px; margin-right: 10px">
                                                <asp:DropDownList ID="DDList_Mes" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <div style="margin-top: 50px; margin-right: 50px;">
                                                <asp:DropDownList ID="DDList_Sede" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <div style="margin: 50px">
                                                <asp:Button ID="bntConsulta" runat="server" CssClass="btn btn-primary" Text="CONSULTAR" UseSubmitBehavior="false" OnClick="btnConsulta_Click"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="card-body text-center">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="card-body text-center" id="piechart" style="width: 900px; height: 600px;"></div>
                                    </div>
                                    </div>
                                    

                                </div>


                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" integrity="sha384-pjaaA8dDz/5BgdFUPX6M/9SUZv4d12SUPF0axWc+VRZkx5xU3daN+lYb49+Ax+Tl" crossorigin="anonymous"></script>
</body>
</html>