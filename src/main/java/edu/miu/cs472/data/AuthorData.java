package edu.miu.cs472.data;

import edu.miu.cs472.model.Author;

import java.util.LinkedHashMap;
import java.util.Map;

public class AuthorData {
    public static Map<Integer, Author> authorList = new LinkedHashMap<Integer, Author>()
    {{
       put(1, new Author("W. Frank", "Ableson"));
       put(2, new Author("Charlie", "Collins"));
       put(3, new Author("Robi", "Sen"));
       put(4, new Author("Gojko", "Adzic"));
       put(5, new Author("Faisal", "Abid"));
       put(6, new Author("Joel", "Hooks"));
       put(7, new Author("Tarig", "Ahmed"));
       put(8, new Author("Jon", "Hirschi"));
       put(9, new Author("Satnam", "Alag"));
       put(10, new Author("Rob", "Allen"));
       put(11, new Author("Dan", "Orlando"));
       put(12, new Author("John C.", "Bland II"));
       put(13, new Author("Nick", "Lo"));
       put(14, new Author("Steven", "Brown"));
       put(15, new Author("Bernerd", "Allmon"));
       put(16, new Author("Jeremy", "Anderson"));
       put(17, new Author("Andres", "Almiray"));
       put(18, new Author("Danno", "Ferrin"));
       put(19, new Author("James", "Shingler"));
       put(20, new Author("Alexandre de Castro", "Alves"));
    }};
}
