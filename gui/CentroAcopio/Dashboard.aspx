<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="TEColones.gui.CentroAcopio.Dashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title>TEColones - Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</head>


<body>
    <form id="form1" runat="server">
        <!-- Linea azul de arriba  -->
        <nav class="navbar navbar-dark" style="background-color: #0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>
            <div class="form-inline">

            <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#modalCerrarSesion">
                CERRAR SESION
            </button>
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
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="card border-info" style="margin-bottom: 20px">
                        <div class="card-body text-center">
                            <h5 class="card-title text-center">Registro de Material de Estudiantes</h5>

                            <div class="row">
                                <div class="col-lg-4"></div>

                                <div class="col-sm-12 col-md-2 col-lg-4">

                                    <div style="margin: 50px">
                                        <label for="password">Tipo de material</label>
                                        <asp:DropDownList ID="DDlist_material" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div style="margin: 50px">
                                        <label for="email" style="margin: 10px">Identificacion</label>
                                        <asp:TextBox ID="txtCarnet" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div style="margin: 50px">
                                        <label for="password">Cantidad de material entregado</label>
                                        <asp:TextBox ID="TxtCantidad" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalRegistro">GUARDAR </button>

                        </div>
                    </div>
                </div>
            </div>



            <!-- Modal Registrar Material -->
            <div class="modal fade" id="modalRegistro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">REGISTRAR MATERIAL</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Esta Seguro que desea registar nuevo material a la cuenta de un estudiante?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                            <asp:Button ID="Button2" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="registrarMaterial" UseSubmitBehavior="false" />
                        </div>
                    </div>
                </div>
            </div>





            <!-- Modal de Cerrar Sesion -->
            <div class="modal fade" id="modalCerrarSesion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">CERRAR SESION</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Esta Seguro que desea cerrar sesion?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                            <asp:Button ID="btnConfirmar" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="btnLogOut_Click" UseSubmitBehavior="false" />
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
