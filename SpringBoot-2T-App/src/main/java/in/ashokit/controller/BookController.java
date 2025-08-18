package in.ashokit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import in.ashokit.binding.Book;
import in.ashokit.repository.BookRepository;

@Controller
public class BookController {

	private static Logger logger = LoggerFactory.getLogger(BookController.class);

	@Autowired
	private BookRepository bookRepo;

	@GetMapping("/")
	public String displayForm(Model model) {
		logger.info("*** displayForm () method execution start ***");
		Book bookObj = new Book();
		model.addAttribute("book", bookObj);

		List<Book> booksList = bookRepo.findAll();
		model.addAttribute("books", booksList);

		logger.info("*** displayForm () method execution end ***");
		return "index";
	}

	@PostMapping("/")
	public String saveBook(Book book, Model model) {
		logger.info("*** saveBook () method execution start ***");
		bookRepo.save(book);
		List<Book> booksList = bookRepo.findAll();
		model.addAttribute("books", booksList);
		
		Book bookObj = new Book();
		model.addAttribute("book", bookObj);
		
		
		model.addAttribute("msg", "Book Saved Successfully");
		logger.info("*** saveBook () method execution end ***");
		return "index";
	}
}