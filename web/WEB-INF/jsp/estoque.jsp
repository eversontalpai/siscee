<%-- 
    Document   : estoque
    Created on : 21/05/2017, 16:41:30
    Author     : Everson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
        <script>
            function pegarId(id) {
                $('.idProd').val(id);
                return id;
            }
        </script>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
            <div class="row titulo">
                <h1 class="text-center">Estoque</h1>
                <hr>
            </div>
            <div class="row">
                <div class="col-lg-11 col-lg-offset-1" >
                    <c:if test="${not empty resposta}">

                        <table class="table table-striped">
                            <thead>

                            <th>Salgado</th>
                            <th>Quantidade em Estoque</th>
                            <th></th>

                            </thead>
                            <tbody>
                                <c:forEach  items="${resposta}" var="salgado" >
                                    <tr>



                                        <td>${salgado.nome}</td>
                                        <td>${salgado.quantidadeEstoque}</td>
                                        <td> <button type="button" class="btn btn-primary btn-sm" onclick="pegarId(${salgado.id})" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span></button></td>


                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="form-group col-lg-1">
                            <a href="r?page=home"> <input type="button" class="btn btn-danger text-center" value="Voltar"></a>  
                        </div>

                    </c:if>
                </div>
                <div class="row">
                    <c:if test="${empty resposta}">

                        <h3 class="text-center text-danger">Não há produtos no estoque</h3>




                    </c:if>
                </div>


                <!-- Modal -->
                <form action="aumentarEstoque" method="POST">
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Adicionar salgado</h4>
                            </div>
                            <div class="modal-body">
                                <input type="number" name="quantidade" class="span1" min="0">
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="idProd" class="span1 idProd" >
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                <button type="submit" class="btn btn-primary">Salvar</button>
                            </div>
                        </div>
                    </div>
                </div>
                </form>

            </div>
        </div>
    </body>
</html>
