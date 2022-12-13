package com.jacob.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.jacob.authentication.models.Book;
import com.jacob.authentication.services.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@GetMapping("/books")
    public String dashboard(Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/hacker";
    	}
    	model.addAttribute("bookList", bookService.allBooks());
    	return "dashboard.jsp";
    }
	
	// Create book
	// display the form
	@GetMapping("/books/new")
	public String displayNewBookForm(@ModelAttribute("newBook")Book book, BindingResult result, HttpSession session, Model model) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/hacker";
		}
		model.addAttribute("id", session.getAttribute("userId"));
		return "addBook.jsp";
	}
	
	// process the form
	@PostMapping("/books/new")
	public String processBookForm(@Valid @ModelAttribute("newBook") Book book, 
			BindingResult result, Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/hacker";
		}
		if(result.hasErrors()) {
			return "addBook.jsp";
		}
		else {
			bookService.createBook(book);
			return "redirect:/books";
		}
	}
	
	// edit book 1. get id from path variable 2. get donation from service 3. display the form
	@GetMapping("/books/edit/{id}")
	public String displayEditBookForm(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/hacker";
		}
		Book foundBook = bookService.oneBook(id);
		model.addAttribute("foundBook", foundBook);
		return "editBook.jsp";
	}
	
	@PutMapping("/books/edit/{id}")
	public String processEditBook(
			@Valid @ModelAttribute("foundBook")Book book, BindingResult result, HttpSession session,
			@PathVariable("id")Long id) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/hacker";
		}
		if(result.hasErrors()) {
			return "editBook.jsp";
		}
		else {
			bookService.editBook(book);
			return "redirect:/books";
		}
	}
	
	@DeleteMapping("/books/delete/{id}")
	public String processDelete(@PathVariable("id")Long id, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/hacker";
		}
		bookService.deleteBook(id);
		return "redirect:/books";
	}
	
	// display the book details
	@GetMapping("/books/{id}")
	public String bookDetails(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/hacker";
		}
		Book book = bookService.oneBook(id);
		model.addAttribute("book", book);
		return "bookDetails.jsp";
	}
	
	// display fun hacker page
	@GetMapping("/hacker")
	public String hacker() {
		return "hacker.jsp";
	}
}
