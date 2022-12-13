package com.jacob.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jacob.authentication.models.Book;
import com.jacob.authentication.repositories.BookRepository;

@Service
public class BookService {

	@Autowired
	private BookRepository bookRepo;
	
	// all books
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	
	// find one book
	public Book oneBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}
		else {
			return null;
		}
	}
	// create
		public Book createBook(Book book) {
			return bookRepo.save(book);
		}
	
	
	
	// edit
	public Book editBook(Book book) {
		return bookRepo.save(book);
	}
	
	
	// delete
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
	
	
	
	
}
