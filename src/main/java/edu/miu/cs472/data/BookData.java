package edu.miu.cs472.data;

import edu.miu.cs472.model.Book;

import java.util.*;

public class BookData {
    private static Map<String, Book> bookList = new LinkedHashMap<String, Book>(){{
        put("1933988673", new Book("1933988673", "Unlocking Android", Arrays.asList(AuthorData.getCurrentMap().get(1), AuthorData.getCurrentMap().get(2)), 21 ));
        put("1935182722", new Book("1935182722", "Android in Action, Second Edition", Arrays.asList(AuthorData.getCurrentMap().get(1), AuthorData.getCurrentMap().get(3)), 30 ));
        put("1617290084", new Book("1617290084", "Specification by Example", Arrays.asList(AuthorData.getCurrentMap().get(4)), 7 ));
        put("1933988746", new Book("1933988746", "Flex 3 in Action", Arrays.asList(AuthorData.getCurrentMap().get(7), AuthorData.getCurrentMap().get(5)), 28 ));
        put("1935182420", new Book("1935182420", "Flex 4 in Action", Arrays.asList(AuthorData.getCurrentMap().get(7), AuthorData.getCurrentMap().get(11), AuthorData.getCurrentMap().get(12), AuthorData.getCurrentMap().get(6)), 19 ));
        put("1933988312", new Book("1933988312", "Collective Intelligence in Action", Arrays.asList(AuthorData.getCurrentMap().get(9)), 22 ));
        put("1933988320", new Book("1933988320", "Zend Framework in Action", Arrays.asList(AuthorData.getCurrentMap().get(10), AuthorData.getCurrentMap().get(13), AuthorData.getCurrentMap().get(14)), 21 ));
        put("1933988797", new Book("1933988797", "Flex on Java", Arrays.asList(AuthorData.getCurrentMap().get(15), AuthorData.getCurrentMap().get(16)), 30 ));
        put("1935182234", new Book("1935182234", "Griffon in Action", Arrays.asList(AuthorData.getCurrentMap().get(17), AuthorData.getCurrentMap().get(18), AuthorData.getCurrentMap().get(19)), 14 ));
        put("193518217X", new Book("193518217X", "OSGi in Depth", Arrays.asList(AuthorData.getCurrentMap().get(20)), 21 ));

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
