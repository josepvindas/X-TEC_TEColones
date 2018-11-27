<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DashboardAdmin.aspx.cs" Inherits="TEColones.gui.Administrador.DashboardAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title>TEColones - Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">




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

    <script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />

</head>


<body>
    <form id="form1" runat="server">
        <!-- Linea azul de arriba  -->
        <nav class="navbar navbar-dark" style="background-color: #0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>
            <div class="form-inline">
                <asp:Button ID="btnCrearCuenta" data-toggle="modal" runat="server" CssClass="btn btn-outline-light" Text="CONFIGURACIONES" UseSubmitBehavior="false" data-dismiss="modal" OnClick="btnAjustes_Click"></asp:Button>

            </div>

        </nav>


        <!--Manejo de errores-->
        <div class="alert alert-danger" role="alert" id="alertError" runat="server">
            This is a primary alert—check it out!
        </div>

        <!--Modal de prueba-->


        <div class="container-fluid" style="margin-top: 75px">


            <div class="row">

                <!-- Esta primera columa se encarga de desplegar la iformacion de las estadisticas.  -->
                <div class="col-sm-12 col-md-12 col-lg-8">
                    <div class="card border-info" style="margin-bottom: 20px">
                        <div class="card-body text-center">
                            <h5 class="card-title text-center">Estadisticas</h5>

                            <div class="row">


                                <!--En esta columna se despliegan las estadisticas del administraodr-->
                                <div class="col-sm-12 col-md-6 col-lg-8">
                                    <div class="card-body text-center">
                                        <h5 class="card-title text-center">Metas</h5>

                                        <div class="row">
                                            <p class="lead">Toneladas de reciclaje generadas este ano:</p>
                                            <p class="lead" id="porAno" runat="server" style="margin-left: 15px">0</p>
                                        </div>

                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 25%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="progressAno" runat="server">100%</div>
                                        </div>

                                        <div class="row">
                                            <p class="lead">Toneladas de reciclaje generadas este mes:</p>
                                            <p class="lead" id="porMes" runat="server" style="margin-left: 15px">0</p>
                                        </div>
                                        <div class="progress" style="margin-bottom: 20px">
                                            <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 50%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="progressMes" runat="server">0%</div>
                                        </div>

                                        <script>
                                            let newprogress = document.getElementById("progressAno").innerHTML;
                                            let newprogress2 = document.getElementById("progressMes").innerHTML;

                                            document.getElementById("progressAno").style = "width: " + newprogress;
                                            document.getElementById("progressMes").style = "width: " + newprogress2;
                                        </script>

                                        <h5 class="card-title text-center">Registro</h5>

                                        <div class="row" style="margin-top: 20px">
                                            <p class="lead">Dinero asignado en beneficios este mes:</p>
                                            <p class="lead" id="dineroBeneficios" runat="server" style="margin-left: 15px">0</p>
                                            <p class="lead" style="margin-left: 5px">Colones</p>
                                        </div>

                                        <div class="row" style="margin-top: 10px">
                                            <p class="lead">Usuarios que han realizado cambios este mes:</p>
                                            <p class="lead" id="ususariosPorMes" runat="server" style="margin-left: 15px">0</p>

                                        </div>

                                        <div class="card-body text-left" id="piechart" style="width: 100%; height: 350px;"></div>


                                    </div>
                                </div>

                                <!--En esta columna de despliegan los top 10 estudiantes que entregan reciclaje-->
                                <div class="col-sm-12 col-md-6 col-lg-4" style="margin-top: 100px">
                                    <div class="card text-white bg-primary mb-3">

                                        <div class="card-header">Top Ranking de Estudiantes</div>

                                        <div class="card-body">

                                            <!--En esta columna simplemente se enmumeran los rankings y nombres-->
                                            <div class="row text-center">
                                                <h5 class="card-title" style="margin-left: 10px">#01</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P0" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#02</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P1" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#03</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P2" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#04</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P3" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#05</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P4" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#06</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P5" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#07</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P6" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#08</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P7" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#09</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P8" runat="server">CONTENT</p>
                                            </div>

                                            <div class="row">
                                                <h5 class="card-title text-left" style="margin-left: 10px">#10</h5>
                                                <p class="card-text" style="margin-left: 23px" id="P9" runat="server">CONTENT</p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <asp:Button ID="btnHistorial" runat="server" CssClass="btn btn-primary" Text="VER HISTORIAL" UseSubmitBehavior="false" OnClick="btnHistorial_Click"></asp:Button>
                        </div>
                    </div>
                </div>

                <!-- Esta columna se encarga de manejar las promociones y abrir las configuraciones.  -->
                <div class="col-sm-12 col-md-12 col-lg-4">
                    <div class="card border-info" style="margin-bottom: 15px">
                        <div class="card-body text-center">
                            <h5 class="card-title">Nueva Pomocion</h5>
                            <div style="margin: 20px">

                                <div style="margin: 10px">
                                    <asp:DropDownList ID="DDList_Promocion" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDList_Promocion_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <div id="div_doble" runat="server">


                                    <div class="row">
                                        <div style="margin: 10px">
                                            <p>Seleccione el Material 1</p>
                                            <asp:DropDownList ID="DDList_Material1" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                        <div style="margin: 10px">
                                            <p>Seleccione el Material 2</p>
                                            <asp:DropDownList ID="DDList_Material2" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div style="margin: 10px">
                                            <label for="email" style="margin: 10px">Cantidad material 1</label>
                                            <asp:TextBox ID="cantidadMaterial1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div style="margin: 10px">
                                            <label for="email" style="margin: 10px">Cantidad material 2</label>
                                            <asp:TextBox ID="cantidadMaterial2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div style="margin: 10px">
                                        <label for="email" style="margin: 10px">Bono</label>
                                        <asp:TextBox ID="txt_bono" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="row">
                                        <div style="margin: 10px">
                                            <label for="email" style="margin: 10px">Fecha Inicio</label>
                                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" placeholder="DD-MM-YYYY"></asp:TextBox>
                                        </div>

                                        <div style="margin: 10px">
                                            <label for="email" style="margin: 10px">Fecha Final</label>
                                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" placeholder="DD-MM-YYYY"></asp:TextBox>

                                        </div>
                                    </div>



                                </div>
                                <!-- Promociones simples-->
                                <div id="div_simple" runat="server">

                                    <div style="margin: 10px">
                                        <p>Seleccione el Material</p>
                                        <asp:DropDownList ID="DDList_Material3" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>

                                    <div style="margin: 10px">
                                        <label for="email" style="margin: 10px">Cantidad de Material</label>
                                        <asp:TextBox ID="cantidadMaterial3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div style="margin: 10px">
                                        <label for="email" style="margin: 10px">BONO</label>
                                        <asp:TextBox ID="txt_bono2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="row">
                                        <div style="margin: 10px">
                                            <label for="email" style="margin: 10px">Fecha Inicio</label>
                                            <asp:TextBox ID="txtStartDate2" runat="server" CssClass="form-control" placeholder="DD-MM-YYYY"></asp:TextBox>
                                        </div>

                                        <div style="margin: 10px">
                                            <label for="email" style="margin: 10px">Fecha Final</label>
                                            <asp:TextBox ID="txtEndDate2" runat="server" CssClass="form-control" placeholder="DD-MM-YYYY"></asp:TextBox>

                                        </div>
                                    </div>

                                </div>

                            </div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPromocion">
                                PUBLICAR
                            </button>
                        </div>
                    </div>

                    <!-- Se encarga de mostrar las promociones viejas-->
                    <div class="card border-info" style="margin-bottom: 20px">
                        <div class="card-body text-center">
                            <h5 class="card-title">Promociones Existentes</h5>

                            <div class="list-group" id="promotions" runat="server" style="height: 339px; overflow: scroll; -webkit-overflow-scrolling: touch;">
                            </div>

                            <div style="margin: 10px">
                                <h5 class="card-title">Eliminar Promociones</h5>
                                <asp:DropDownList ID="DDList_PromocionesEliminar" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPromocionEliminar">
                                ELIMINAR
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Crear Promocion -->
            <div class="modal fade" id="modalPromocion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">CREAR PROMOCION</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Esta Seguro que desea Crear una nueva promocion.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                            <asp:Button ID="Button2" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="btnPublicar_Click" UseSubmitBehavior="false" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Elimiar Promocion -->
            <div class="modal fade" id="modalPromocionEliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">ELIMINAR PROMOCION</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Esta Seguro que desea elimiar la promocion?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                            <asp:Button ID="btnEliminar" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="btnEliminar_Click" UseSubmitBehavior="false" />
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
