import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://responsi.webwizards.my.id/api"; // Base URL untuk API

  // Fungsi untuk registrasi
  Future<http.Response> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/registrasi'), // Endpoint registrasi
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    return response; // Mengembalikan response dari API
  }

  // Fungsi untuk login
  Future<http.Response> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'), // Endpoint login
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    return response; // Mengembalikan response dari API
  }
}
