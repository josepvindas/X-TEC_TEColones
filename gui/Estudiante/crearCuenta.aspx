<%@ Page Language="C#" AutoEventWireup="true" CodeFile="crearCuenta.aspx.cs" Inherits="TEColones.gui.Estudiante.crearCuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>TEColones - CREAR CUENTA</title>

</head>

<body>
    <!--Linea Azul arriba de la pagina-->
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark" style="background-color: #0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>

            <asp:Button ID="btnCrearCuenta" runat="server" CssClass="btn btn-outline-light" Text="CREAR CUENTA" UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>

        </nav>

        <!--Manejo de errores-->
        <div class="alert alert-danger" role="alert" id="alertError" runat="server">
            This is a primary alert—check it out!
        </div>



        <div class="container-fluid" style="margin-top: 75px">
            <!-- Creo una fila -->
            <section class="main row">

                <!-- Info General del Estudiante-->
                <div class="col-sm-12 col-md-12 col-lg-4" style="margin: 50px">
                    <div style="margin":"50px">
                        <p class="card-text">Nombre<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form.control"></asp:TextBox>
                        </div>    
                        
                        <p class="card-text">Primer Apellido<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtApellido1" runat="server" CssClass="form.control"></asp:TextBox>
                        </div>

                        <p class="card-text">Segundo Apellido<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtApellido2" runat="server" CssClass="form.control"></asp:TextBox>
                        </div>   

                        <p class="card-text">Carnet Estudiantil<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtCarnet" runat="server" CssClass="form.control"></asp:TextBox>
                        </div> 

                        <p class="card-text">Telefono Principal<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form.control"></asp:TextBox>
                        </div>

                        <p class="card-text">Telefono Secundariol<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtTelefono2" runat="server" CssClass="form.control"></asp:TextBox>
                        </div>                    
                    </div>
                </div>

                <!-- Info General del Estudiante-->
                <div class="col-sm-12 col-md-12 col-lg-4" style="margin: 50px">
                    <div style="margin":"50px">

                        <p class="card-text">Universidad<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px"> 
                            <asp:DropDownList ID="DDList_Universidad" runat="server" CssClass="form-control"></asp:DropDownList>                          
                        </div> 
                  
                        <p class="card-text">Sede<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px"> 
                            <asp:DropDownList ID="DDList_Sede" runat="server" CssClass="form-control"></asp:DropDownList>                          
                        </div>    
                        
                        <p class="card-text">Contrasena<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form.control"></asp:TextBox>
                        </div>

                        <p class="card-text">Confirmar Contrasena Apellido<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtPassword2" runat="server" CssClass="form.control"></asp:TextBox>
                        </div> 
                        <p class="card-text">Correo Principal<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtCorreo1" runat="server" CssClass="form.control"></asp:TextBox>
                        </div> 
                        <p class="card-text">Correo Secundario<a style="color: #ff0400">*</a></p>
                        <div style="margin":"40px">                            
                            <asp:TextBox ID="txtCorreo2" runat="server" CssClass="form.control"></asp:TextBox>
                        </div> 
                        
                         <div>
                             <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Style="margin-top: 50px" Text="INICIAR SESION" OnClick="btnLogin_Click" UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>
                         </div>
                           
                 
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
