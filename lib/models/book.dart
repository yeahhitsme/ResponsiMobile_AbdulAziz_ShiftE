class Book {
  final int id;
  final String isbnCode;
  final String format;
  final int printLength;

  Book({
    required this.id,
    required this.isbnCode,
    required this.format,
    required this.printLength,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      isbnCode: json['isbn_code'],
      format: json['format'],
      printLength: json['print_length'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isbn_code': isbnCode,
      'format': format,
      'print_length': printLength,
    };
  }
}
