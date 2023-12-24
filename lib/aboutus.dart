import 'package:flutter/material.dart';
import 'package:pendawa/landing.dart';
import 'package:pendawa/login.dart';
import 'package:pendawa/settings.dart';

class MyAboutUs extends StatelessWidget {
  const MyAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutUsPage(),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      body: ListView(
        children: [
          Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: (Icon(Icons.arrow_back_outlined)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )
                ],
              )),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    'About Us',
                    style:
                        whiteTextstyle.copyWith(fontSize: 25, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [Image.asset('images/about.jpg')],
            ),
          ),
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PENDAWA atau yang dikenal dengan Aplikasi Pengelolaan Data Warga di Tingkat Rukun Warga (RW) berbasis mobile adalah Aplikasi yang di rancang untuk Pengelolaan dan Pendataan data warga yang berdomisili di suatu wilayah RW, Aplikasi ini memiliki 2 Fitur utama yaitu Pendataan dan Pengajuan Surat.',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    'Contact Us',
                    style:
                        whiteTextstyle.copyWith(fontSize: 25, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              children: [Image.asset('images/nata.jpg')],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  'Nama : Respati Hadinata',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'NIM : 3312201027',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Nomor WA : 082278859597',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Gmail : respatihadinata@gmail.com',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    '',
                    style:
                        whiteTextstyle.copyWith(fontSize: 25, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              children: [Image.asset('images/janita.jpg')],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  'Nama : Janita Arisna Azzulfadilla',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'NIM : 3312201028',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Nomor WA : 082283959901',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Gmail : janitaarisnaazzulfadilla@gmail.com',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    '',
                    style:
                        whiteTextstyle.copyWith(fontSize: 25, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              children: [Image.asset('images/adib.jpg')],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  'Nama : Adibtianto Abdurrahman Zain',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'NIM : 3312201057',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Nomor WA : 081278059192',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Gmail : adibtianto40@gmail.com',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    '',
                    style:
                        whiteTextstyle.copyWith(fontSize: 25, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              children: [Image.asset('images/rama.jpg')],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  'Nama : Ramadhan',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'NIM : 6042301005',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Nomor WA : 0895341401657',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Gmail : ramad6013@gmail.com',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    '',
                    style:
                        whiteTextstyle.copyWith(fontSize: 25, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              children: [Image.asset('images/issaq.jpg')],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text(
                  'Nama : Issaq Akbar Zakaria',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'NIM : 3312201110',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Nomor WA : 082172326773',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                Text(
                  'Gmail : kiibbar02@gmail.com',
                  style:
                      primaryTextstyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text(
                    '',
                    style:
                        whiteTextstyle.copyWith(fontSize: 25, fontWeight: bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
