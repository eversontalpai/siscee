<%-- 
    Document   : encomenda
    Created on : 22/05/2017, 19:32:22
    Author     : Everson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
         $(".contato").html("");
         $(".endereco").html("");           
         $(".contato").append("<input type='text' name='cli' class='form-control cli'><input type='hidden' name='idCli' id='idCli'>");
         $(".endereco").append("<div class='row'>"+           
            "<div class='form-group col-lg-4 col-lg-offset-1'>"+
                "<label>Endereço</label>"+
                "<input type='text' name='rua' id='rua' class='form-control'>"+
            "</div>"+                 
            "<div class='form-group col-lg-2'>"+
                "<label>nº</label>"+
                "<input type='text' name='numero' id='numero' class='form-control'>"+
            "</div>"+                    
           "<div class='form-group col-lg-4 col-lg-offset-1'>"+
                "<label>Complemento</label>"+
                "<input type='text' name='complemento' id='complemento' class='form-control'>"+
            "</div>"+
        "</div>"+
        "<div class='row'>"+            
           "<div class='form-group col-lg-4 col-lg-offset-1'>"+
                "<label>Bairro</label>"+
                "<input type='text' name='bairro' id='bairro' class='form-control'>"+
            "</div>"+                   
            "<div class='form-group col-lg-4'>"+
                "<label>Cidade</label>"+
                "<input type='text' name='cidade' class='form-control' required='' id='cidade' value='SAO JOSE DOS CAMPOS'>"+
            "</div>"+
        "</div>");
    }
     
        function escolher(nome, id, rua, numero, complemento, bairro, cidade){
            
           campo();
       
            $(".cli").val(nome);
            $("#idCli").val(id);
            $("#rua").val(rua);
            $("#numero").val(numero);
            $("#complemento").val(complemento);
            $("#bairro").val(bairro);
            $("#cidade").val(cidade);
            
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
                <form action="cadastrarEncomenda" method="POST">

        <div class="row">            
            <div class="form-group col-lg-4 col-lg-offset-1">
                <h4>Dia ${dia}</h4>
                
                
            </div>
        </div>
        <div class="row">            
           <div class="form-group col-lg-4 col-lg-offset-1">
                <label>Hora</label>
                <input type="text" class="form-control" name="hora">
            </div>
                  
            <div class="form-group col-lg-4 col-lg-offset-1">
             <label>Cliente</label> 
             <div class="contato"></div>
            
                <a class="btn btn-primary btnContato"  data-toggle="modal" data-target="#myModal">Escolher</a>
            
            
            </div>
                <table class="table table-striped">
                <thead>                    
                <th></th>
                <th>Salgado</th>
                <th>Quantidade</th>
                <th>Disponível</th>

                </thead>
                <tbody>
                    <c:forEach  items="${salgados}" var="salgado" >
                        <tr class="produto">

                            <td><input type="checkbox" name="prod" class="prod" id="${salgado.id}" ></td>
                    <td>${salgado.nome}</td>
                    <td><input type="text" name="quantidade" class="span1 quantity" value="0" onchange="calculaPreco()"></td>
                    <td class="estoque">${salgado.quantidadeEstoque}</td>
                    
                    


                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <p class="text-right"><a class="btn btn-primary" onclick="calcularEstoque()">Calcular Estoque</a></p>
            <p class="text-right">Valor Total: <input type="text" name="valor" id="valor" readonly></p>
             
        
                <hr>
          <div class="row">            
           <div class="form-group col-lg-4 col-lg-offset-4">
                <label>Entregar em um endereço diferente?</label>
            </div>
          </div>
                <div class="endereco">
      
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
        </div>
        </div>
                 <!-- Modal -->                
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Escolher Cliente</h4>
                            </div>
                            <div class="modal-body">
                               
                            <c:forEach items="${clientes}" var="cliente">
                                <h3 onclick="escolher('${cliente.nome}',${cliente.id},'${cliente.endereco.rua}', '${cliente.endereco.numero}','${cliente.endereco.complemento}','${cliente.endereco.bairro}','${cliente.endereco.cidade}')">${cliente.nome}</h3>
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
