<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="TEColones.gui.Estudiante.Dashboard" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
                <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#modalCerrarSesion" id="btnCerrarSesion">
                    CERRAR SESION
                </button>
            </div>
        </nav>

        <!--Manejo de errores-->
        <div class="alert alert-danger alert-dismissible" runat="server" id="alertError">
            <button class="close" type="button" data-dismiss="alert">×</button>
            <strong>The updated interview information was not saved!</strong>
            <div id="Div2" runat="server"></div>
        </div>

        <!--Manejo de errores
        <div class="alert alert-primary alert-dismissible fade show" role="alert" id="jhhj" runat="server">
            This is a primary alert—check it out!
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
        </div>-->

        <!-- Empieza los recuadros del centro.  -->
        <div class="container-fluid" style="margin-top: 75px">
            <div class="row">

                <!-- Esta primera columa se encarga de desplegar la iformacion de las estadisticas.  -->
                <div class="col-sm-12 col-md-12 col-lg-4">
                    <div class="card border-info" style="margin-bottom: 20px">
                        <div class="card-body text-center">
                            <h5 class="card-title">Estadisticas</h5>
                            <p class="card-text">CONTENIDO</p>
                            <asp:Button TID="btnHistorial" runat="server" CssClass="btn btn-primary" Text="VER MI HISTORIAL" UseSubmitBehavior="false" data-dismiss="modal" OnClick="errorImplementacion"></asp:Button>
                        </div>
                    </div>
                </div>

                <!-- Esta primera columa se encarga de desplegar el cuadro de  PERFIL.  -->
                <div class="col-sm-12 col-md-6 col-lg-4">
                    <div class="card border-info" style="margin-bottom: 20px">
                        <div class="card-body text-center">
                            <h5 class="card-title">Perfil</h5>

                            <style>
                                .Image {
                                    border-radius: 50%;
                                }
                            </style>
                            <asp:Image ID="imgProfile" runat="server" class="Image" Style="width: 100px" />

                            <p class="lead" id="lblUsername">NOMBRE DE USUARIO</p>
                            <div style="margin: 10px">
                                <p class="lead" id="lblNombre" runat="server" style="margin-left: 15px"></p>
                            </div>


                            <div class="row" style="margin:50px">
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <p class="card-text">TEColones disponibles:</p>
                                    <div style="margin: 10px">
                                        <p class="lead" id="lblTecolonesDisp" runat="server" style="margin-left: 15px">CONTENIDO</p>
                                    </div>

                                    <p class="card-text">Colones Disponibles</p>
                                    <div style="margin: 10px">
                                        <p class="lead" id="lblcolonesDisp" runat="server" style="margin-left: 15px">CONTENIDO</p>
                                    </div>

                                    <p class="card-text">Estado</p>
                                    <div style="margin: 10px">
                                        <p class="lead" id="lblEstado" runat="server" style="margin-left: 15px">CONTENIDO</p>
                                    </div>

                                    <p class="card-text">Carnet</p>
                                    <div style="margin: 10px">
                                        <p class="lead" id="lblCarnet" runat="server" style="margin-left: 15px">CONTENIDO</p>
                                    </div>
                                </div>


                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <p class="card-text">Telefono </p>
                                    <div style="margin: 10px">
                                        <p class="lead" id="lblTelefono" runat="server" style="margin-left: 15px">CONTENIDO</p>
                                    </div>

                                    <p class="card-text">Correo</p>
                                    <div style="margin: 10px">
                                        <p class="lead" id="lblCorreo" runat="server" style="margin-left: 15px">CONTENIDO</p>
                                    </div>

                                    <p class="card-text">Sede</p>
                                    <div style="margin: 10px">
                                        <p class="lead" id="lblSede" runat="server" style="margin-left: 15px">CONTENIDO</p>
                                    </div>

                                    <p class="card-text">Fecha Ingreso</p>
                                    <div style="margin: 10px">
                                        <p class="lead" id="lblFecha" runat="server" style="margin-left: 15px">CONTENIDO</p>
                                    </div>
                                </div>


                            </div>

                            <p class="card-text">Descripcion</p>
                            <div style="margin: 10px">
                                <p class="lead" id="lblDescripcion" runat="server" style="margin-left: 15px">CONTENIDO</p>
                            </div>

                            <asp:Button ID="btnEditarPerfil" CssClass="btn btn-primary" Text="EDITAR PERFIL" runat="server" UseSubmitBehavior="false" data-dismiss="modal" OnClick="btnEditarPerfil_Click" disabled></asp:Button>


                        </div>
                    </div>
                </div>

                <!-- Esta se Ebcarga del recuadro de TEColones  -->
                <div class="col-sm-12 col-md-6 col-lg-4">
                    <div class="card border-info" style="margin-bottom: 20px">
                        <div class="card-body text-center">
                            <h5 class="card-title">Intercambios</h5>

                            <!-- Seccion para Enviar Tecolones -->
                            <div style="margin: 50px">
                                <p class="lead" style="margin-top: 75px">Enviar TEColones a un amigo </p>
                                <p>Carnet del Amigo</p>
                                <div>
                                    <asp:TextBox ID="txtCarnetAmigo" runat="server" placeholder="EJ. 2015095715" CssClass="form-control"></asp:TextBox>

                                </div>
                                <p>Monto a Transferir</p>

                                <div>
                                    <asp:TextBox ID="txtMontoTransferir" runat="server" placeholder="EJ. 5000" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div style="margin-top: 15px">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalTransferir" id="btnTransferir">
                                        TRANSFERIR
                                    </button>
                                </div>
                            </div>
                            <!-- Seccion para Canjear Tecolones -->
                            <div style="margin: 50px">
                                <p class="lead" style="margin-top: 25px">Canjear TEColones por servicios </p>
                                <p class="card-text">Servicio:</p>
                                <asp:DropDownList ID="DDList_Servicios" runat="server" CssClass="form-control"></asp:DropDownList>
                                <p style="margin-top: 20px">Monto que desea canjear:</p>
                                <asp:TextBox ID="txtMontoCanjear" placeholder="Ej. 5000" runat="server" CssClass="form-control"></asp:TextBox>
                                <div style="margin: 25px">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCanjear">
                                        CANJEAR
                                    </button>




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

                                    <!-- Modal Canjear TEColones -->
                                    <div class="modal fade" id="modalCanjear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">CANJEAR TECOLONES</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Esta Seguro que desea canjear TEColones por Servicios?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                                                    <asp:Button ID="Button1" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="canjearTEColones" UseSubmitBehavior="false" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal Tranferir TEColones -->
                                    <div class="modal fade" id="modalTransferir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">TRANFERIR TECOLONES</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Esta Seguro que desea trasferir TEColones a un amigo?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                                                    <asp:Button ID="Button2" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="tranferirTEColones" UseSubmitBehavior="false" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
    </form>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
