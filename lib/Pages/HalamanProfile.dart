import 'package:ebook_shop/Pages/HalamanRequestBuku.dart';
import 'package:ebook_shop/Pages/HalamanUtama.dart';
import 'package:ebook_shop/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class HalamanProfile extends StatefulWidget {
  const HalamanProfile({super.key});

  @override
  State<HalamanProfile> createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {
  late SharedPreferences logindata;
  late String username;
  late String profileImagePath;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
      profileImagePath = logindata.getString('profileImage') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(0xFF800000),
        title: Text(
          "PROFILE",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'BebasNeue',
            fontSize: 28.0,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            profile(),
            TeamProfile(),
            kesanPesan(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }

  Container profile() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset:
                Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
              'assets/Background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      //color: Colors.grey[500],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _showCameraBottomSheet(context);
              },
              child: CircleAvatar(
                radius: 50.0,
                foregroundImage: profileImagePath.isNotEmpty
                    ? Image.file(File(profileImagePath)).image
                    : Image.asset('assets/profile_placeholder.jpeg').image,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome, $username',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'BebasNeue',
                fontSize: 29.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "Premium User",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'BebasNeue',
                fontSize: 16.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCamera() async {
    String? imagePath = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Camera()),
    );

    if (imagePath != null && imagePath.isNotEmpty) {
      setState(() {
        profileImagePath = imagePath;
      });


      logindata.setString('profileImage', imagePath);
    }
  }

  void _showCameraBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // Adjust the height property as needed, for example, MediaQuery.of(context).size.height / 4
        return Container(
          height: MediaQuery.of(context).size.height / 4,
          child: Camera(),
        );
      },
    ).then((value) {
      if (value != null && value.isNotEmpty) {
        setState(() {
          profileImagePath = value;
        });

        // Save the updated profile image path to SharedPreferences
        logindata.setString('profileImage', value);
      }
    });
  }


  Container kesanPesan() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //SizedBox(height: 10.0),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About App',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'LitLabs adalah aplikasi sederhana yang dapat mengakses data e-books yang tersedia dalam API. Terdapat beberapa fitur seperti login, akses ebooks, request books, dan profile.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container TeamProfile() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/profile.jpeg"),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      "Nabil Makarim H.",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '124210056',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Job Desc: Backend',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0), // Spacing between cards
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/aku.jpg"),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      "Mutiara Hasna",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '124210029',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Job Desc: Backend',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar bottomNavBar(BuildContext context) {
    int _selectedIndex = 2;
    return BottomNavigationBar(
      backgroundColor: Color(0xFF800000),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HalamanUtama()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HalamanRequestBuku()),
          );
        } else if (index == 2) {}
      },
    );
  }
}
