package edu.miu.cs472.data;

import edu.miu.cs472.model.Author;

import java.util.LinkedHashMap;
import java.util.Map;

public class AuthorData {
   private static int count = 0;
   private static Map<Integer, Author> authorMap = new LinkedHashMap<Integer, Author>()
    {{
       put(++count, new Author("W. Frank", "Ableson"));
       put(++count, new Author("Charlie", "Collins"));
       put(++count, new Author("Robi", "Sen"));
       put(++count, new Author("Gojko", "Adzic"));
       put(++count, new Author("Faisal", "Abid"));
       put(++count, new Author("Joel", "Hooks"));
       put(++count, new Author("Tarig", "Ahmed"));
       put(++count, new Author("Jon", "Hirschi"));
       put(++count, new Author("Satnam", "Alag"));
       put(++count, new Author("Rob", "Allen"));
       put(++count, new Author("Dan", "Orlando"));
       put(++count, new Author("John C.", "Bland II"));
       put(++count, new Author("Nick", "Lo"));
       put(++count, new Author("Steven", "Brown"));
       put(++count, new Author("Bernerd", "Allmon"));
       put(++count, new Author("Jeremy", "Anderson"));
       put(++count, new Author("Andres", "Almiray"));
       put(++count, new Author("Danno", "Ferrin"));
       put(++count, new Author("James", "Shingler"));
       put(++count, new Author("Alexandre de Castro", "Alves"));
    }};

    public static Map<Integer, Author> getCurrentMap() {
       return authorMap;
    }

    public static boolean addNewAuthor(Author newAuthor) {
       authorMap.put(++count, newAuthor);
       return true;
    }
}
