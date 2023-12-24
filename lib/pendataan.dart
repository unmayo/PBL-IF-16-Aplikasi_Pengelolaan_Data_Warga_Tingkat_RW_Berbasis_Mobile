import 'package:flutter/material.dart';
import 'package:pendawa/data.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/pengajuan.dart';
import 'package:pendawa/profileA.dart';
import 'package:pendawa/settings.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';
import 'dart:convert';

class Profile {
  final String imagePath;
  final String address;
  final String name;
  final String gender;
  final String phoneNumber;
  final String nik;

  Profile({
    required this.imagePath,
    required this.address,
    required this.name,
    required this.gender,
    required this.phoneNumber,
    required this.nik,
  });
}

List<Profile> profiles = [
  Profile(
    imagePath: 'images/nata.jpg',
    address: 'Anggrek Mas 2 Block C3 No 10',
    name: 'Respati Hadinata',
    gender: 'Laki - Laki',
    phoneNumber: '082278859597',
    nik: '082278859597',
  ),

  // Add more profiles as needed
];

Future<List<Profile>> fetchProfiles() async {
  String kkB = UserKK().kk;

  final response = await http.post(
    Uri.parse(Api.getKeluarga),
    body: {'no_kk': kkB},
  );

  if (response.statusCode == 200) {
    try {
      final dynamic data = jsonDecode(response.body);

      // Check if data is a list, if not, wrap it in a list
      final List<dynamic> dataList = data is List ? data : [data];

      List<Profile> profiles = dataList.map((item) {
        return Profile(
          imagePath:
              item['profile_image'], // Replace with the actual image path
          address: item['alamat_sekarang'],
          name: item['nama_lengkap'],
          gender: item['jenis_kelamin'],
          phoneNumber: item['no_handphone'],
          nik: item['no_ktp'],
        );
      }).toList();

      return profiles;
    } catch (e) {
      print('Error decoding JSON: $e');
      throw Exception('Failed to load profiles');
    }
  } else {
    throw Exception(
        'Failed to load profiles. Status code: ${response.statusCode}');
  }
}

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff12486B), Color(0xff419197)],
          stops: [0.3, 0.7],
          begin: Alignment.centerLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: 20, vertical: 10), // Adjusted vertical margin
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: profile.imagePath.isNotEmpty
                          ? NetworkImage(
                              '${Api.profileimg}/${profile.imagePath}')
                          : NetworkImage('${Api.profileimg}/noimage.jpg')
                              as ImageProvider<
                                  Object>, // Use 'noimage.jpg' for empty or error cases
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 5,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: IconButton(
                    padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                    onPressed: () {
                      // Add logic for the bookmark action if needed
                    },
                    icon: Icon(Icons.bookmark_add, color: Colors.white),
                  ),
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
                  profile.address,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Nama: ${profile.name}',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                Text(
                  'Jenis Kelamin: ${profile.gender}',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                Text(
                  'Nomor Hp: ${profile.phoneNumber}',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    TemporNik().nikC = profile.nik;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePageA(),
                      ),
                    );
                  },
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataPage extends StatelessWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      appBar: AppBar(
        title: Text('Data Keluarga'),
        backgroundColor: primaryButtonColor, // Add your big title
      ),
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
      // Move the container with the button to the top left
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 20, top: 20),
        height: 50,
        child: Container(
          child: Row(
            children: [
              SizedBox(
                height: 35,
                width: 190,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        primaryButtonColor, // Replace with your primaryButtonColor
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DataKeluargaPage()),
                    );
                  },
                  child: Text(
                    'Tambah Anggota Keluarga',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: fetchProfiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Profile> fetchedProfiles = snapshot.data ?? [];
            return ListView.builder(
              itemCount: fetchedProfiles.length,
              itemBuilder: (BuildContext context, int index) {
                return ProfileCard(profile: fetchedProfiles[index]);
              },
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: DataPage(),
    );
  }
}
