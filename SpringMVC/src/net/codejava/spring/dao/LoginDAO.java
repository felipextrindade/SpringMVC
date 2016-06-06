package net.codejava.spring.dao;

import net.codejava.spring.model.Login;

public interface LoginDAO {
	public Login recuperaLogin (String usuario, String senha);
}
