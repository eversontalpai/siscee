<%-- 
    Document   : home
    Created on : 21/05/2017, 12:51:22
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
            <div class="row quadro2">
                <div class="panel panel-default col-lg-4">
                <div class="panel-body">
                    <a href="r?page=cadastro-produto">
                        <img class="img-circle img-ajust" src="resources/imagens/icones/cadastrarProduto.jpg" alt="" style="width: 60%"/>
                        
                    </a>
                    <h2 class="text-center">Cadastrar produto</h2>
                </div>
                </div>
                <div class="panel panel-default col-lg-4">
                <div class="panel-body">
                    <a href="r?page=cadastro-cliente">
                        <img class="img-circle img-ajust" src="resources/imagens/icones/adduser.jpg" alt="" style="width: 60%"/>
                        
                    </a>
                    <h2 class="text-center">Cadastrar cliente</h2>
                </div>
                </div>
                <div class="panel panel-default col-lg-4">
                <div class="panel-body">
                    <a href="estoque">
                        <img class="img-circle img-ajust" src="resources/imagens/icones/estoqu.jpg" alt="" style="width: 60%"/>
                        
                    </a>
                    <h2 class="text-center">Estoque</h2>
                </div>
                </div>
                <div class="row">
                <div class="panel panel-default col-lg-4">
                <div class="panel-body">
                    <a href="exibirClientes">
                        <img class="img-circle img-ajust" src="resources/imagens/icones/listarUser.jpg" alt="" style="width: 60%"/>
                        
                    </a>
                    <h2 class="text-center">Lista de Clientes</h2>
                </div>
                </div>
                <div class="panel panel-default col-lg-4">
                <div class="panel-body">
                    <a href="r?page=agenda">
                        <img class="img-circle img-ajust" src="resources/imagens/icones/agenda.jpg" alt="" style="width: 60%"/>
                        
                    </a>
                    <h2 class="text-center">Agenda</h2>
                </div>
                </div>
                <div class="panel panel-default col-lg-4">
                <div class="panel-body">
                    <a href="estatistica">
                        <img class="img-circle img-ajust" src="resources/imagens/icones/dashboards.jpg" alt="" style="width: 60%"/>
                        
                    </a>
                    <h2 class="text-center">Estatísticas</h2>
                    
                </div>
                </div>
                
                </div>
            </div>
        </div>
        ${retorno}
        
    </body>
</html>
