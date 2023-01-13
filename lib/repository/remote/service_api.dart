import 'dart:convert';

import 'package:http/http.dart';
import 'package:sitechtask/models/book.dart';

class ServiceApi {
  Future<List<Book>> getBooks() async {
    final url = 'http://63bfc0a6e262345656ef6200.mockapi.io/api/v1/books';
    Response response = await get(Uri.parse(url));
    var data = jsonDecode(response.body);
    print(response.statusCode);
    print(data);
    List<Book> books = [];
    for (var book in data) {
      Book newBook = Book(book["name"], book["cover"], book["id"],
          book["author"], book["description"]);
      books.add(newBook);
    }
    return books;
  }

  Future<String> getSingleBook(String id) async {
    final url_id = "https://63bfc0a6e262345656ef6200.mockapi.io/api/v1/books/$id";
      Response response = await get(Uri.parse(url_id));
      var data = jsonDecode(response.body);
      print(response.statusCode);
      return data["description"];
  }

  Future<String> deleteSingleBook(String id) async {
    final url_id = "https://63bfc0a6e262345656ef6200.mockapi.io/api/v1/books/$id";
    Response response = await delete(Uri.parse(url_id));
    var data = jsonDecode(response.body);
    print(response.statusCode);
    return "Book Deleted";
  }
}
