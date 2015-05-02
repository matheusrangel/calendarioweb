package br.edu.ifpb.calendario.dao;

import javax.persistence.EntityManager;

import br.edu.ifpb.calendario.models.Usuario;

public class UsuarioDAO extends GenericDAO<Usuario> {

	public UsuarioDAO(EntityManager entityManager) {
		super();
	}

}
