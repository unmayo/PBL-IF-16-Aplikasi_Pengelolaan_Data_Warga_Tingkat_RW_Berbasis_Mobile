import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendawa/login.dart';
import 'package:pendawa/pendataan.dart';
import 'package:pendawa/pengajuan.dart';
import 'package:pendawa/profileA.dart';
import 'package:pendawa/settings.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "Loading...";
  String userImage = "Loading.png";
  late int userRT;

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    String nikB = UserNik().nik;

    final response = await http.post(Uri.parse(Api.namanik), body: {
      'nik': nikB,
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> userData = json.decode(response.body);

      if (userData.containsKey("error")) {
        // Handle the case where no user is found
        print("No user found");
      } else {
        // Access 'nama_lengkap' and 'profile_image' from the userData map
        String namaLengkap = userData["nama_lengkap"];
        String profileImage = userData["profile_image"];
        int nort = int.parse(userData["no_rt"]);

        setState(() {
          userName = namaLengkap;
          userImage =
              profileImage; // Assuming 'userImage' is a variable to store the image
          userRT = nort;
          print(userName);
          print(userImage);
          print(userRT);
          RT().resetValues();
          RT().rt = userRT;
          TemporIMGProfile().imgp = userImage;
        });
      }
    } else {
      throw Exception('Failed to load user data');
    }
  }

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
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: MaterialButton(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, right: 130), // Adjust the values as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello!',
                            style: primaryTextstyle.copyWith(
                                fontSize: 20, fontWeight: bold),
                          ),
                          Text(
                            '$userName',
                            style: primaryTextstyle.copyWith(
                                fontSize: 20, fontWeight: bold),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                ),
                SizedBox(width: 70),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 5,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      '${Api.profileimg}/$userImage',
                      errorBuilder: (context, error, stackTrace) {
                        // Handle the error by loading a default image
                        return Image.network(
                          '${Api.profileimg}/noimage.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorpath1, colorpath2],
                stops: [0.3, 0.7],
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 85,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              children: [
                SizedBox(width: 10),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 5,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      '${Api.profileimg}/$userImage',
                      errorBuilder: (context, error, stackTrace) {
                        // Handle the error by loading a default image
                        return Image.network(
                          '${Api.profileimg}/noimage.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                      fit: BoxFit
                          .cover, // Ensure the image is contained without stretching
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: MaterialButton(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                      child: Text(
                        '$userName',
                        textAlign: TextAlign.justify,
                        style: whiteTextstyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                        ),
                        onPressed: () {
                          TemporNik().nikC = UserNik().nik;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePageA(),
                            ),
                          );
                        },
                        child: Text(
                          'Profile',
                          style: primaryTextstyle.copyWith(fontWeight: bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 23,
            decoration: BoxDecoration(
                color: colorpath1, borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.symmetric(horizontal: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Data Anggota Keluarga',
                    textAlign: TextAlign.center,
                    style:
                        whiteTextstyle.copyWith(fontSize: 16, fontWeight: bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorpath1, colorpath2],
                stops: [0.3, 0.7],
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                SizedBox(width: 8),
                Card(
                  color: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 80,
                      height: 130,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Container(
                              width: 80,
                              height: 105,
                              child: Image.network(
                                '${Api.profileimg}/$userImage',
                                width: 80,
                                errorBuilder: (context, error, stackTrace) {
                                  // Handle the error by loading a default image
                                  return Image.network(
                                    '${Api.profileimg}/noimage.jpg',
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            userName,
                            style: primaryTextstyle.copyWith(
                                fontSize: 10, fontWeight: bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Container(
                      height: 30,
                      width: 85,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DataPage()));
                        },
                        child: Text(
                          'Lainnya',
                          style: primaryTextstyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 23,
            decoration: BoxDecoration(
                color: colorpath1, borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.symmetric(horizontal: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Informasi RT & RW',
                    style:
                        whiteTextstyle.copyWith(fontSize: 16, fontWeight: bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 210,
            child: Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Image.asset(
                          'images/17agustus.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        child: Column(
                          children: [
                            Text(
                              'Kegiatan 17 Agustus Tahun 2022, Perumahan Villa Hang Lekir dan Mega Legenda',
                              style: primaryTextstyle.copyWith(
                                  fontSize: 13, fontWeight: bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 210,
            child: Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Image.asset(
                          'images/tenismeja.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        child: Column(
                          children: [
                            Text(
                              'Kegiatan Lomba Tenis Meja Tahun 2022, Perumahan Villa Hang Lekir dan Mega Legenda Batam Centre',
                              style: primaryTextstyle.copyWith(
                                  fontSize: 13, fontWeight: bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 210,
            child: Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Image.asset(
                          'images/posyandu.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        child: Column(
                          children: [
                            Text(
                              'Kegiatan Posyandu Tahun 2022, Perumahan Villa Hang Lekir dan Mega Legenda Batam Centre',
                              style: primaryTextstyle.copyWith(
                                  fontSize: 13, fontWeight: bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
