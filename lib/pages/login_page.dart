import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await _authService.login(email, password);
    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Login Failed"),
          content: Text("Invalid credentials"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: Text("OK")),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Latar belakang hitam
      body: Center(
        child: Container(
          width: 400, // Atur lebar kotak
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue, // Warna kotak biru
            borderRadius: BorderRadius.circular(12), // Sudut kotak yang membulat
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Login', // Judul
                style: TextStyle(fontSize: 24, color: Colors.white), // Warna putih untuk judul
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: Colors.black, // Warna kolom hitam
                  filled: true,
                  labelStyle: TextStyle(color: Colors.blue), // Warna label biru
                ),
                style: TextStyle(color: Colors.blue), // Warna teks kolom biru
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: Colors.black, // Warna kolom hitam
                  filled: true,
                  labelStyle: TextStyle(color: Colors.blue), // Warna label biru
                ),
                obscureText: true,
                style: TextStyle(color: Colors.blue), // Warna teks kolom biru
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: login, child: Text('Login')),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("Don't have an account? Register here.", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
