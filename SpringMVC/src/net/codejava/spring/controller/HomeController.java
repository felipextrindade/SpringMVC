package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.codejava.spring.dao.ContactDAO;
import net.codejava.spring.dao.PersonDAO;
import net.codejava.spring.model.Contact;
import net.codejava.spring.model.Person;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * This controller routes accesses to the application to the appropriate
 * hanlder methods. 
 * @author www.codejava.net
 *
 */
@Controller
public class HomeController {

	@Autowired
	private ContactDAO contactDAO;
	
	@Autowired
	private PersonDAO personDAO;
	
	/*@Autowired
	private LoginDAO loginDAO;*/
	
	/*@RequestMapping(value="/")
	public ModelAndView mainPage(ModelAndView model) throws IOException{
		model.setViewName("index");
		
		return model;
	}*/
	
	@RequestMapping(value="/contacts")
	public ModelAndView listContact(ModelAndView model) throws IOException{
	
		Contact contact = new Contact();
		model.addObject("contact", contact);
		
		List<Contact> listContact = contactDAO.list();
		Person person = new Person();
		model.addObject("person", person);
		model.addObject("listContact", listContact);
		model.setViewName("home");
		return model;
	}
	
	@RequestMapping(value="/persons")
	public ModelAndView Persons(ModelAndView model) throws IOException{
		List<Person> listPerson = personDAO.selectAll();
		model.addObject("listPerson", listPerson);
		model.setViewName("person");
		
		return model;
	}
	
	@RequestMapping(value = "/newContact", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Contact newContact = new Contact();
		model.addObject("contact", newContact);
		model.setViewName("ContactForm");
		return model;
	}
	
	@RequestMapping(value = "/saveContact", method = RequestMethod.POST)
	public ModelAndView saveContact(@ModelAttribute Contact contact) {
		contactDAO.saveOrUpdate(contact);		
		return new ModelAndView("redirect:/contacts");
	}
	
	@RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
	public ModelAndView deleteContact(HttpServletRequest request) {
		int contactId = Integer.parseInt(request.getParameter("id"));
		contactDAO.delete(contactId);
		return new ModelAndView("redirect:/contacts");
	}
	
	
	@RequestMapping(value = "/editContact", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) {
		int contactId = Integer.parseInt(request.getParameter("id"));
		Contact contact = contactDAO.get(contactId);
		ModelAndView model = new ModelAndView("ContactForm");
		model.addObject("contact", contact);
		
		return model;
	}
	
	//busca
	
    /*@RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(Model model) {
        model.addAttribute("contact", new Contact());
        return "home";
    }*/
    
    /*@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView listPerson(ModelAndView model,HttpServletRequest request) throws IOException {
    	Contact contact = new Contact();
		model.addObject("contact", contact);
		String name = request.getParameter("name");
		List<Contact> listContact = contactDAO.searchByName(name);
		model.addObject("listContact", listContact);
		model.setViewName("home");

		return model;
	}*/
    
    //Busca usando JS (Sem atualizar a p�gina)
	
    @RequestMapping(value="/contact_list", method = RequestMethod.GET)
    public ModelAndView listUserAjax(ModelAndView model, HttpServletRequest request) throws IOException{
          List<Contact> contactList = contactDAO.searchByName(request.getParameter("term"));
          model.addObject("contactList", contactList);
          model.setViewName("list_ajax");
          return model;
    }
	
	
	//mappings de persons
	
	@RequestMapping(value = "/deletePerson", method = RequestMethod.GET)
	public ModelAndView deletePerson(HttpServletRequest request) {
		int Id = Integer.parseInt(request.getParameter("id"));
		personDAO.deletePerson(Id);
		return new ModelAndView("redirect:/persons");
	}
}
