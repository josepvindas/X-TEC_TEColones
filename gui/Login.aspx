<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="TEColones.WebForm1" %>

<!DOCTYPE html>


<html class="bg-black" xmlns="http://www.w3.org/1999/xhtml">

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
        <nav class="navbar navbar-dark" style="background-color: #0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>

            <asp:Button ID="btnCrearCuenta" runat="server" CssClass="btn btn-outline-light" Text="CREAR CUENTA" OnClick="btnCrearCuenta_Click" UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>

        </nav>

        <!--Manejo de errores-->
        <div class="alert alert-danger" role="alert" id="alertError" runat="server">
            This is a primary alert—check it out!
        </div>

        <div class="container-fluid" style="margin-top: 75px">



            <!-- Creo una fila -->
            <section class="main row">

                <!-- Info General de X-TEC -->
                <div class="col-sm-12 col-md-12 col-lg-6 text-center" style="margin: 100px">
                    <h1 style="color: #0b4980">¿Qué es TEColones?</h1>
                    <h2 style="margin-bottom: 50px">Dale valor al reciclaje con ésta ecomoneda virtual.</h2>
                    <h3>Obtén beneficios como:<br>
                        -Descuentos en el comedor<br>
                        -Descuentos en el departamento financiero</h3>

                </div>

                <!-- Cuadro Login -->
                <div class="col-sm-12 col-md-12 col-lg-4" style="margin: 25px">
                    <div class="card border-info" style="max-width: 50rem; margin-bottom: 20px">
                        <!-- Enmarca el Login -->
                        <div class="card-body text-center">
                            <h5 class="card-title" style="margin: 25px">INICIO DE SESION</h5>
                            <div style="margin: 50px">
                                <asp:DropDownList ID="DDList_User" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDList_User_SelectedIndexChanged"></asp:DropDownList>
                            </div>

                            <div style="margin: 50px">
                                <label for="email" style="margin: 10px">Identificacion</label>
                                <asp:TextBox ID="txtIdentificacion" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div style="margin: 50px">
                                <label for="password">Contrasena</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div>
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Style="margin-top: 50px" Text="INICIAR SESION" OnClick="btnLogin_Click" UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>
                            </div>
                            <div>
                                <p class="lead" style="margin-top: 50px">
                                    Olvidaste tu contrasena? Recuperala
                                        <a href="#" id="recuperarContrasena" runat="server" class="card-link" onserverclick="recuperarContrasena_Click">AQUI</a>
                                </p>
                                <p style="margin-top: 50px">
                                    *Al utilizar la plataforma de TEColones usted acepta nuestros
                                        <a href="signup.html" class="card-link">Terminos y condiciones de Servicio</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- Modal de manejo de errores -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="First Name" class="form-control"></asp:TextBox><br />
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Middle Name" class="form-control"></asp:TextBox><br />
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Last Name" class="form-control"></asp:TextBox><br />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Close</button>
                        <%--<button type="button"  class="btn btn-primary">
                                        Save changes</button>--%>
                        <asp:Button Text="Save" runat="server" />
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
