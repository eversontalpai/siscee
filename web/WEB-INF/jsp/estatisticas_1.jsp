<%-- 
    Document   : estatisticas
    Created on : 28/05/2017, 16:54:44
    Author     : Everson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
        <script>
            function criarAjax(ano){
                $.ajax({
                    url: "buscarAno?ano="+ano,
                    data: 'POST',
                   
                    success: function (idx, obj) {
                         alert('deu certo');
               
                    }
                });
            } 
            
            function iniciar(){
            var ano = 2017;
            
            criarAjax(ano);
            
        }
        
        
        </script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
            <div class="row titulo">
                <h1 class="text-center">Estatísticas</h1>
                <hr>
            </div>
            <div class="row">
                <div class="col-lg-1">
                    <h4 class="text-left">Ano</h4>
                </div>
                <div class="col-lg-2">
                    
                    <select class="form-control text-left" onchange="iniciar()">
                       <option>2017</option>
                       <option>2017</option>
		    </select>
                    
            
                </div>
            </div>
            <div class="row resultados">
               
                <div class="col-lg-4">
                                        
            <h4 class="text-capitalize text-left">Quantidade de vendas <span class="badge">${ano.total}</span></h4>
            <h4 class="text-capitalize text-left">aumento percentual relativo ao ano anterior</h4>
            <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: ${obj.percentual}%;">
                    ${obj.percentual}%
                </div>
            </div>
                </div>
                
            </div>
            <div class="row">
                 <c:forEach  items="${meses}" var="obj" >
                <div class="panel panel-default col-lg-4">
                    <div class="panel-body">
                        <h4 class="text-center text-capitalize mesNome" onclick="mes(${obj.mes})">${obj.nome}</h4>
                        <h4 class="text-center"><a><button type="button" class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="top" title="Mais detalhes"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button></a></h4>
                         <h5 class="text-capitalize text-left">Quantidade de vendas <span class="badge">${obj.total}</span></h5>
                         <h5 class="text-capitalize text-left">aumento percentual relativo a este mês no ano anterior</h5>
                         <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: ${obj.percentual}%;">
                                 ${obj.percentual}%
                            </div>
                         </div>
                         <h5 class="text-capitalize text-left">Produtos mais vendidos</h5>
                         <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width:  40%;">
                                ProdutoA
                             </div>
                         </div>
                         <div class="progress">
                            <div class="progress-bar-success" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width:  30%;">
                                ProdutoB
                             </div>
                         </div>
                         <div class="progress">
                            <div class="progress-bar-warning" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width:  15%;">
                                ProdutoC
                             </div>
                         </div>
                    
                    </div>
                </div>
            </c:forEach>
                
            </div>
        </div>
    </body>
</html>
