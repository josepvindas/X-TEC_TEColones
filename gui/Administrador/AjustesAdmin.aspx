<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjustesAdmin.aspx.cs" Inherits="TEColones.gui.Administrador.AjustesAdmin" EnableViewState="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <title>TEColones - Configuraciones Admin</title>

</head>

<body>
    <!--Linea Azul arriba de la pagina-->
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark" style="background-color: #0b4980;">
            <a class="navbar-brand" id="logo" runat="server" onserverclick="logo_Click">X-TEC</a>
            <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#modalCerrarSesion" id="btnCerrarSesion">
                CERRAR SESION
            </button>
        </nav>



        <!--Manejo de errores-->
        <div class="alert alert-danger" role="alert" id="alertError" runat="server">
            This is a primary alert—check it out!
        </div>



        <div class="container-fluid" style="margin-top: 10px">


            <!--Seccion encargada de manejar las configuraciones de la plataforma.-->
            <div class="row" id="configPlatform" runat="server">
                <!-- Encabezado de la tarjeta  -->
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="card border-info" style="margin-bottom: 15px">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active">Configuraciones de la Plataforma</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" id="perfLink01" runat="server" onserverclick="perfLink_Click">Configuraciones del Perfil</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" id="cuentLink01" runat="server" onserverclick="crearLink_Click">Crear Nueva cuenta Administrador</a>
                                </li>

                            </ul>
                        </div>


                        <!--Cuerpo de la tarjeta-->
                        <div class="card-body text-center">
                            <div class="row">
                                <div class="col-sm-12 col-md-6 col-lg-4">
                                    <h5 class="card-title">Formato del Tweet</h5>
                                    <div style="margin: 20px">
                                        <asp:TextBox ID="formatTweet" runat="server" TextMode="Multiline" Rows="10" CssClass="form-control"></asp:TextBox>
                                        <div class="row" style="margin: 15px">
                                            <p class="lead" style="margin-right: 15px">TEColones por kilogramo de Carton:</p>
                                            <asp:TextBox ID="precioCarton" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="row" style="margin: 15px">
                                            <p class="lead" style="margin-right: 15px">TEColones por kilogramo de Vidrio:</p>
                                            <asp:TextBox ID="precioVidrio" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="row" style="margin: 15px">
                                            <p class="lead" style="margin-right: 15px">TEColones por kilogramo de Papel:</p>
                                            <asp:TextBox ID="precioPapel" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="row" style="margin: 15px">
                                            <p class="lead" style="margin-right: 15px">TEColones por kilogramo de Plastico:</p>
                                            <asp:TextBox ID="precioPlastico" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-12 col-md-6 col-lg-4">
                                    <div style="margin: 20px">
                                        <div class="row" style="margin: 15px">
                                            <p class="lead" style="margin-right: 15px">Tipo de cambio actual:</p>
                                            <div style="margin: 15px">
                                                <asp:TextBox ID="txtTipoCambio" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="margin: 15px">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalTipoCambio" id="btnUpdateTipoCambio">
                                            Actualizar Tipo Cambio
                                        </button>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="row" style="margin: 15px">
                            <div class=" col-sm-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalGuardarCambios" id="btnGCambios">
                                    GUARDAR CAMBIOS
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Seccion encargada de manejar las configuraciones del perfil-->
        <div class="row" id="configPerfil" runat="server">
            <!-- Encabezado de la tarjeta  -->
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="card border-info" style="margin-bottom: 15px">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item">
                                <a class="nav-link" href="#" id="platLink01" runat="server" onserverclick="platLink_Click">Configuraciones de la Plataforma</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active">Configuraciones del Perfil</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#" id="cuentLink02" runat="server" onserverclick="crearLink_Click">Crear Nueva cuenta Administrador</a>
                            </li>

                        </ul>
                    </div>


                    <!--Cuerpo de la tarjeta-->
                    <div class="card-body text-center">
                        <div class="row">
                        </div>

                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="card-body text-center">
                                    <p class="lead" style="color: #ff0400">Todos los campos marcados con asterisco (*) son de caracter obligatorio.</p>
                                    <asp:TextBox ID="txtPO" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary" Style="margin-top: 50px" Text="CREAR CUENTA" UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>

        <!--Seccion encargada de la creacion de cuentas-->
        <div class="row" id="creacionCuenta" runat="server">
            <!-- Encabezado de la tarjeta  -->
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="card border-info" style="margin-bottom: 15px">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item">
                                <a class="nav-link" href="#" id="platLink02" runat="server" onserverclick="platLink_Click">Configuraciones de la Plataforma</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" id="perfLink02" runat="server" onserverclick="perfLink_Click">Configuraciones del Perfil</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" href="#">Crear Nueva cuenta Administrador</a>
                            </li>

                        </ul>
                    </div>


                    <!--Cuerpo de la tarjeta-->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <p class="card-text">Tipo de cuenta:</p>
                                    <asp:DropDownList ID="DDList_tipoLogin" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DDList_tipoLogin_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">

                            <!--columna espaciadora-->
                            <div class="col-sm-0 col-md-0 col-lg-2"></div>

                            <!-- PRIMERA COLUMNA -->
                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <div style="margin: 50px">
                                    <p class="card-text">Nombre</p>
                                    <asp:TextBox ID="nombreAdmin" runat="server" CssClass="form-control" placeholder="Ej. Luis Alfredo"></asp:TextBox>

                                    <p class="card-text">Universidad</p>
                                    <asp:DropDownList ID="universidadAdmin" runat="server" CssClass="form-control"></asp:DropDownList>

                                    <p class="card-text">Identificacion</p>
                                    <asp:TextBox ID="cedulaAdmin" runat="server" CssClass="form-control" placeholder="Ej. 116380678"></asp:TextBox>

                                    <p class="card-text">Contraseña</p>
                                    <asp:TextBox ID="contrasenaAdmin" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>


                            <!-- SEGUNDA COLUMNA -->
                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <div style="margin: 50px">
                                    <p class="card-text">Primer Apellido</p>
                                    <asp:TextBox ID="txtApellido1" runat="server" CssClass="form-control" placeholder="Ej. Alvarado"></asp:TextBox>
                                    <p class="card-text">Segundo Apellidos</p>
                                    <asp:TextBox ID="txtApellido2" runat="server" CssClass="form-control" placeholder="Ej. Rivera "></asp:TextBox>



                                    <p class="card-text" id="pDepar_Sede" runat="server">Departamento</p>
                                    <asp:DropDownList ID="departamentoAdmin" runat="server" CssClass="form-control"></asp:DropDownList>
                                     <asp:DropDownList ID="sedeAdmin" runat="server" CssClass="form-control"></asp:DropDownList>

                                    <p class="card-text">Correo Electronido</p>
                                    <asp:TextBox ID="correoAdmin" runat="server" CssClass="form-control" placeholder="Ej. sucorreo@ejemplo.com"></asp:TextBox>

                                    <p class="card-text">Confirmar Contraseña</p>
                                    <asp:TextBox ID="txtConfirmarPass" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="card-body text-center">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCrearCuenta" id="btnCrear">
                                        Crear Cuenta
                                    </button>
                                </div>
                            </div>
                        </div>
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
                        <asp:Button ID="btnConfirmar" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="btnCerrarSesion_Click" UseSubmitBehavior="false" />
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal de crear cuenta Admin-->
        <div class="modal fade" id="modalCrearCuenta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">CREAR CUENTA</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Esta seguro que de sea crear una nueva cuenta de administrador?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                        <asp:Button ID="Button1" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="btnCrearCuenta_Click" UseSubmitBehavior="false" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de guardar cambios en la plataforma-->
        <div class="modal fade" id="modalGuardarCambios" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">GUARDAR CAMBIOS</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Esta seguro que desea guardar los cambios en la plataforma?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                        <asp:Button ID="Button2" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="btnGuardarCambios_Click" UseSubmitBehavior="false" />
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal de TIPO DE CAMBIO-->
        <div class="modal fade" id="modalTipoCambio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">GUARDAR CAMBIOS</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Esta seguro que desea cambiar el tipo de Cambio?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
                        <asp:Button ID="btnActualizarTipoCambio" runat="server" Text="CONFIRMAR" CssClass="btn btn-primary" OnClick="btnActualizarTipoCambio_Click" UseSubmitBehavior="false" />
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
