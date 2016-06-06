package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import net.codejava.spring.model.Login;

public class LoginDAOImpl implements LoginDAO {
	private JdbcTemplate jdbcTemplate;

	/*@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}*/
	
	
	

	public LoginDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}



	@Override
	public Login recuperaLogin (String usuario, String senha)
	{
		String sql = "SELECT * FROM LOGIN WHERE usuario = ? and senha = ?";
		
		try
		{
			return jdbcTemplate.queryForObject(sql, new RowMapper<Login>() {
	
				@Override
				public Login mapRow(ResultSet rs, int index) throws SQLException {
					
					Login login = new Login();
					
					login.setUsuario(rs.getString(2));
					login.setSenha(rs.getString(3));
					
					return login;
				}
				
			}, usuario, senha);
		}
		catch(Exception e)
		{
			return new Login();
		}
	}
}
