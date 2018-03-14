/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.model.entidade;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author Everson
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Produto.consultarPorNome",
            query = "SELECT p FROM Produto p WHERE p.nome LIKE :nome ORDER BY p.nome")
})
public class Produto implements EntidadeBase, Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private String nome;
    @Column(name = "Quantidade_Estoque", nullable = false)
    private int quantidadeEstoque;
    @Column(name = "Valor_Cento", nullable = false)
    private double valorCento;

    @Override
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome.toUpperCase();
    }

    public int getQuantidadeEstoque() {
        return quantidadeEstoque;
    }

    public void setQuantidadeEstoque(int quantidadeEstoque) {
        this.quantidadeEstoque = quantidadeEstoque;
    }

    public double getValorCento() {
        return valorCento;
    }

    public void setValorCento(double valorCento) {
        this.valorCento = valorCento;
    }
    
    
    
    
}
