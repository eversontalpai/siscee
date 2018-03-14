<%-- 
    Document   : encomenda
    Created on : 22/05/2017, 19:32:22
    Author     : Everson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="cabecalho.jsp" %>
        <script>
    function calcularEstoque() {
        var produtos = $(".produto");
        
      $(produtos).each(function(pos, produto) {       
        
            var $produto = $(produto);
            var quantity = parseInt($produto.find(".quantity").val());            
            var estoque = parseInt($produto.find(".estoque").text());
            estoque = estoque - quantity;
            $produto.find(".estoque").text(estoque);
        
        });
      
    }
    function quantidadeTotal() {
        var produtos = $(".produto");
        var total =0;
        
      $(produtos).each(function(pos, produto) {       
        
            var $produto = $(produto);
            var quantity = parseInt($produto.find(".quantity").val());            
            
            total += quantity;
        
        });
        
        return total;
      
    }
    function campo(){
         $(".produtos").append("<tr class='produto'>"+
 "<td><input type='checkbox' name='prod' class='prod' id='idSalgado' checked></td>"+
                    "<td class='nomeSalgado'></td>"+
                    "<td><input type='text' name='quantidade' class='span1 quantity' value='0' onchange='calculaPreco()'></td></tr>");
    }
     
        function escolher(nome, id){
            
           campo();
       
            $(".nomeSalgado").text(nome);
            $("#idSalgado").val(id);
           $("#myModal").modal('toggle');
        }   
        
        
       function checar(){
           
          camposMarcados = new Array();
            $("input:checked").each(function(){
           // console.log($(this).attr("id"));
            camposMarcados.push($(this).attr("id"));
            
                
            });
            console.log(camposMarcados);
            $(".ids").val(camposMarcados);
            
         
           
         }
         
         function calculaPreco(){
             var total = quantidadeTotal();
             var soma;
             
                     soma = total * 0.36;
                     $("#valor").val(soma);
                
         }
    
        
       
            
        
    
</script>
       
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="container">
            <div class="row titulo">
                <h1 class="text-center">Encomenda</h1>
                <hr>
            </div>
            <div class="row">
                <form action="editarEncomenda" method="POST">

        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-1">
                <h4>Dia <input type="text" name="dia" value="<fmt:formatDate type="date" value="${encomenda.dia}"/>"/></h4>
                
                
            </div>
        </div>
        <div class="row">            
           <div class="form-group col-lg-4 col-lg-offset-1">
                <label>Hora</label>
                <input type="text" class="form-control" name="hora" value="<fmt:formatDate type="time" value="${encomenda.hora}"/>">
            </div>
                  
            <div class="form-group col-lg-4 col-lg-offset-1">
             <label>Cliente</label> 
             <div class="contato">
                 <input type='text' name='cli' class='form-control cli' value="${encomenda.cliente.nome}" readonly=""><input type='hidden' name='idCli' id='idCli'>
             </div>
            
               
            
            
            </div>
                <table class="table table-striped">
                <thead>                    
                <th></th>
                <th>Salgado</th>
                <th>Quantidade</th>
                

                </thead>
                <tbody class="produtos">
                    <c:forEach  items="${encomenda.itens}" var="salgado" >
                        <tr class="produto">

                            <td><input type="checkbox" name="prod" class="prod" id="${salgado.id}" checked></td>
                    <td>${salgado.produto.nome}</td>
                    <td><input type="text" name="quantidade" class="span1 quantity" value="${salgado.quantidade}" onchange="calculaPreco()"></td>
                    
                    
                    


                        </tr>
                    </c:forEach>
                        
                </tbody>
            </table>
              <a class="btn btn-primary btnContato"  data-toggle="modal" data-target="#myModal">Adicionar Salgado</a>
            
             <p class="text-right">Valor Total: <input type="text" name="valor" id="valor" readonly value="${encomenda.valorTotal}"></p>
             
        
                <hr>
          <div class="row">            
           <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Entregar em um endereço diferente?</label>
            </div>
          </div>
        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-1">
                <label>Endereço</label>
                <input type="text" name="rua" class="form-control" value="${encomenda.endereco.rua}">
            </div>
                 
            <div class="form-group col-lg-2">
                <label>nº</label>
                <input type="text" name="numero" class="form-control" value="${encomenda.endereco.numero}">
            </div>
                    
           <div class="form-group col-lg-4 col-lg-offset-1">
                <label>Complemento</label>
                <input type="text" name="complemento" class="form-control" value="${encomenda.endereco.complemento}">
            </div>
        </div>
        <div class="row">            
           <div class="form-group col-lg-4 col-lg-offset-1">
                <label>Bairro</label>
                <input type="text" name="bairro" class="form-control" value="${encomenda.endereco.bairro}">
            </div>
                   
            <div class="form-group col-lg-4">
                <label>Cidade</label>
                <input type="text" name="cidade" class="form-control" required="" value="${encomenda.endereco.cidade}">
            </div>
        </div>
       
        <div class="row">             
            <div class="form-group col-lg-1 col-lg-offset-4">
                
                <input type="hidden" class="ids" name="idProdutos">  
                
                <input type="submit" class="btn btn-success text-center" onclick="checar()" value="Enviar">  
            </div>
              <div class="form-group span1">
                  <a href="r?page=home"> <input type="button" class="btn btn-danger text-center" value="Cancelar"></a>  
            </div>
        </div>
                 <c:if test="${retorno}">
                          ${retorno}
                      </c:if>
        
        </div>
                </form>
        </div>
        </div>
                 <!-- Modal -->                
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Adicionar salgado</h4>
                            </div>
                            <div class="modal-body">
                               
                            <c:forEach items="${estoque}" var="cliente">
                                <h3 onclick="escolher('${cliente.nome}',${cliente.id})">${cliente.nome}</h3>
			    </c:forEach>

                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                
                            </div>
                        </div>
                    </div>
                </div>
                
    </body>
</html>
