import 'package:flutter/material.dart';
import 'package:pendawa/login.dart';
import 'package:pendawa/settings.dart';

class MyNextPassword extends StatelessWidget {
  const MyNextPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return NextPasswordPage();
  }
}

class NextPasswordPage extends StatelessWidget {
  const NextPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: Text(
                  'Check Email',
                  style:
                      primaryTextstyle.copyWith(fontSize: 30, fontWeight: bold),
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
                style: primaryTextstyle.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('images/DonePassword.png')],
              ),
              SizedBox(height: 50),
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
                            builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    'OPEN YOUR EMAIL',
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
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    'BACK TO LOGIN',
                    style: primaryTextstyle.copyWith(fontWeight: bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}