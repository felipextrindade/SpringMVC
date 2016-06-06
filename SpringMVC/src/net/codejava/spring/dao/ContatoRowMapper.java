package net.codejava.spring.dao;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Contact;

public class ContatoRowMapper implements RowMapper<Contact> {
	
	@Override
	public Contact mapRow(ResultSet rs, int a) throws SQLException {
		// TODO Auto-generated method stub
		Contact aContact = new Contact();
		aContact.setName(rs.getString("name"));
		aContact.setEmail(rs.getString("email"));
		return aContact;
	}
}
