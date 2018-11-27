<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recuperarContrasena.aspx.cs" Inherits="TEColones.gui.recuperarContrasena" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>TEColones - Dashboard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                <asp:Button ID="btnCrearCuenta" runat="server" CssClass="btn btn-outline-light" Text="CERRAR SESION"></asp:Button>

            </div>

        </nav>

        <!--Modal de prueba-->


        <div class="container-fluid" style="margin-top: 75px">


            <div class="row">

                <!-- Esta primera columa se encarga de desplegar la iformacion de las estadisticas.  -->
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="card border-info" style="margin-bottom: 20px">
                        <div class="card-body text-center">
                            <h5 class="card-title text-center">Recuperacion de Constrasena de Usuario</h5>

                            <div class="row">
                                <div class="col-lg-4"></div>

                                <div class="col-sm-12 col-md-12 col-lg-4">

                                    <div style="margin-left: 50px; margin-right: 50px; margin-bottom: 100px; margin-top: 100px">
                                        <label for="email" style="margin: 10px">Identificacion</label>
                                        <asp:TextBox ID="txtCarnet" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>


                                </div>

                            </div>

                            <asp:Button ID="btnEnviar" runat="server" CssClass="btn btn-primary" Text="ENVIAR" OnClick="btnEnviar_Click"></asp:Button>
                        </div>
                    </div>
                </div>



            </div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" runat="server" id="btnModal" >
                Launch demo modal
            </button>
        </div>

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>
