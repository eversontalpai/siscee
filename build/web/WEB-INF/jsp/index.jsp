<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="cabecalho.jsp" %>

    </head>
    <body>

        <div class="container">
            <div class="row">

                <div class="quadro col-sm-6 col-sm-offset-3 panel panel-default">
                    <div class="panel-body">
                        <form class="form-horizontal" action="entrar" method="POST">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Usuario</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="login">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Senha</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="senha">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary ">Entrar</button>
                                </div>
                            </div>
                              <c:if test="${not empty retorno}">
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                
                <h4 class="text-center">${retorno}</h4>  
               
            </div>
            </c:if>
                        </form>
                    </div>
                </div>
            </div>



        </div>
    </body>
</html>
