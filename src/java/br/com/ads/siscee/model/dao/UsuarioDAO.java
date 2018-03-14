/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.model.dao;

import br.com.ads.siscee.model.entidade.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.springframework.stereotype.Component;

/**
 *
 * @author Everson
 */
//@Component
public class UsuarioDAO extends DAO<Usuario>{
    
    public Usuario pegarUsuario(String login){
        EntityManager em = getEM();
        Usuario u;
        try {
            Query q = em.createNamedQuery("Usuario.PegaUsuario");
            q.setParameter("login", login);
            u = (Usuario)q.getSingleResult();
            
        } catch (Exception e) {
            u = new Usuario();
        }finally{
            em.close();
        }
        
        return u;
    }
    
}