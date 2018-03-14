/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.testes;

import br.com.ads.siscee.model.dao.EncomendaDAO;

/**
 *
 * @author Everson
 */
public class Teste {
    public static void main(String[] args){
       EncomendaDAO dao = new EncomendaDAO();
        
   //     System.out.println(dao.quantidadePorMesProduto(6, 2017, 31));
//        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
//        try {
//            Date dia = df.parse("09/05/2017");
//             for(Encomenda e : dao.consultarPorDia(dia)){
//            System.out.println(e.getCliente().getNome());
//            System.out.println("foi");
//        }
//        } catch (Exception e) {
//            System.out.println("deu ruim");
//        }
        
//        System.out.println(calculoPercentual(0, 400));

//
//        List<Long> lista = dao.consultaAgrupada();
//        String[] objetos = lista.toString().split(",");
//       Long l;
//        for (Object integer : lista) {
//            l = (Long) integer;
//            System.out.println(l);
//        
//        }
    
//            Estatisticas estatisticas = new Estatisticas(2017,05);
//            
//            System.out.println(estatisticas.getMes());
//            System.out.println(estatisticas.getTotal());
//            System.out.println(estatisticas.getPercentual()+"%");
        
//        String idProd = "3,8";
//        String quantidade = "100,100";
//      Encomenda enco =  cadastrarEncomenda("15:00", idProd, "30", quantidade, "4", "03/06/2017");
//
//        System.out.println("DIA: "+enco.getDia());
//        System.out.println("Hora: "+enco.getHora());
//        System.out.println("Cliente: "+enco.getCliente().getNome());
//        for(Itens ite: enco.getItens()){
//            System.out.println("Nome produto:"+ite.getProduto().getNome());
//            System.out.println("estoque produto:"+ite.getProduto().getQuantidadeEstoque());
//            System.out.println("Quantidade pedida: "+ite.getQuantidade());
//        }
//      

//    DAO dao = new DAO();
//    
//    Usuario user = new Usuario();
//    
//    user.setLogin("adm");
//    user.setSenha("123456");
    
//    Produto p;
//    
//        for (int i = 0; i < 10; i++) {
//            p = new Produto();
//            p.setNome("produto "+i);
//            p.setQuantidadeEstoque(200);
//            p.setValorCento(36);
//            System.out.println(dao.inserir(p));
//            
//        }
//        
//        Cliente c;
//        ArrayList<Telefone> telefones = new ArrayList<Telefone>();
//        Telefone t;
//        Endereco e;
//        for (int i = 0; i < 10; i++) {
//            c = new Cliente();
//            c.setNome("cliente "+i);                     
//            
//            e = new Endereco();
//            e.setRua("rua "+i);
//            e.setNumero("10"+i);
//            e.setComplemento("casa");
//            e.setBairro("teste");
//            e.setCidade("São José dos campos");
//            
//            dao.inserir(e);
//            
//            c.setEndereco(e);
//            
//            System.out.println(dao.inserir(c));
//            
//            for (int j = 0; j < 3; j++) {
//                t = new Telefone();
//            t.setNumeroTelefone("234567654"+j);
//            t.setCliente(c);
//            telefones.add(t);
//            
//            }             
//            c.setTelefones(telefones);
//            
//        }
//    
//        System.out.println(dao.inserir(user));
    }

}
