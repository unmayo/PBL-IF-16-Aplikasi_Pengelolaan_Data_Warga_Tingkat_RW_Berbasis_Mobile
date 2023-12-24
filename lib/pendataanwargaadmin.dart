import 'package:flutter/material.dart';
import 'package:pendawa/data.dart';
import 'package:pendawa/homeadmin.dart';
import 'package:pendawa/pendataanadmin.dart';
import 'package:pendawa/pengajuanadmin.dart';
import 'package:pendawa/settings.dart';

class MyPendataanWarga extends StatelessWidget {
  const MyPendataanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PendataanWargaPage(),
    );
  }
}

class PendataanWargaPage extends StatelessWidget {
  const PendataanWargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_home_screen), label: 'Pengajuan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind), label: 'Pendataan'),
        ],
        unselectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeAdminPage()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PengajuanAdminPage()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PendataanAdminPage()));
          }
        },
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: (Icon(Icons.arrow_back_outlined)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PendataanAdminPage()));
                    },
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: MaterialButton(
                    child: Text(
                      'Data Keluarga, Respati Hadinata',
                      textAlign: TextAlign.start,
                      style: primaryTextstyle.copyWith(
                          fontSize: 20, fontWeight: bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeAdminPage()));
                    },
                  ),
                ),
                SizedBox(width: 70),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('images/nata.jpg')),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 5)),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 50,
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 190,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButtonColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataKeluargaPage()));
                      },
                      child: Text(
                        'Tambah Anggota Keluarga',
                        style: whiteTextstyle.copyWith(
                            fontWeight: bold, fontSize: 13),
                      ),
                    ),
                  )
                ],
              ),
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
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/nata.jpg')),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 5)),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: IconButton(
                            padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_add, color: whiteColor)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anggrek Mas 2 Block C3 No 10',
                        style: whiteTextstyle.copyWith(
                            fontSize: 13, fontWeight: bold),
                      ),
                      Text(
                        'Respati Hadinata',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'Laki - Laki',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        '082278859597',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PendataanAdminPage()));
                        },
                        child: Text(
                          'Profile',
                          style: primaryTextstyle.copyWith(
                              fontWeight: bold, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/nata.jpg')),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 5)),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: IconButton(
                            padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_add, color: whiteColor)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anggrek Mas 2 Block C3 No 10',
                        style: whiteTextstyle.copyWith(
                            fontSize: 13, fontWeight: bold),
                      ),
                      Text(
                        'Respati Hadinata',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'Laki - Laki',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        '082278859597',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PendataanAdminPage()));
                        },
                        child: Text(
                          'Profile',
                          style: primaryTextstyle.copyWith(
                              fontWeight: bold, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorpath1, colorpath2],
                    stops: [0.3, 0.7],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/nata.jpg')),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 5)),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: IconButton(
                            padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_add, color: whiteColor)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anggrek Mas 2 Block C3 No 10',
                        style: whiteTextstyle.copyWith(
                            fontSize: 13, fontWeight: bold),
                      ),
                      Text(
                        'Respati Hadinata',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'Laki - Laki',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        '082278859597',
                        style: whiteTextstyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PendataanAdminPage()));
                        },
                        child: Text(
                          'Profile',
                          style: primaryTextstyle.copyWith(
                              fontWeight: bold, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
