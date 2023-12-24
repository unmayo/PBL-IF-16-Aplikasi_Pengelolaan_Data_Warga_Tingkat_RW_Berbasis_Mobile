import 'package:flutter/material.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/landing.dart';
import 'package:pendawa/main.dart';
import 'package:pendawa/password.dart';
import 'package:pendawa/settings.dart';
import 'package:pendawa/sign.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

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
                      'Nomor Induk Kependudukan ( NIK )',
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
                          hintText: 'Masukkan NIK',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
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
                    width: 110,
                    child: Container(
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: MaterialButton(
                              child: Text(
                                'Lupa Password ?',
                                style: primaryTextstyle.copyWith(fontSize: 12),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PasswordPage()));
                              },
                            ),
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        'LOGIN',
                        style: whiteTextstyle.copyWith(fontWeight: bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: buttonColor),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignPage()));
                    },
                    child: Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        'SIGN UP',
                        style: primaryTextstyle.copyWith(fontWeight: bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 245,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: MaterialButton(
                          child: Text(
                            'About us',
                            style: tncTextstyle.copyWith(
                                fontSize: 13, fontWeight: bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenPage()));
                          },
                        ),
                      ),
                      SizedBox(width: 50),
                      Flexible(
                        fit: FlexFit.tight,
                        child: MaterialButton(
                          child: Text(
                            'Contact us',
                            style: tncTextstyle.copyWith(
                                fontSize: 13, fontWeight: bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingPage()));
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
