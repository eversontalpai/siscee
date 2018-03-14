<%-- 
    Document   : menu
    Created on : 21/05/2017, 11:17:43
    Author     : Everson
--%>

<ul class="nav nav-pills">
  <li role="presentation" class="active"><a href="r?page=home">Início</a></li>
   <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true">
      Clientes <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">       
        <li role="presentation"><a href="r?page=cadastro-cliente">Cadastrar</a></li>
         <li role="presentation"><a href="exibirClientes">Lista</a></li>
    </ul>
   </li>
   <li role="presentation" class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true">
      Produtos <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">       
        <li role="presentation"><a href="r?page=cadastro-produto">Cadastrar</a></li>
         <li role="presentation"><a href="estoque">Estoque</a></li>
    </ul>
   </li>
  <li role="presentation"><a href="r?page=agenda">Agenda</a></li>
  <li role="presentation"><a href="estatistica">Estatísticas</a></li>
  <li role="presentation"><a href="sair">Sair</a></li>
  
</ul>