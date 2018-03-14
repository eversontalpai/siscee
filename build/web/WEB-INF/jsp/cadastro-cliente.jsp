<%-- 
    Document   : cadastro-cliente
    Created on : 21/05/2017, 14:56:44
    Author     : Everson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
        <script>
        function telefone(){
            $("#novotel").append("<div class='form-group col-lg-4 col-lg-offset-4'><label>Telefone</label><input type='text' name='numeroTelefone' class='form-control' required=''></div>");
        }   
       
            
        </script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
            <div class="row titulo">
                <h1 class="text-center">Cadastrar Cliente</h1>
                <hr>
            </div>
              <div class="row">
                <form action="cadastrarCliente" method="POST">

        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Nome</label>
                <input type="text" class="form-control" name="nome" required="" value="">
            </div>
        </div>
        <div class="row">           
            <div class="form-group col-lg-4 col-lg-offset-4" id="tele">
                <label>Telefone</label>
                <input type="text" name="numeroTelefone" class="form-control" required="">
            </div>
        </div>
        <div class="row" id="novotel">           
            
        </div>
            <div class="form-group col-lg-4 col-lg-offset-4">
                <a id="maisTel" onclick="telefone()"><span class="glyphicon glyphicon-plus"></span></a>
            </div>
            
                    <hr>
        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Endereço</label>
                <input type="text" name="rua" class="form-control" required="">
            </div>
        </div>
        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-4">
                   <label>nº</label>
<input type="text" name="numero" class="form-control" required="">
            </div>
        </div>
        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Complemento</label>
                <input type="text" name="complemento" class="form-control" required="">
            </div>
        </div>
        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Bairro</label>
                <input type="text" name="bairro" class="form-control" required="">
            </div>
        </div>
        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Cidade</label>
                <input type="text" name="cidade" class="form-control" required="" value="SAO JOSE DOS CAMPOS">
            </div>
        </div>
       
        <div class="row">             
            <div class="form-group col-lg-1 col-lg-offset-4">
                <input type="submit" class="btn btn-primary text-center" value="Enviar">  
            </div>
              <div class="form-group col-lg-1">
                  <a href="r?page=home"> <input type="button" class="btn btn-danger text-center" value="Cancelar"></a>  
            </div>
        </div>
        
        <c:if test="${not empty retorno}">
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                
                    <h4>${retorno}</h4>  
               
            </div>
            </c:if>
    </form> 
            </div>
            </div>
      
    </body>
</html>
