import 'package:flutter/material.dart';
import 'package:pendawa/login.dart';
import 'package:pendawa/main.dart';
import 'package:pendawa/settings.dart';

class MyLanding extends StatelessWidget {
  const MyLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('images/Landings.png')],
              ),
              SizedBox(height: 10),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  height: 130,
                  width: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aplikasi',
                        style: primaryTextstyle.copyWith(
                            fontSize: 30, fontWeight: bold),
                      ),
                      Text(
                        'Pengelolaan',
                        style: tncTextstyle.copyWith(
                            fontSize: 30, fontWeight: bold),
                      ),
                      Text(
                        'Warga',
                        style: primaryTextstyle.copyWith(
                            fontSize: 30, fontWeight: bold),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 70),
                  child: Flexible(
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButtonColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        'LOGIN',
                        style: whiteTextstyle.copyWith(fontWeight: bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
      ),
    );
  }
}
