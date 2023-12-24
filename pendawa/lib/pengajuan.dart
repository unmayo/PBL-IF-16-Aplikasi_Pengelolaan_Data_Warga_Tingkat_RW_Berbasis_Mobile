import 'package:flutter/material.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/pendataan.dart';
import 'package:pendawa/riwayatsurat.dart';
import 'package:pendawa/settings.dart';
import 'package:pendawa/suratpengajuan.dart';

class MyPengajuan extends StatelessWidget {
  const MyPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PengajuanPage(),
    );
  }
}

class PengajuanPage extends StatelessWidget {
  const PengajuanPage({super.key});

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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PengajuanPage()));
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DataPage()));
          }
        },
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: MaterialButton(
                    child: Text(
                      'Pengajuan Surat Pengantar',
                      textAlign: TextAlign.start,
                      style: primaryTextstyle.copyWith(
                          fontSize: 20, fontWeight: bold),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ),
                SizedBox(width: 50),
                Container(
                  alignment: Alignment.topRight,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('images/nata.jpg')),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 5)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 180,
                    child: Flexible(
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryButtonColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RiwayatSuratPage()));
                        },
                        child: Text(
                          'Riwayat Pengajuan Surat',
                          style: whiteTextstyle.copyWith(
                              fontWeight: bold, fontSize: 13),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/pengajuan1.png')),
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 5)),
                                ),
                                SizedBox(
                                  height: 70,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pembuatan",
                                          style: primaryTextstyle.copyWith(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                        Text(
                                          "Kartu Keluarga",
                                          style: primaryTextstyle.copyWith(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                        SizedBox(height: 3),
                                        SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SuratPengajuanPage()));
                                            },
                                            child: Text(
                                              'Ajukan',
                                              style: primaryTextstyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/pengajuan2.png')),
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 5)),
                                ),
                                SizedBox(
                                  height: 70,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pembuatan /",
                                          style: primaryTextstyle.copyWith(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                        Text(
                                          "Perpanjang KTP",
                                          style: primaryTextstyle.copyWith(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                        SizedBox(height: 3),
                                        SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SuratPengajuanPage()));
                                            },
                                            child: Text(
                                              'Ajukan',
                                              style: primaryTextstyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 190,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(width: 5),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/pengajuan3.png')),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 5)),
                              ),
                              SizedBox(
                                height: 70,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Surat Kelahiran",
                                        style: primaryTextstyle.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                      ),
                                      SizedBox(height: 3),
                                      SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: buttonColor),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SuratPengajuanPage()));
                                          },
                                          child: Text(
                                            'Ajukan',
                                            style: primaryTextstyle.copyWith(
                                                fontWeight: bold, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/pengajuan4.png')),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 5)),
                              ),
                              SizedBox(
                                height: 70,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Surat Ket. Usaha",
                                        style: primaryTextstyle.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                      ),
                                      SizedBox(height: 3),
                                      SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: buttonColor),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SuratPengajuanPage()));
                                          },
                                          child: Text(
                                            'Ajukan',
                                            style: primaryTextstyle.copyWith(
                                                fontWeight: bold, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 170,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(width: 5),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/pengajuan5.png')),
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 5)),
                                ),
                                SizedBox(
                                  height: 70,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Surat Ket. Domisili",
                                          textAlign: TextAlign.center,
                                          style: primaryTextstyle.copyWith(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                        SizedBox(height: 3),
                                        SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SuratPengajuanPage()));
                                            },
                                            child: Text(
                                              'Ajukan',
                                              style: primaryTextstyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/pengajuan6.png')),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 5)),
                              ),
                              SizedBox(
                                height: 70,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Surat Ket. Perubahan Data",
                                        textAlign: TextAlign.center,
                                        style: primaryTextstyle.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                      ),
                                      SizedBox(height: 3),
                                      SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: buttonColor),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SuratPengajuanPage()));
                                          },
                                          child: Text(
                                            'Ajukan',
                                            style: primaryTextstyle.copyWith(
                                                fontWeight: bold, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 170,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(width: 5),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(height: 5),
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/pengajuan7.png')),
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 5)),
                                ),
                                SizedBox(
                                  height: 70,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Surat Kematian",
                                          style: primaryTextstyle.copyWith(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                        SizedBox(height: 3),
                                        SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SuratPengajuanPage()));
                                            },
                                            child: Text(
                                              'Ajukan',
                                              style: primaryTextstyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 0),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/pengajuan8.png')),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 5)),
                              ),
                              SizedBox(
                                height: 70,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Surat Pengantar Nikah",
                                        textAlign: TextAlign.center,
                                        style: primaryTextstyle.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                      ),
                                      SizedBox(height: 3),
                                      SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: Flexible(
                                          fit: FlexFit.tight,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SuratPengajuanPage()));
                                            },
                                            child: Text(
                                              'Ajukan',
                                              style: primaryTextstyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 170,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(width: 5),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/pengajuan9.png')),
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 5)),
                                ),
                                SizedBox(
                                  height: 70,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Surat Ket. Miskin (SKM)",
                                          textAlign: TextAlign.center,
                                          style: primaryTextstyle.copyWith(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                        SizedBox(height: 3),
                                        SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SuratPengajuanPage()));
                                            },
                                            child: Text(
                                              'Ajukan',
                                              style: primaryTextstyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 0),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/pengajuan10.png')),
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 5)),
                              ),
                              SizedBox(
                                height: 70,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Permintaan Lainnya",
                                        textAlign: TextAlign.center,
                                        style: primaryTextstyle.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                      ),
                                      SizedBox(height: 3),
                                      SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: buttonColor),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SuratPengajuanPage()));
                                          },
                                          child: Text(
                                            'Ajukan',
                                            style: primaryTextstyle.copyWith(
                                                fontWeight: bold, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
