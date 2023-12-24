import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendawa/aboutus.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/homeadmin.dart';
import 'package:pendawa/homeadminRT.dart';
import 'package:pendawa/landing.dart';
import 'package:pendawa/password.dart';
import 'package:pendawa/settings.dart';
import 'package:pendawa/sign.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

final TextEditingController nikController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController KKController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      body: ListView(
        children: [
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    'Selamat Datang',
                    style: primaryTextstyle.copyWith(
                        fontSize: 30, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
                SizedBox(height: 1),
                Text(
                  'Aplikasi Pengelolaan Data Warga Tingkat RW Berbasis Mobile. Perumahan Mega Legenda',
                  style: primaryTextstyle.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 64),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Kartu Keluarga ( KK )',
                      style: textTextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        controller: KKController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan KK',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nomor Induk Kependudukan ( NIK ) / Nomor KTP ',
                          style: textTextstyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteColor,
                          ),
                          child: TextField(
                            controller: nikController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukkan NIK / KTP',
                              hintStyle: textTextstyle.copyWith(
                                  fontSize: 12,
                                  color: textColor.withOpacity(0.6)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 17),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Password',
                          style: textTextstyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteColor,
                          ),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: textTextstyle.copyWith(
                                  fontSize: 12,
                                  color: textColor.withOpacity(0.6)),
                              suffixIcon: Icon(Icons.visibility_off),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 130,
                        child: Container(
                          child: Row(
                            children: [
                              MaterialButton(
                                child: Text(
                                  'Lupa Password ?',
                                  style:
                                      primaryTextstyle.copyWith(fontSize: 12),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PasswordPage()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryButtonColor),
                        onPressed: () async {
                          String nikB = nikController.text;
                          String passB = passwordController.text;
                          String kkB = KKController.text;
                          //i need the nik agen :3
                          UserNik().nik = nikController.text;
                          UserKK().kk = KKController.text;

                          print(kkB);

                          final response =
                              await http.post(Uri.parse(Api.login), body: {
                            'nikORktp': nikB,
                            'password': passB,
                            'kk': kkB,
                          });

                          // Parse the response body as JSON
                          print(response.body);
                          final Map<String, dynamic> responseBody =
                              json.decode(response.body);

                          if (responseBody['status'] == 'admin') {
                            // Successful login
                            print("Server Response: ${response.statusCode}");
                            print("Response Body: ${response.body}");
                            print("Login ok");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeAdminPage()),
                            );
                          } else if (responseBody['status'] == 'rtadmin') {
                            // Successful login
                            print("Server Response: ${response.statusCode}");
                            print("Response Body: ${response.body}");
                            print("Login ok");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeAdminRTPage()),
                            );
                          } else if (responseBody['status'] == 'success') {
                            // Successful login
                            print("Server Response: ${response.statusCode}");
                            print("Response Body: ${response.body}");
                            print("Login ok");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          } else {
                            // Handle login failure
                            print("Login failed: ${response.body}");

                            // Show an error message to the user
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Unable to Login'),
                                  content: Text(
                                      'Invalid credentials. Please check your NIK and password.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          'LOGIN',
                          style: whiteTextstyle.copyWith(fontWeight: bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignPage()));
                        },
                        child: Text(
                          'SIGN UP',
                          style: primaryTextstyle.copyWith(fontWeight: bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            child: Text(
                              'About us',
                              style: tncTextstyle.copyWith(
                                  fontSize: 13, fontWeight: bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AboutUsPage()));
                            },
                          ),
                          SizedBox(width: 80),
                          MaterialButton(
                            child: Text(
                              'Contact us',
                              style: tncTextstyle.copyWith(
                                  fontSize: 13, fontWeight: bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AboutUsPage()));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
