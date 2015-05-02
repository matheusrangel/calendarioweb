package br.edu.ifpb.calendario.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class GenericDAO<T> implements InterfaceDAO<T> {
	protected static EntityManager manager;

	public GenericDAO(){
		manager = getManager();
	}

	protected static EntityManager getManager(){
		if(manager==null){
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("calendarioweb");
			manager = factory.createEntityManager();
		}
		return manager;
	}

	public void persist(T obj){
		getManager().persist(obj);
	}
	public void remove(T obj) {
		getManager().remove(obj);
	}
	public T merge(T obj){
		return getManager().merge(obj);
	}
	public void refresh(T obj){
		getManager().refresh(obj);
	}
	public void flush(){
		getManager().flush();
	}
	
	@SuppressWarnings("unchecked")
	public T find(Object chave){
		Class<T> type = (Class<T>) ((ParameterizedType) this.getClass()
                .getGenericSuperclass()).getActualTypeArguments()[0];
		return getManager().find(type, chave);
	}
	
	@SuppressWarnings("unchecked")
	public List<T> findAll(){
		Class<T> type = (Class<T>) ((ParameterizedType) this.getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
		Query query = getManager().createQuery("select x from " + type.getSimpleName() + " x");
		return (List<T>) query.getResultList();

	}

	@SuppressWarnings("unchecked")
	protected List<T> findByField(String campo, String valor) 	{
		Class<T> type = (Class<T>) ((ParameterizedType) this.getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
		Query query = getManager().createQuery("select x from " + type.getSimpleName() + " x " +
				"where x.” +campo+ ” = \"" +valor+ "\"");
		return (List<T>) query.getResultList();
	}
	
	public void close(){
		if(getManager().isOpen())
			manager = null;
	}

	public void begin(){
		if(!getManager().getTransaction().isActive())
			getManager().getTransaction().begin();
	}
	public void commit(){
		if(getManager().getTransaction().isActive())
			getManager().getTransaction().commit();		
	}
	public void rollback(){
		if(getManager().getTransaction().isActive())
		getManager().getTransaction().rollback();
	}
	
	//----------------------------------------------------------
	//----------------------- USO DE JPQL ----------------------
	//----------------------------------------------------------
	public  Object findByQuery(String consultaJPQL){		
		try{
			Query q = getManager().createQuery(consultaJPQL);
			return (Object) q.getSingleResult();
		}
		catch(NoResultException e){
			return null;
		}
		catch(NonUniqueResultException e){
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public  List<T> findAllByQuery(String consulta){		
		try{
			Query q = getManager().createQuery(consulta);
			return q.getResultList();
		}
		catch(NoResultException e){
			return null;
		}
		catch(NonUniqueResultException e){
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public  List<T> findAgregateByQuery(String consulta){
		Query q = getManager().createQuery(consulta);
		return q.getResultList();
	}
		
	public int updadeAll(String consulta) {
		Query q = getManager().createQuery(consulta);
		int linhas = q.executeUpdate();
		return linhas;
	}
	
}

