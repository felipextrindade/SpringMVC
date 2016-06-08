package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Person;

public abstract interface PersonDAO {
	public abstract List<Person> selectPerson(String name, String surname);
	public abstract List<Person> selectAll();
	public abstract void deletePerson(Integer id);
	public abstract void deleteAll();
}
