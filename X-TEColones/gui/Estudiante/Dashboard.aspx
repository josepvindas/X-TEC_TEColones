<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="gui_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>TEColones - Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
</head>



<body>
    <form id="form1" runat="server">
        <!-- Linea azul de arriba  -->
        <nav class="navbar navbar-dark" style="background-color:#0b4980;">
            <a class="navbar-brand" href="#">X-TEC</a>
            <form class="form-inline">
                <asp:Button ID="btnCrearCuenta" data-toggle="modal" runat="server" CssClass="btn btn-outline-light" Text="CERRAR SESION" UseSubmitBehavior="false" data-dismiss="modal"> </asp:Button>
             </form>
        </nav>

<!-- Empieza los recuadros del centro.  -->
    <div class="container-fluid" style="margin-top:75px">
        <div class="row">

      <!-- Esta primera columa se encarga de desplegar la iformacion de las estadisticas.  -->
          <div class="col-sm-12 col-md-12 col-lg-4">
            <div class="card border-info" style="margin-bottom:20px">
              <div class="card-body text-center">
                <h5 class="card-title">Estadisticas</h5>
                <p class="card-text">CONTENIDO</p>
                  <asp:Button TID= "btnHistorial" runnat="server" CssClass="btn btn-primary" Text="VER MI HISTORIAL" UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>
                 </div>
            </div>
           </div>

    <!-- Esta primera columa se encarga de desplegar el cuadro de  PERFIL.  -->
         <div class="col-sm-12 col-md-6 col-lg-4">
            <div class="card border-info" style="margin-bottom:20px">
              <div class="card-body text-center">
                <h5 class="card-title">Perfil</h5>

                        <style>
                          .Image
                           {
                              border-radius: 50%; }

                        </style>
                        <asp:Image ID="imgProfile" runat="server" class="Image" style="width:100px"/>

                <p class="lead" id="lblUsername">NOMBRE DE USUARIO</p>

                <p class="card-text">TEColones disponibles:</p>
                <p class="lead" id="lblTCDisponibles">NOMBRE DE USUARIO</p>

                <p class="card-text">TEColones adquiridos este mes:</p>
                <p class="lead" id="lblTCAdquiridos">NOMBRE DE USUARIO</p>

                <p class="card-text">Tipo de cambio actual:</p>
                <p class="lead" id="lblTipoCambio">NOMBRE DE USUARIO</p>
                <asp:Button ID="btnEditarPerfil" CssClass="btn btn-primary" Text="EDITAR PERFIL" runat="server" UseSubmitBehavior="false" data-dismiss="modal" OnClick="btnEditarPerfil_Click"></asp:Button>
               

              </div>
            </div>
          </div>

       <!-- Esta se Ebcarga del recuadro de TEColones  -->
      <div class="col-sm-12 col-md-6 col-lg-4">
        <div class="card border-info" style="margin-bottom:20px">
          <div class="card-body text-center">
            <h5 class="card-title">Intercambios</h5>

        <!-- Seccion para Enviar Tecolones -->
            <div>
              <p class="lead" style="margin-top:75px">Enviar TEColones a un amigo </p>
              <p>"Carnet del Amigo</p>
             <div>
                  <asp:TextBox ID="txtCarnetAmigo" runat="server" placeholder="EJ. 2015095715" ></asp:TextBox>
             
             </div>
                 <p>"Monto a Transferir</p>
             
              <div>
                 <asp:TextBox ID="txtMontoTransferir" runat="server" placeholder="EJ. 5000"></asp:TextBox>
              
              </div>
            <div>
                <asp:Button ID="idTansferir" CssClass="btn btn-primary" Text="TRASNFERIR" style="margin-top:20px" runat="server"  UseSubmitBehavior="false" data-dismiss="modal"></asp:Button>          
              </div>           
            </div>
             <!-- Seccion para Canjear Tecolones -->
            <div>
              <p class="lead" style="margin-top:75px">Canjear TEColones por servicios </p>
              <p class="card-text"> Servicio:</p>
              <asp:DropDownList ID="DDList_Servicios" runat="server" ></asp:DropDownList>              
              <p class="lead"> Monto que desea canjear:</p>
              <asp:TextBox ID="txtMontoCanjear" placeholder="Ej. 5000" runat="server"></asp:TextBox>
              <div>
                 <asp:Button ID="TriggerBtn" runat="server" Text="PopModal" CssClass="btn btn-info" data-toggle="modal" data-target="#exampleModal" OnClientClick ="return false"  UseSubmitBehavior="false" data-dismiss="modal"/>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            ...
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                          </div>
                        </div>
                      </div>
                    </div>

  
          
                  
                 
              </div>
              
                </div>
              </div>
            </div>
          </div>
       </div>
    </div>


    </form>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
            <script src="/js/my.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
</body>
</html>
