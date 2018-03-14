/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.controller;

import br.com.ads.siscee.model.dao.ClienteDAO;
import br.com.ads.siscee.model.dao.DAO;
import br.com.ads.siscee.model.dao.EncomendaDAO;
import br.com.ads.siscee.model.dao.ProdutoDAO;
import br.com.ads.siscee.model.dao.UsuarioDAO;
import br.com.ads.siscee.model.entidade.Cliente;
import br.com.ads.siscee.model.entidade.Encomenda;
import br.com.ads.siscee.model.entidade.Endereco;
import br.com.ads.siscee.model.entidade.Estatisticas;
import br.com.ads.siscee.model.entidade.Itens;
import br.com.ads.siscee.model.entidade.Produto;
import br.com.ads.siscee.model.entidade.Telefone;
import br.com.ads.siscee.model.entidade.Usuario;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Everson
 */
@Controller
public class SisceeController {
//    @Autowired
//    DAO dao;
//    @Autowired
//    EncomendaDAO encomendaDao;
//    @Autowired
//    ClienteDAO clienteDao;
//    @Autowired
//    ProdutoDAO produtoDao;
//    @Autowired
//    UsuarioDAO usuarioDao;
//    
    
     @RequestMapping("index")
    public String index(){
        
        return "index";
    }
     @RequestMapping("/r")
    public String redirect(String page){
        
        return page;
    }
    
    @RequestMapping("/cadastrarProduto")
    public String criarProduto(Produto p, Model model){
        ProdutoDAO produtoDao = new ProdutoDAO();            
               
        String retorno = produtoDao.inserir(p);
        
        model.addAttribute("retorno", retorno);
        
        
        return "cadastro-produto";
    }
     @RequestMapping("/cadastrarCliente")
    public String criarCliente(Cliente cliente , Telefone telefone, Endereco end, Model model){
        DAO dao = new ClienteDAO();                   
        List<Telefone> telefones = new ArrayList<Telefone>();
        String[] tel = telefone.getNumeroTelefone().split(",");
        Telefone t;
        for(String numTel : tel){
            t = new Telefone();
            t.setNumeroTelefone(numTel);
            dao.inserir(t);
            telefones.add(t);
        }
               
        String resposta1 = dao.inserir(end);
        //String resposta2 = dao.inserir(telefone);
        cliente.setEndereco(end);
        cliente.setTelefones(telefones);
        
        
        String resposta3 = dao.inserir(cliente);
        
        end.setCliente(cliente);
        
        String resposta4= dao.editar(end);
       
        
        
        String retorno = "Cliente: "+ resposta3+"<br>"
        + "Endereço: "+resposta1+"<br>";
               // +"Telefone: "+resposta2;
        
         model.addAttribute("retorno", retorno);
        
        return "cadastro-cliente";
    }
    
    @RequestMapping("/enviarCliente")
    public  String enviarCliente(HttpSession session, int id){
        ClienteDAO clienteDao = new ClienteDAO();       
        
        Cliente  cliente = clienteDao.buscarPorId(Cliente.class, id);
        
        session.setAttribute("cliente", cliente);
        
       return "editar-cliente";
    }
    @RequestMapping("/enviarEncomenda")
    public  String enviarEncomenda(HttpSession session, int id){
        DAO dao = new DAO();       
        
        Encomenda  encomenda = (Encomenda)dao.buscarPorId(Encomenda.class, id);
         List<Produto> estoque = (List<Produto>) dao.buscarTodos(Produto.class);
        
        session.setAttribute("encomenda", encomenda);
        session.setAttribute("estoque", estoque);
        
       return "editar-encomenda";
    }
    
     @RequestMapping("/editarCliente")     
    public String editarCliente(Cliente cliente , Endereco end, Telefone telefone, Model model, HttpSession session){
        DAO dao = new ClienteDAO();                   
               
        Cliente c = (Cliente) session.getAttribute("cliente");
        
        List<Telefone> telefones = new ArrayList<Telefone>();
        String[] tel = telefone.getNumeroTelefone().split(",");
        Telefone t;
        for(String numTel : tel){
            t = new Telefone();
            t.setNumeroTelefone(numTel);
            t.setCliente(c);
            dao.inserir(t);
            telefones.add(t);
        }
        
        cliente.setTelefones(telefones);
        cliente.setEndereco(end);
        cliente.setId(c.getId());
        end.setId(c.getEndereco().getId());
        
        String resposta1 = dao.editar(end);
        
        String resposta2 = dao.editar(cliente);
        
        String retorno = "Cliente: "+ resposta2+"<br>"
        + "Endereço: "+resposta1;
        
         model.addAttribute("retorno", retorno);
        session.removeAttribute("cliente");
         
        return exibirClientes(model);
    }
    
    @RequestMapping("/estoque")
    public String exibirEstoque(Model model){
          DAO dao = new DAO();
          List<Produto> estoque =  dao.buscarTodos(Produto.class);
          model.addAttribute("resposta", estoque);
         return "estoque";
    }
    @RequestMapping("/aumentarEstoque")
    public String aumentarEstoque(int quantidade, int idProd, Model model){
         DAO dao = new DAO();
          Produto p = (Produto) dao.buscarPorId(Produto.class, idProd);
          
          int antes = p.getQuantidadeEstoque();
          
          p.setQuantidadeEstoque(antes+quantidade);
          
          dao.editar(p);
          
         return exibirEstoque(model);
    }
    
    @RequestMapping("/verificarDia")
    public String verificarDia(HttpSession session, String dia, Model model){
              EncomendaDAO encomendaDao = new EncomendaDAO();
          String[] split = dia.split("-");
             String diaFmt = split[2]+"/"+split[1]+"/"+split[0]; 
          session.setAttribute("dia", diaFmt);
           SimpleDateFormat df =  new SimpleDateFormat("dd/MM/yyyy");
           try {
               List<Encomenda> encomendas = encomendaDao.consultarPorDia(df.parse(diaFmt));
               
               model.addAttribute("resposta", encomendas);
            
        } catch (Exception e) {
        }
          
         return "agenda";
    }
    @RequestMapping("/encomenda")
    public String encomenda(HttpSession session){
           DAO dao = new DAO();
          List<Produto> estoque = (List<Produto>) dao.buscarTodos(Produto.class);  
          
         List<Cliente> clientes = (List<Cliente>) dao.buscarTodos(Cliente.class);
         
         session.setAttribute("salgados", estoque);
         session.setAttribute("clientes", clientes);
          
         return "encomenda";
    }
    
     @RequestMapping("/exibirClientes")
    public String exibirClientes(Model model){
         DAO dao = new DAO();
         List<Cliente> clientes = (List<Cliente>) dao.buscarTodos(Cliente.class);
          model.addAttribute("resposta", clientes);
         return "exibir-clientes";
    }
    @RequestMapping("/excluirClientes")
    public String excluirClientes(Model model, int id){
         ClienteDAO dao = new ClienteDAO();
         String resposta = dao.deletar(Cliente.class, id);
         model.addAttribute("retorno",resposta);
         return exibirClientes(model);
    }
    @RequestMapping("/excluirEncomenda")
    public String excluirEncomenda(Model model, int id, HttpSession session){
         DAO dao = new DAO();
         SimpleDateFormat dtfmt = new SimpleDateFormat("yyyy-MM-dd");
         Encomenda e = (Encomenda)dao.buscarPorId(Encomenda.class, id);
         String dt = dtfmt.format(e.getDia());
         for(Itens it : e.getItens()){
         dao.deletar(Itens.class, it.getId());
                 }
         String resposta = dao.deletar(Encomenda.class, id);
         model.addAttribute("retorno",resposta);
         return verificarDia(session, dt, model);
    }
    
    @RequestMapping("/cadastrarEncomenda")
    public String cadastrarEncomenda(Model model, String hora, String idProdutos,String valor, String quantidade, String idCli, HttpSession session, Endereco endereco){
         DAO dao = new DAO();
         List<Itens> itens = new ArrayList<Itens>();
         String[] items = idProdutos.split(",");
         String[] quantidades = quantidade.split(",");
         int i = 0;
         Produto p;
         Itens item;
            for(String prod : items){
                if(!prod.equals("")){
                item = new Itens();
                p = (Produto) dao.buscarPorId(Produto.class, Integer.parseInt(prod));
                item.setProduto(p);
                if(Integer.parseInt(quantidades[i])==0){
                    i++;
                }else{
                item.setQuantidade(Integer.parseInt(quantidades[i]));
                int estoque = p.getQuantidadeEstoque();
                int total = estoque-Integer.parseInt(quantidades[i]);
                p.setQuantidadeEstoque(total);
                dao.editar(p);
                }
                item.setValor(Double.parseDouble(valor));                
                dao.inserir(item);
                itens.add(item);
                
                i++;
                }
        }
         String dia = (String) session.getAttribute("dia");
         SimpleDateFormat df =  new SimpleDateFormat("dd/MM/yyyy");
         SimpleDateFormat tf = new SimpleDateFormat("hh:mm");
         String resposta;
         Encomenda encomenda = new Encomenda();
         try{
         encomenda.setDia(df.parse(dia));
         encomenda.setHora(tf.parse(hora));
         Cliente c = (Cliente) dao.buscarPorId(Cliente.class, Integer.parseInt(idCli));
         encomenda.setCliente(c);
         encomenda.setItens(itens);
         dao.inserir(endereco);
         encomenda.setEndereco(endereco);
         encomenda.setValorTotal(Double.parseDouble(valor));
         
         resposta = dao.inserir(encomenda);
         
         }catch(Exception e){
             resposta = "Deu ruim "+e;
         }

        session.removeAttribute("dia");
          model.addAttribute("retorno",resposta);
         
         
         return "agenda";
    }
    @RequestMapping("/editarEncomenda")
    public String editarEncomenda(Model model,String dia, String hora, String idProdutos,String valor, String quantidade, String idCli, HttpSession session, Endereco endereco){
         DAO dao = new DAO();
         List<Itens> itens = new ArrayList<Itens>();
         String[] items = idProdutos.split(",");
         String[] quantidades = quantidade.split(",");
         int i = 0;
         Produto p;
         Itens item;
            for(String prod : items){
                if(!prod.equals("")){
                item = new Itens();
                p = (Produto) dao.buscarPorId(Produto.class, Integer.parseInt(prod));
                item.setProduto(p);
                item.setQuantidade(Integer.parseInt(quantidades[i]));
                int estoque = p.getQuantidadeEstoque();
                int total = estoque-Integer.parseInt(quantidades[i]);
                p.setQuantidadeEstoque(total);
                dao.editar(p);                
                item.setValor(Double.parseDouble(valor));                
                dao.inserir(item);
                itens.add(item);
                
                i++;
                }
        }
         
         SimpleDateFormat df =  new SimpleDateFormat("dd/MM/yyyy");
         SimpleDateFormat tf = new SimpleDateFormat("hh:mm");
         String resposta;
         Encomenda encomenda = (Encomenda) session.getAttribute("encomenda");
         try{
         encomenda.setDia(df.parse(dia));
         encomenda.setHora(tf.parse(hora));
         
         Cliente c = (Cliente) dao.buscarPorId(Cliente.class, Integer.parseInt(idCli));         
         dao.inserir(endereco);
         encomenda.setEndereco(endereco);
         encomenda.setCliente(c);
         encomenda.setItens(itens);
         encomenda.setValorTotal(Double.parseDouble(valor));
         
         resposta = dao.editar(encomenda);
         
         }catch(Exception e){
             resposta = "Deu ruim "+e;
         }

        session.removeAttribute("dia");
          model.addAttribute("retorno",resposta);
         
         
         return "agenda";
    }
    
   @RequestMapping("/estatistica")
   public String estatistica(Model model){
     
       return buscarAno(2017, model);
   }
    
   @RequestMapping("/buscarAno")
   public String buscarAno(int ano, Model model){
       Estatisticas e;
       List<Estatisticas> meses = new ArrayList<Estatisticas>();
       
       for (int i = 1; i < 13; i++) {
           e = new Estatisticas(ano, i);
           meses.add(e);
           
       }
       
       e = new Estatisticas(ano);
       
       model.addAttribute("meses", meses);
       model.addAttribute("ano", e);
       
       return "estatisticas_1";
   }
   
   @RequestMapping("/entrar")
    public String entrar(HttpSession session, String login, String senha, Model model) {
        String page = "index";
        String retorno = null;
        Usuario user;
        UsuarioDAO dao = new UsuarioDAO();
        user = dao.pegarUsuario(login);
        try {
            if (user.getSenha().equals(senha)) {
                page = "home";

                session.setAttribute("usuario", user);
            } else{
                  retorno="Falha de Autenticação";   
            }

        } catch (NullPointerException nex) {
           
             retorno="Falha de Autenticação";   
         
        }
         model.addAttribute("retorno", retorno);
        
        return page;
    }

    @RequestMapping("/sair")
    public String sair(HttpSession session) {
        session.invalidate();

        return "index";
    }

}
