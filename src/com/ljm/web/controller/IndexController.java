package com.ljm.web.controller;

import com.ljm.web.model.User;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class IndexController {
	/**
	 * 进入首页
	 * @param word
	 * @param session
	 * @param model
	 * @return
	 */
    @RequestMapping({"/index", "/"})
    public String goIndex(String word, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedUser");

        if (user != null) {
            model.addAttribute("user", user);
        }

        model.addAttribute("word", word);

        return "index";
    }
}
