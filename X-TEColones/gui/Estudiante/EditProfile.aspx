<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="gui_EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>TEColones - Crear Cuenta</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
</head>
<body>
    <form id="form1" runat="server">
        <!-- Linea azul de arriba  -->
        <nav class="navbar navbar-dark" style="background-color:#0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>
            <form class="form-inline">
                <asp:Button ID="btnCrearCuenta" runat="server" CssClass="btn btn-outline-light" Text="CERRAR SESION" UseSubmitBehavior="false" data-dismiss="modal"> </asp:Button>
             </form>
        </nav>
        <!-- Empieza los recuadros del centro.  -->
        <div class="container-fluid" style="margin-top:75px">
            <div class="row">

                <!-- PRIMERA COLUMNA -->
                <div class="col-sm-12 col-md-12 col-lg-4"> 
                    <p class="card-text">Nombre</p>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>

                    <p class="card-text">Universidad</p>
                    <asp:DropDownList ID="DDList_Universidad" runat="server"></asp:DropDownList>

                    <p class="card-text">Correo Electronico</p>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

                    
                    <p class="card-text">Numero Telefonico</p>
                    <asp:TextBox ID="txtNumeroTel" runat="server"></asp:TextBox>

                    
                    <p class="card-text">Contraseña</p>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </div>


                 <!-- SEGUNDA COLUMNA -->
                <div class="col-sm-12 col-md-12 col-lg-4"> 
                    <p class="card-text">Apellidos</p>
                    <asp:TextBox ID="txtApellidos" runat="server"></asp:TextBox>

                    <p class="card-text">Sede</p>
                    <asp:DropDownList ID="DropDownList_Sede" runat="server"></asp:DropDownList>

                    <p class="card-text">Correo Electronico Secundario</p>
                    <asp:TextBox ID="txtEmailSec" runat="server"></asp:TextBox>

                    
                    <p class="card-text">Numero Telefonico Secundario</p>
                    <asp:TextBox ID="txtNumeroSec" runat="server"></asp:TextBox>

                    
                    <p class="card-text"> Confirmar Contraseña</p>
                    <asp:TextBox ID="txtPassConfirm" runat="server"></asp:TextBox>

                </div>

                 <!-- Tercera COLUMNA -->
                <div class="col-sm-12 col-md-12 col-lg-4">
                    <div class="container" id="dv">
                     <p class="card-text">Subir Fotograía de Perfil</p>
                        <div>
                          <style>
                              .ImageButton{ border-radius: 50%; }
                            </style>
                            <asp:ImageButton ID="OmgProfile" runat="server" class="ImageButton" style="width:100px" UseSubmitBehavior="false" data-dismiss="modal"/>
                        </div>
                        
                     <p class="card-text">Descripcion del Estudiante</p>
                     <asp:TextBox ID="txtDescripcionEst" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        



    </form>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
</body>
</html>
