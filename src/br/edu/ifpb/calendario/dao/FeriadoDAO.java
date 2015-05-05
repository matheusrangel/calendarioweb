package br.edu.ifpb.calendario.dao;

import java.util.List;

import br.edu.ifpb.calendario.models.Feriado;

public class FeriadoDAO extends GenericDAO<Feriado> {

	public FeriadoDAO() {
		super();
	}
	
	public List<Feriado> findAll() {
		return findAll(Feriado.class);
	}

	public Feriado findById(Long id) {
		return super.findByField(Feriado.class, "id", id);
	}

}

