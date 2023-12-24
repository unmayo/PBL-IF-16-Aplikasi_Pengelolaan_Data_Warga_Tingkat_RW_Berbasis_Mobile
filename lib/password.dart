import 'package:flutter/material.dart';
import 'package:pendawa/login.dart';
import 'package:pendawa/nextpassword.dart';
import 'package:pendawa/settings.dart';

class MyPassword extends StatelessWidget {
  const MyPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PasswordPage(),
    );
  }
}

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                MaterialButton(
                  child: Text(
                    'Lupa Password',
                    style:
                        textTextstyle.copyWith(fontSize: 30, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                ),
                SizedBox(height: 1),
                Text(
                  'Aplikasi Pengelolaan Data Warga Tingkat RW Berbasis Mobile. Perumahan Mega Legenda',
                  style: secondaryTextstyle.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('images/PasswordPage.png')],
                ),
                SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukan Email',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryButtonColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NextPasswordPage()));
                        },
                        child: Text(
                          'RESET PASSWORD',
                          style: whiteTextstyle.copyWith(fontWeight: bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'BACK TO LOGIN',
                          style: primaryTextstyle.copyWith(fontWeight: bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}