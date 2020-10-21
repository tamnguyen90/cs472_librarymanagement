package edu.miu.cs472.data;

import edu.miu.cs472.model.Author;
import edu.miu.cs472.model.Book;

import java.util.*;

public class BookData {
    private static Map<String, Book> bookList = new LinkedHashMap<String, Book>(){{
        put("1933988673", new Book("1933988673", "Unlocking Android", Arrays.asList(AuthorData.authorList.get(1), AuthorData.authorList.get(2)) ));
        put("1935182722", new Book("1935182722", "Android in Action, Second Edition", Arrays.asList(AuthorData.authorList.get(1), AuthorData.authorList.get(3)) ));
        put("1617290084", new Book("1617290084", "Specification by Example", Arrays.asList(AuthorData.authorList.get(4)) ));
        put("1933988746", new Book("1933988746", "Flex 3 in Action", Arrays.asList(AuthorData.authorList.get(7), AuthorData.authorList.get(5)) ));
        put("1935182420", new Book("1935182420", "Flex 4 in Action", Arrays.asList(AuthorData.authorList.get(7), AuthorData.authorList.get(11), AuthorData.authorList.get(12), AuthorData.authorList.get(6)) ));
        put("1933988312", new Book("1933988312", "Collective Intelligence in Action", Arrays.asList(AuthorData.authorList.get(9)) ));
        put("1933988320", new Book("1933988320", "Zend Framework in Action", Arrays.asList(AuthorData.authorList.get(10), AuthorData.authorList.get(13), AuthorData.authorList.get(14)) ));
        put("1933988797", new Book("1933988797", "Flex on Java", Arrays.asList(AuthorData.authorList.get(15), AuthorData.authorList.get(16)) ));
        put("1935182234", new Book("1935182234", "Griffon in Action", Arrays.asList(AuthorData.authorList.get(17), AuthorData.authorList.get(18), AuthorData.authorList.get(19)) ));
        put("193518217X", new Book("193518217X", "OSGi in Depth", Arrays.asList(AuthorData.authorList.get(20)) ));


    }};

    public static Collection<Book> getCurrentBookList() {
        return bookList.values();
    }

    public static boolean addNewBook(Book newBook) {
        if (bookList.get(newBook.getIsbn()) != null) {
            return false;
        }
        bookList.put(newBook.getIsbn(), newBook);
        return true;
    }
}
