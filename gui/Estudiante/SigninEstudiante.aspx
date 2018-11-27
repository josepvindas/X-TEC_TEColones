<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SigninEstudiante.aspx.cs" Inherits="TEColones.gui.Estudiante.SigninEstudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>TEColones - Crear Cuenta</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Linea azul de arriba  -->
        <nav class="navbar navbar-dark" style="background-color: #0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>
            <form class="form-inline">
                <asp:Button ID="btnCrearCuenta" runat="server" CssClass="btn btn-outline-light" Text="CERRAR SESION" UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>
            </form>
        </nav>
        <!-- Empieza los recuadros del centro.  -->
        <div class="container-fluid" style="margin-top: 75px">
            <div class="row">

                <!-- PRIMERA COLUMNA -->
                <div class="col-sm-12 col-md-12 col-lg-4">
                    <div style="margin: 50px">
                        <p class="card-text">Nombre<a style="color: #ff0400">*</a></p>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ej. Luis Alfredo"></asp:TextBox>

                        <p class="card-text">Universidad<a style="color: #ff0400">*</a></p>
                        <asp:DropDownList ID="DDList_Universidad" runat="server" CssClass="form-control"></asp:DropDownList>

                        <p class="card-text">Correo Electronico<a style="color: #ff0400">*</a></p>
                        <p style="color: #ffffff">'</p>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Ej. sucorreo@ejemplo.com"></asp:TextBox>


                        <p class="card-text">Numero Telefonico<a style="color: #ff0400">*</a></p>
                        <p style="color: #ffffff">'</p>
                        <asp:TextBox ID="txtNumeroTel" runat="server" CssClass="form-control" placeholder="Ej. 83157382"></asp:TextBox>


                        <p class="card-text">Contraseña<a style="color: #ff0400">*</a></p>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>


                <!-- SEGUNDA COLUMNA -->
                <div class="col-sm-12 col-md-12 col-lg-4">
                    <div style="margin: 50px">
                        <p class="card-text">Apellidos<a style="color: #ff0400">*</a></p>
                        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" placeholder="Ej. Rivera Alvarado"></asp:TextBox>

                        <p class="card-text">Sede<a style="color: #ff0400">*</a></p>
                        <asp:DropDownList ID="DDList_Sede" runat="server" CssClass="form-control"></asp:DropDownList>

                        <p class="card-text">Correo Electronico Secundario</p>
                        <p style="color: #a6a6a6">Ingrese los correos secundarios separados por coma (,)</p>
                        <asp:TextBox ID="txtEmailSec" runat="server" CssClass="form-control" placeholder="Ej. sucorreo2@ejemplo.com"></asp:TextBox>


                        <p class="card-text">Numero Telefonico Secundario</p>
                        <p style="color: #a6a6a6">Ingrese los numeros telefonicos secundarios separados por coma (,)</p>
                        <asp:TextBox ID="txtNumeroSec" runat="server" CssClass="form-control" placeholder="Ej. 83165893"></asp:TextBox>


                        <p class="card-text">Confirmar Contraseña<a style="color: #ff0400">*</a></p>
                        <asp:TextBox ID="txtPassConfirm" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- Tercera COLUMNA -->
                <div class="col-sm-12 col-md-12 col-lg-4">
                    <div style="margin: 50px">
                        <div class="container" id="dv">
                            <p class="card-text">Subir Fotograía de Perfil</p>
                            <div>
                                <style>
                                    .ImageButton {
                                        border-radius: 50%;
                                    }
                                </style>
                                <asp:ImageButton ID="OmgProfile" runat="server" class="ImageButton" Style="width: 100px" UseSubmitBehavior="false" data-dismiss="modal" />
                            </div>

                            <p class="card-text" style="margin-top: 152px">Descripcion del Estudiante</p>
                            <asp:TextBox ID="txtDescripcionEst" runat="server" TextMode="Multiline" Rows="5" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="card-body text-center">
                        <p class="lead" style="color: #ff0400">Todos los campos marcados con asterisco (*) son de caracter obligatorio.</p>
                        <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary" Style="margin-top: 50px" Text="CREAR CUENTA" UseSubmitBehavior="false" data-dismiss="modal" OnClick="btnSignUp_Click1"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
</body>
</html>