package com.ssafy.ws.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ws.model.dto.Book;
import com.ssafy.ws.model.repo.BookRepo;

@Service
public class BookServiceImpl implements BookService {

	private BookRepo bookRepo;

	@Autowired
	public BookServiceImpl(BookRepo bookRepo) {
		super();
		this.bookRepo = bookRepo;
	}

	@Override
	public int insert(Book book) throws Exception {
		return bookRepo.insert(book);
	}

	@Override
	public int update(Book book) throws Exception {
		return bookRepo.update(book);
	}

	@Override
	public int delete(String id) throws Exception {
		return bookRepo.delete(id);
	}

	@Override
	public Book select(String id) throws Exception {
		return bookRepo.select(id);
	}

	@Override
	public List<Book> search() throws Exception {
		return bookRepo.search();
	}
}
