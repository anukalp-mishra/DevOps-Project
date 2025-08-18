package in.ashokit.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import in.ashokit.binding.Book;

public interface BookRepository extends JpaRepository<Book, Serializable> {

}