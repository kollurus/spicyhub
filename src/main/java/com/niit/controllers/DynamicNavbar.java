package com.niit.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CartDAO;
import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;

@Controller
public class DynamicNavbar {

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;
	


	/*@RequestMapping("/")
	public String dynamicNav(HttpSession session)
	{
		ModelAndView mv = new ModelAndView("Welcome");
		session.setAttribute("categoryList",categoryDAO.list());
		session.setAttribute("productList",productDAO.list());
		return mv; */
	@RequestMapping("/")
	public ModelAndView dynamicNav1(HttpSession session) {
		ModelAndView mv = new ModelAndView("welcome");
		session.setAttribute("categoryList", categoryDAO.list());
		session.setAttribute("productList", productDAO.list());
		return mv;
	} 

	@RequestMapping("welcomepage")
	public String returnhome(Model mv) {
	
		mv.addAttribute("categoryList", categoryDAO.list());
		mv.addAttribute("productList", productDAO.list());
		return "welcome";
	}

	@RequestMapping("/welcome")
	public ModelAndView logoutsession(HttpSession session) {
		ModelAndView mv = new ModelAndView("welcome");
		session.setAttribute("categoryList", categoryDAO.list());
		session.setAttribute("productList", productDAO.list());
		return mv;
	}


}
