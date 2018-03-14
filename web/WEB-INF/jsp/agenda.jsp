<%-- 
    Document   : agenda
    Created on : 21/05/2017, 17:22:51
    Author     : Everson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
       
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
            <div class="row titulo">
                <h1 class="text-center">Agenda</h1>
                <hr>
            </div>
            <div class="row">
    <form action="verificarDia" method="POST">
    <div class="input-group col-lg-6 col-lg-offset-2">
    <div class="input-group col-lg-6 col-lg-offset-1">
        <label class="text-center">Escolha o Dia</label>
    </div> 
        <div class="col-lg-2 col-lg-offset-1">            
            <input type="date" class="datepicker date input-medium" name="dia">
            
        </div>
        <div class="col-lg-1  col-lg-offset-2">
            <input type="submit" class="btn btn-primary" value="Ir">
        </div>
            
    </div>
    </form>
</div>
<div class="row">
    <hr>
</div>

<c:if test="${not empty dia}">
<div class="row">     
        
           
                <h1 class="text-center">${dia}</h1> <a href="encomenda">
                        <h2 class="text-center">Nova Encomenda <button class="btn btn-info" ><span class="glyphicon glyphicon-plus"></span></button></h2>
                       
                    </a>
                 
            
</div> 
                 
               
                
            
 <div class="row">
                  <div class="col-lg-11 col-lg-offset-1" >
                    
                 <c:if test="${not empty resposta}">

            <table class="table table-striped">
                <thead>
                
                <th class="text-left col-lg-4">Responsável pela Encomenda</th>
                <th class="text-left">Horário</th>
                <th class="col-lg-1"></th>
                <th class="col-lg-1"></th>
                

                </thead>
                <tbody>
                    <c:forEach  items="${resposta}" var="salgado" >
                        <tr>


                    <td >${salgado.cliente.nome}</td>
                    <td><fmt:formatDate type="time" value="${salgado.hora}"/></td>
                     <td><a href="enviarEncomenda?id=${salgado.id}" class="btn btn-primary text-center" data-toggle="tooltip" data-placement="top" title="Editar"><span class="glyphicon glyphicon-pencil"></span></a></td>                
                    <td><a href="excluirEncomenda?id=${salgado.id}" class="btn btn-danger text-center"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Excluir"></span></a></td>                
                   


                        </tr>
                    </c:forEach>
                </tbody>
            </table>
             <div class="form-group col-lg-1">
                  <a href="index"> <input type="button" class="btn btn-danger text-center" value="Voltar"></a>  
            </div>
                      </div>
    
</div>
                   

        </c:if>
        <c:if test="${empty resposta}">
            
            
            <h3 class="text-center">Ainda não há encomendas para esse dia<br></h3>



            
        </c:if>
                  
                            
               

    </c:if>     
        </div>
    </body>
</html>
