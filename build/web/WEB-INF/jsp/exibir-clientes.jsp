<%-- 
    Document   : exibir-clientes
    Created on : 22/05/2017, 18:19:45
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
                <h1 class="text-center">Lista de Clientes</h1>
                <hr>
            </div>
            <div class="row">
                  <div class="col-lg-11 col-lg-offset-1" >
        <c:if test="${not empty resposta}">

            <table class="table table-striped">
                <thead>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th></th>
                <th></th>
                

                </thead>
                <tbody>
                    <c:forEach  items="${resposta}" var="cliente" >
                        <tr>


                    <td>${cliente.nome}</td>
                   <td> <c:forEach  items="${cliente.telefones}" var="telefone" >
                           ${telefone.numeroTelefone}<br>
                    </c:forEach></td>
                    <td>${cliente.endereco.rua}, ${cliente.endereco.numero}, ${cliente.endereco.bairro}</td>
                                    
                    <td><a href="enviarCliente?id=${cliente.id}" class="btn btn-primary text-center" data-toggle="tooltip" data-placement="top" title="Editar"><span class="glyphicon glyphicon-pencil"></span></a></td>                
                    <td><a href="excluirClientes?id=${cliente.id}" class="btn btn-danger text-center"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Excluir"></span></a></td>                
                   


                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            

        </c:if>
         <div class="row">
                    <c:if test="${empty resposta}">

                        <h3 class="text-center text-danger">Não há clientes cadastrados</h3>




                    </c:if>
                </div>

        
    </div>
            </div>
        </div>
    </body>
</html>
