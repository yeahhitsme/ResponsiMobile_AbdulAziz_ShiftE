import 'package:flutter/material.dart';
import 'add_book_page.dart'; // Import halaman tambah buku
import 'book_details_page.dart'; // Import halaman detail buku

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> books = [
    {
      "title": "Book 1",
      "author": "Author 1",
      "description": "Description of Book 1",
    },
    {
      "title": "Book 2",
      "author": "Author 2",
      "description": "Description of Book 2",
    },
    {
      "title": "Book 3",
      "author": "Author 3",
      "description": "Description of Book 3",
    },
  ];

  void _deleteBook(String title) {
    setState(() {
      books.removeWhere((book) => book["title"] == title); // Menghapus buku dari daftar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBookPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'List of Books',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          books[index]["title"]!,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          books[index]["author"]!,
                          style: TextStyle(color: Colors.white70),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetailsPage(
                                bookTitle: books[index]["title"]!,
                                bookAuthor: books[index]["author"]!,
                                bookDescription: books[index]["description"]!,
                                onDelete: _deleteBook, // Callback untuk menghapus buku
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
