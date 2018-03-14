/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.model.dao;

import br.com.ads.siscee.model.entidade.Produto;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.springframework.stereotype.Component;

/**
 *
 * @author Everson
 */
//@Component
public class ProdutoDAO extends DAO<Produto>{
    
     public List<Produto> consultarPorNome(String nome){
        EntityManager em = getEM();
        List<Produto> lista;
        try {
            Query q = em.createNamedQuery("Produto.consultarPorNome");
            q.setParameter("nome","%"+ nome +"%");
            lista = q.getResultList();
        } catch (Exception e) {
            lista= new ArrayList();
        }finally{
            em.close();
        }
        
        return lista;
    }
     
   
    
}
