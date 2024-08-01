import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vazifa_8/model/book_model.dart';
import 'package:vazifa_8/service/book_data.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => _books;

  BookProvider() {
    _initializeBooks();
  }

  Future<void> _initializeBooks() async {
    _books = getBooks();
    await loadDownloadedBooks();
    notifyListeners();
  }

  Future<void> loadDownloadedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    for (var book in _books) {
      book.isDownloaded = prefs.getBool(book.id) ?? false;
    }
    notifyListeners();
  }

  Future<void> downloadBook(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(id, true);
    _books.firstWhere((book) => book.id == id).isDownloaded = true;
    notifyListeners();
  }

  void readBook(String id) {}
}
