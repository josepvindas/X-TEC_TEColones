<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="gui_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>TEColones - Log In</title>

</head>

<body>
    <!--Linea Azul arriba de la pagina-->
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark" style="background-color:#0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>
            <form class="form-inline">
                <asp:Button ID="btnCrearCuenta" runat="server" CssClass="btn btn-outline-light" Text="CREAR CUENTA" OnClick="btnCrearCuenta_Click" UseSubmitBehavior="false" data-dismiss="modal"> </asp:Button>
            </form>
        </nav>

     <div class="container-fluid" style="margin-top:75px">
            
            <!-- Creo una fila -->
            <section class="main row">

                <!-- Info General de X-TEC -->
                <div class="col-sm-12 col-md-12 col-lg-6">
                    <h1 style="color:#0b4980" >¿Qué es TEColones?</h1>
                    <h2 style="margin-bottom:50px">Dale valor al reciclaje con ésta ecomoneda virtual.</h2>
                    <h3>Obtén beneficios como:<br>-Descuentos en el comedor<br>-Descuentos en el departamento financiero</h3>

                </div> 

                <!-- Cuadro Login -->
                <div class="col-sm-12 col-md-12 col-lg-4">
                    <div class="card border-info" style="max-width: 50rem;">  <!-- Enmarca el Login -->
                        <div class="card-body text-center">
                                <h5 class="card-title" style="margin:50px">Inicio Sesion</h5>
                                <asp:DropDownList ID="DDList_User" runat="server" ></asp:DropDownList>
                                <div style="margin:25px">
                                    <label for="email" style="margin-bottom:10px">Identificacion</label>
                                    <asp:TextBox ID="txtIdentificacion" runat="server"></asp:TextBox>
                                </div>
                                <div style="max-width:45rem;">
                                    <label for="password">Contrasena</label>
                                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                                </div>
                                
                                <div>
                                     <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" style="margin-top:50px" Text="INICIAR SESION" OnClick="btnLogin_Click" UseSubmitBehavior="false" data-dismiss="modal"> </asp:Button>  
                                 </div>    
                                <div>
                                    <p class="lead" style="margin-top:50px">Aun no posee una cuenta de TEColones? Cree una
                                        <a href="signup.html" class="card-link">AQUI</a>
                                    </p>
                                    <p style="margin-top:50px"> *Al utilizar la plataforma de TEColones usted acepta nuestros
                                        <a href="signup.html" class="card-link">Terminos y condiciones de Servicio</a>
                                    </p>
                                </div>
                            </div>
                        </div>
               </div>
            </section>
        

    </form>


    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" integrity="sha384-pjaaA8dDz/5BgdFUPX6M/9SUZv4d12SUPF0axWc+VRZkx5xU3daN+lYb49+Ax+Tl" crossorigin="anonymous"></script>
</body>
</html>
