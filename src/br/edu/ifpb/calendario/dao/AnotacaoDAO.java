package br.edu.ifpb.calendario.dao;

import java.util.List;

import br.edu.ifpb.calendario.models.Anotacao;
import br.edu.ifpb.calendario.models.Usuario;

public class AnotacaoDAO extends GenericDAO<Anotacao> {

	public AnotacaoDAO() {
		super();
	}
	
	public List<Anotacao> findAll() {
		return findAll(Anotacao.class);
	}

	public Anotacao findById(Long id) {
		return super.findByField(Anotacao.class, "id", id);
	}

}
