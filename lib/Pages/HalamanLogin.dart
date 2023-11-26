import 'package:flutter/material.dart';
import 'package:ebook_shop/Pages/HalamanUtama.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class HalamanLogin extends StatefulWidget {
  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Enkripsi kata sandi sebelum disimpan
  String _encryptPassword(String password) {
    final key = encrypt.Key.fromLength(32);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);
    return encrypted.base64;
  }

  // Proses validasi login
  void _login() {
    final enteredUsername = _usernameController.text;
    final enteredPassword = _passwordController.text;

    // Contoh validasi sederhana, bisa disesuaikan dengan kebutuhan
    if (enteredUsername == 'k' && enteredPassword == 'password') {
      final encryptedPassword = _encryptPassword(enteredPassword);
      _saveLoginStatus(enteredUsername, encryptedPassword);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HalamanUtama()),
      );
    } else {
      _showErrorDialog('Login failed. Please try again.');
    }
  }

  // Menyimpan status login dengan shared preferences
  void _saveLoginStatus(String username, String encryptedPassword) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', encryptedPassword);
    prefs.setBool('isLoggedIn', true);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('LitLabs',
                  style: TextStyle(
                    color: Color(0xFF800000),
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your personalized literature bud',
                  style: TextStyle(
                    color: Colors.grey[850],
                    fontSize: 15,
                  ),
                ),

                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(color: Color(0xFF800000)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Color(0xFF800000)),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        style: TextStyle(color: Color(0xFF800000)),
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Color(0xFF800000)),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF800000),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      minimumSize: Size(
                        double.infinity,
                        0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not signed up?',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
