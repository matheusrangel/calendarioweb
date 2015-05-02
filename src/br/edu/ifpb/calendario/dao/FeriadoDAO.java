package br.edu.ifpb.calendario.dao;

import javax.persistence.EntityManager;

import br.edu.ifpb.calendario.models.Feriado;

public class FeriadoDAO extends GenericDAO<Feriado> {

	public FeriadoDAO(EntityManager entityManager) {
		super();
	}

}
