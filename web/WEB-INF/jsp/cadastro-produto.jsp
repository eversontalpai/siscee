<%-- 
    Document   : cadastro-produto
    Created on : 21/05/2017, 13:30:41
    Author     : Everson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
            <div class="row titulo">
                <h1 class="text-center">Cadastrar Produto</h1>
                <hr>
            </div>
            <div class="row ">
                <form action="cadastrarProduto" method="POST">

        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Nome</label>
                <input type="text" class="form-control" name="nome" required="" >
            </div>
        </div>
        <div class="row">           
            <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Quantidade em Estoque</label>
                <input type="text" name="quantidadeEstoque" class="form-control" required="">
            </div>
        </div>
        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Valor do Cento</label>
                <input type="text" name="valorCento" class="form-control" required="">
            </div>
        </div>
       
        <div class="row">             
            <div class="form-group col-lg-1 col-lg-offset-4">
                <input type="submit" class="btn btn-primary text-center" value="Enviar">  
            </div>
              <div class="form-group">
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
