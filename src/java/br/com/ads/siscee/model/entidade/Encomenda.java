/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ads.siscee.model.entidade;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Everson
 */

@Entity
@NamedQueries({
    @NamedQuery(name = "Encomenda.consultarPorDia",
            query = "SELECT e FROM Encomenda e WHERE e.dia=:dia ORDER BY e.hora"),
    @NamedQuery(name = "Encomenda.consultarPorMes",
            query = "SELECT COUNT(e) FROM Encomenda e WHERE FUNC('MONTH',e.dia)=:mes and FUNC('YEAR',e.dia)=:ano"),
//    @NamedQuery(name = "Encomenda.consultarProdutosMes",
//            query = "SELECT SUM(i.quantidade) FROM Encomenda e INNER JOIN E.itens i inner join i.produto p WHERE('MONTH',e.dia)=:mes and FUNC('YEAR',e.dia)=:ano and p.id= :id"),
    @NamedQuery(name = "Encomenda.consultasAgrupadas",
            query = "SELECT FUNC('Month', e.dia), COUNT(e.dia) FROM Encomenda e GROUP BY  FUNC('MONTH', e.dia), FUNC('YEAR', e.dia)")
    
})
@NamedStoredProcedureQueries({
@NamedStoredProcedureQuery(name = "Encomenda.vendasMes",
        procedureName = "vendas_mes",
        parameters = {
    @StoredProcedureParameter(mode = ParameterMode.IN, type = int.class, name = "mes"),
    @StoredProcedureParameter(mode = ParameterMode.IN, type = int.class, name = "ano"),
    @StoredProcedureParameter(mode = ParameterMode.OUT, type = int.class, name = "resultado")
        }),
@NamedStoredProcedureQuery(name = "Encomenda.vendasAno",
        procedureName = "vendas_ano",
        parameters = {
    @StoredProcedureParameter(mode = ParameterMode.IN, type = int.class, name = "ano"),
    @StoredProcedureParameter(mode = ParameterMode.OUT, type = int.class, name = "resultado")
        })
})
public class Encomenda implements EntidadeBase, Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    private Cliente cliente;
    @OneToMany
    @JoinTable(name = "encomenda_itens",
            joinColumns = @JoinColumn(name = "encomenda_id"),
            inverseJoinColumns = @JoinColumn(name = "itens_id"))
    private List<Itens> itens;
    @Temporal(TemporalType.DATE)
    private Date dia;
    @Temporal(TemporalType.TIME)
    private Date hora;
    private double valorTotal;
    @OneToOne
    private Endereco endereco;

    @Override
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public List<Itens> getItens() {
        return itens;
    }

    public void setItens(List<Itens> itens) {
        this.itens = itens;
    }

    public Date getDia() {
        return dia;
    }

    public void setDia(Date dia) {
        this.dia = dia;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
    
    
    
}
