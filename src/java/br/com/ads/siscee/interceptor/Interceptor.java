/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.interceptor;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Everson
 */
public class Interceptor extends HandlerInterceptorAdapter{
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)throws Exception{
         String uri = request.getRequestURI();
         if(uri.endsWith("entrar")|| 
                uri.endsWith("index")||               
                uri.contains("resources")||
                uri.contains("sair")){
            return true;
        }
          if((request.getSession().getAttribute("usuario")!= null)){
            return true;
        }
        
        
        response.sendRedirect("index");
        return false;
    }
    
}
