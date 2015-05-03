
package br.edu.ifpb.calendario.dao;

import java.util.List;

import javax.persistence.Query;

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
		String classe = Usuario.class.getName();
		String campo = "login";
		int i = classe.lastIndexOf(".");
		classe=classe.substring(i+1);
		Query query = manager.createQuery("select x from " + classe + " x " +
				"where x." + campo + " = '" + login + "'");
		List<Usuario> usuarios =  query.getResultList();
		if(usuarios.size() > 0){
			return usuarios.get(0);
		} else {
			return null;
		}

	}

}
