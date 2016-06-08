package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import net.codejava.spring.model.Contact;
import net.codejava.spring.model.Person;

public class PersonDAOImpl implements PersonDAO {
/*DataSource dataSource;
	
	public void createPerson(String name, String surname) {
		JdbcTemplate createPerson = new JdbcTemplate(dataSource);
		createPerson.update("INSERT INTO PERSON_RECORD (NAME,SURNAME) VALUES (?,?)",
				new Object[]{name,surname});
	}*/
	private JdbcTemplate jdbcTemplate;
	
	public PersonDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void updateName(String newname, String name) {
		String sql = "UPDATE PERSON_RECORD SET NAME=? WHERE NAME=?";
		jdbcTemplate.update(sql, newname, name);
	}

	//TODO Converter para jdbc
	public Person selectPerson(String name) {
		String sql = "SELECT * FROM PERSON_RECORD WHERE NAME=" + name;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Person>() {

			@Override
			public Person extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					Person person = new Person();
					person.setName(rs.getString("name"));
					person.setSurname(rs.getString("surname"));

					return person;
				}
				
				return null;
			}
			
		});
	}

	public List<Person> selectAll() {
		String sql = "SELECT * FROM PERSON_RECORD";
		List<Person> listPerson = jdbcTemplate.query(sql, new PersonRowMapper() {
			@Override
			public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
				Person aPerson = new Person();
				
				aPerson.setId(rs.getInt("id"));
				aPerson.setName(rs.getString("name"));
				aPerson.setSurname(rs.getString("surname"));
				return aPerson;
		}
	});
	return listPerson;
}
	
	/*public List<Person> selectASC() {
		JdbcTemplate selectPerson = new JdbcTemplate(dataSource);
		return selectPerson.query("SELECT NAME,SURNAME FROM PERSON_RECORD ORDER BY NAME",
				new PersonRowMapper());
	}*/

	public void deletePerson(Integer id) {
		String sql = "DELETE FROM PERSON_RECORD WHERE ID=?";
		jdbcTemplate.update(sql, id);		
	}

	/*public void deleteAll() {
		JdbcTemplate deleteAll = new JdbcTemplate(dataSource);
		deleteAll.update("DELETE FROM PERSON_RECORD");
	}*/

	@Override
		public List<Person> selectPerson(String name, String surname) {
			// TODO Auto-generated method stub
			return null;
		}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}
}
