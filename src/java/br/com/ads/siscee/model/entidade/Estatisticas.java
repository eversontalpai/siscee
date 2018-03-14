/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.model.entidade;

import br.com.ads.siscee.model.dao.EncomendaDAO;

/**
 *
 * @author Everson
 */
public class Estatisticas {
    private Long total;
    private double percentual;
    private int ano;
    private int mes;
    private String nome;
    private EncomendaDAO encomendaDao;

    public Estatisticas(int ano) {
        this.ano = ano;
        encomendaDao = new EncomendaDAO();
        setTotal();
        setPercentual();
    }
    public Estatisticas(int ano, int mes) {
        this.ano = ano;
        this.mes = mes;
        encomendaDao = new EncomendaDAO();
        setTotalMes();
        setPercentualMes();
        setNome();
    }

    public int getAno() {
        return ano;
    }  

    public Long getTotal() {
        return total;
    }

    private void setTotal() {
       total = encomendaDao.quantidadePorAno(ano);
       
    }
    private void setTotalMes() {
       total = encomendaDao.quantidadePorMes(mes,ano);
       
    }

    public double getPercentual() {
        return percentual;
    }

    private void setPercentual() {
        percentual = calculoPercentual(encomendaDao.quantidadePorAno(ano-1), total);
    }
    private void setPercentualMes() {
        percentual = calculoPercentual(encomendaDao.quantidadePorMes(mes,ano-1), total);
    }
    public double calculoPercentual(double valorInicial, double  valorFinal){
        double resultado, diferenca, porcentagem;
        if(valorInicial != 0){
            
        diferenca = valorFinal-valorInicial;
        resultado = (diferenca/valorInicial);
        } else{
            resultado = valorFinal;
        }
        
        porcentagem = resultado*100;
        return porcentagem;
    }

    public int getMes() {
        return mes;
    }

    public String getNome() {
        return nome;
    }

    public void setNome() {
        switch(mes){
            case 1:
            this.nome = "janeiro";
            break;
            case 2:
            this.nome = "fevereiro";
            break;
            case 3:
            this.nome = "março";
            break;
            case 4:
            this.nome = "abril";
            break;
            case 5:
            this.nome = "maio";
            break;
            case 6:
            this.nome = "junho";
            break;
            case 7:
            this.nome = "julho";
            break;
            case 8:
            this.nome = "agosto";
            break;
            case 9:
            this.nome = "setembro";
            break;
            case 10:
            this.nome = "outubro";
            break;
            case 11:
            this.nome = "novembro";
            break;
            case 12:
            this.nome = "dezembro";
            break;
            default:
                this.nome = "outro";
                break;
        }
        
    }

    public EncomendaDAO getEncomendaDao() {
        return encomendaDao;
    }

    public void setEncomendaDao(EncomendaDAO encomendaDao) {
        this.encomendaDao = encomendaDao;
    }

    
    
    
}
