/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.model.dao;

import br.com.ads.siscee.model.entidade.EntidadeBase;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import org.springframework.stereotype.Component;

/**
 *
 * @author Everson
 * @param <T>
 */
//@Component
public class DAO <T extends EntidadeBase>{
    
    public EntityManager getEM(){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("SISCEEPU");
        return factory.createEntityManager();
    }
    
    public String inserir(T t){
        String retorno;
        
        EntityManager em = getEM();
        
        try{
            em.getTransaction().begin();
            em.persist(t);
            em.getTransaction().commit();
            retorno = "Salvo com Sucesso";
        
        }catch(Exception e){
        retorno = "Falha ao salvar\n"
                + "Motivo: "+e;    
        }finally{
            em.close();
        }
        
        
        return retorno;
    }
    
    public String editar(T t){
     String retorno = null;
     EntityManager em = getEM();
     
     try{
         em.getTransaction().begin();
         if(!em.contains(t)){
              if(em.find(t.getClass(), t.getId())== null){
                    retorno ="Erro ao atualizar";
                }else{
                 em.merge(t);
                  retorno = "Atualizado com Sucesso!!!";
                }
         }
         em.getTransaction().commit();
         
     }catch(Exception e){
         retorno = "Falha ao editar\n"
                + "Motivo: "+e;  
     }finally{
         em.close();
     }
     
     
     return retorno;
    }
    
     public String deletar(Class<T> classe, int id){
         EntityManager em = getEM();
        String retorno = null;
        T t = em.find(classe, id);
         try {
            em.getTransaction().begin();
            em.remove(t);
            em.getTransaction().commit();
            retorno = "Excluído com Sucesso!!!";

        } catch (Exception e) {
            retorno = "Falha ao Excluir pela Exceceção: " + e;
        } finally {
            em.close();
        }
        
        return retorno;
    }
     
     public T buscarPorId(Class<T> classe, int id){
         EntityManager em = getEM();
        T t = null;
        try{
           t = em.find(classe, id);        
        }finally{
            em.close();
            
        }
        return t;
    }
       public List<T> buscarTodos(Class classe){
         EntityManager em = getEM();
         
         CriteriaQuery criteria = em.getCriteriaBuilder().createQuery();
         criteria.select(criteria.from(classe));
         List<T> lista = em.createQuery(criteria).getResultList();
         
         
         return lista;
     }
    
    
}
