package br.edu.ifpb.calendario.dao;

public interface InterfaceDAO<T> {
	public void persist(T obj);
	public void remove(T obj) ;
	public T merge(T obj);
	public void refresh(T obj);
}
