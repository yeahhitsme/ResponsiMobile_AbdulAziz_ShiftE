import 'package:flutter/material.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _authorController = TextEditingController(); // Controller untuk penulis
    final _descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Book'),
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
                // Logika untuk menambahkan buku baru
                print("Adding Book: ${_titleController.text}");
                Navigator.pop(context); // Kembali ke dashboard
              },
              child: Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
