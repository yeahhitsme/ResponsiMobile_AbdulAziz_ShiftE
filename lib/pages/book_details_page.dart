import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  final String bookTitle;
  final String bookAuthor; // Menambahkan kolom untuk penulis
  final String bookDescription; // Deskripsi buku
  final Function(String) onDelete; // Callback untuk menghapus buku

  BookDetailsPage({
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookDescription,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController(text: bookTitle);
    final _authorController = TextEditingController(text: bookAuthor); // Controller untuk penulis
    final _descriptionController = TextEditingController(text: bookDescription);

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Tampilkan dialog konfirmasi sebelum menghapus buku
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm Deletion"),
                    content: Text("Are you sure you want to delete '$bookTitle'?"),
                    actions: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },
                      ),
                      TextButton(
                        child: Text("Delete"),
                        onPressed: () {
                          onDelete(bookTitle); // Panggil callback untuk menghapus buku
                          Navigator.of(context).pop(); // Tutup dialog
                          Navigator.of(context).pop(); // Kembali ke dashboard
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Book Title'),
            ),
            TextField(
              controller: _authorController, // Input untuk penulis
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan perubahan
                print("Saving Book: ${_titleController.text}");
                Navigator.pop(context); // Kembali ke dashboard
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
