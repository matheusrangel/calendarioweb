package br.edu.ifpb.calendario.dao;

import java.util.List;

import org.hibernate.Query;

import br.edu.ifpb.calendario.models.Usuario;

public class UsuarioDAO extends GenericDAO<Usuario> {

	public UsuarioDAO() {
		super();
	}

	public List<Usuario> findAll() {
		return findAll(Usuario.class);
	}

	public Usuario findByCodigo(String valor) {
		return super.findByField(Usuario.class, "codigo", valor);
	}

	public Usuario findByLogin(String login){
		return super.findByField(Usuario.class, "login", login);
	}


}
