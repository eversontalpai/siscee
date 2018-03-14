/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.model.dao;

import br.com.ads.siscee.model.entidade.Encomenda;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import org.springframework.stereotype.Component;

/**
 *
 * @author Everson
 */
//@Component
public class EncomendaDAO extends DAO<Encomenda>{
    
      public List<Encomenda> consultarPorDia(Date dia){
        EntityManager em = getEM();
          
        List<Encomenda> lista;
       
        try {
            Query q = em.createNamedQuery("Encomenda.consultarPorDia");
            q.setParameter("dia",dia);
            System.out.println(dia);
            lista = q.getResultList();
           
        } catch (Exception e) {
            lista= new ArrayList();
            System.out.println(e);
        }finally{
            em.close();
        }
        
        return lista;
    }
      public List<Long> consultaAgrupada(){
        EntityManager em = getEM();
          
        List<Long> lista;
       
        try {
            Query q = em.createNamedQuery("Encomenda.consultasAgrupadas");
           
            lista = q.getResultList();
           
        } catch (Exception e) {
            lista= new ArrayList();
            System.out.println(e);
        }finally{
            em.close();
        }
        
        return lista;
    }
      
       public Long quantidadePorMes(int mes, int ano){
        EntityManager em = getEM();
         
         Long i= 0L;
        
        try {            
            StoredProcedureQuery q = em.createNamedStoredProcedureQuery("Encomenda.vendasMes");
            q.setParameter("mes",mes);
            q.setParameter("ano",ano);
            q.execute();
            
             i = (Long)q.getOutputParameterValue("resultado");
             
             
        } catch (Exception e) {
            System.out.println(e);
            
        }finally{
            em.close();
        }
        
       return i;
    }
       public Long quantidadePorMesT(int mes, int ano){
        EntityManager em = getEM();
         
         Long i= 0L;
        
        try {            
            Query q = em.createNamedQuery("Encomenda.consultarPorMes");
            q.setParameter("mes",mes);
            q.setParameter("ano",ano);
                                    
             i = (Long)q.getSingleResult();
             
             
        } catch (Exception e) {
            System.out.println(e);
            
        }finally{
            em.close();
        }
        
       return i;
    }
//       public Long quantidadePorMesProduto(int mes, int ano, int id){
//        EntityManager em = getEM();
//         
//         Long i= 0L;
//        
//        try {            
//            Query q = em.createNamedQuery("Encomenda.consultarProdutosMes");
//            q.setParameter("mes",mes);
//            q.setParameter("ano",ano);
//            q.setParameter("id",id);
//                                    
//             i = (Long)q.getSingleResult();
//             
//             
//        } catch (Exception e) {
//            System.out.println(e);
//            
//        }finally{
//            em.close();
//        }
//        
//       return i;
//    }
       public Long quantidadePorAno(int ano){
        EntityManager em = getEM();
         
         Long i= 0L;
        
        try {            
            StoredProcedureQuery q = em.createNamedStoredProcedureQuery("Encomenda.vendasAno");
            q.setParameter("ano",ano);
            q.execute();
            
             i = (Long)q.getOutputParameterValue("resultado");
             
             
        } catch (Exception e) {
            System.out.println(e);
            
        }finally{
            em.close();
        }
        
       return i;
    }
    
}
