import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/pendataan.dart';
import 'package:pendawa/pengajuan.dart';
import 'package:pendawa/profileARiwayat.dart';
import 'package:pendawa/settings.dart';
import 'package:pendawa/api.dart';

class MyRiwayatSurat extends StatelessWidget {
  const MyRiwayatSurat({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RiwayatSuratPage(),
    );
  }
}

class RiwayatSuratPage extends StatefulWidget {
  RiwayatSuratPage({Key? key});

  @override
  _RiwayatSuratPageState createState() => _RiwayatSuratPageState();
}

class _RiwayatSuratPageState extends State<RiwayatSuratPage> {
  late List<Map<String, dynamic>> riwayatList = [];
// Inside _RiwayatSuratPageState class

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the page is initialized
  }

  Future<void> fetchData() async {
    try {
      String nikB = UserNik().nik;
      print(nikB);
      final response = await http.post(
        Uri.parse(Api.getPengajuan),
        body: {'no_nik': nikB},
      );

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);

        // Check if data is a list, if not, wrap it in a list
        final List<dynamic> dataList = data is List ? data : [data];

        // Map to associate title with imagePath
        final Map<String, String> titleImagePathMap = {
          'Kartu Keluarga': 'images/pengajuan1.png',
          'Pembuatan / Perpanjang KTP': 'images/pengajuan2.png',
          'Surat Kelahiran': 'images/pengajuan3.png',
          'Surat Keterangan Usaha': 'images/pengajuan4.png',
          'Surat Keterangan Domisili': 'images/pengajuan5.png',
          'Surat Keterangan Perubahan Data': 'images/pengajuan6.png',
          'Surat Kematian': 'images/pengajuan7.png',
          'Surat Pengantar Nikah': 'images/pengajuan8.png',
          'Surat Keterangan Miskin': 'images/pengajuan9.png',
          'Surat Permintaan Lainnya': 'images/pengajuan10.png',
        };

        // Process the response and update the state
        setState(() {
          riwayatList = dataList.map((item) {
            // Convert 'time' to DateTime
            DateTime dateTime = item['time'] != null
                ? convertDateString(item['time'])
                : DateTime.now();

            // Get the corresponding imagePath based on the title
            String imagePath = titleImagePathMap[item['jenis_surat']] ??
                'images/pengajuan1.png';

            return {
              'nik': item['no_ktp'] ?? '0',
              'imagePath': imagePath, // Replace with the actual image path
              'title': item['jenis_surat'] ??
                  'Kartu Keluarga', // Add the title field from your data
              'time': item['tgl_upload'] ??
                  '2023-10-10', // Add the time field from your data
              'content': item['nama_lengkap'] ??
                  'Data Kosong', // Add the content field from your data
              'deskripsi': item['deskripsi'] ??
                  'Untuk Sekarang Data kosong, Belum ada yang mengajukan Pengajuan', // Add the deskripsi field from your data
              'status': item['status'] ??
                  'Kosong', // Add the status field from your data
              'key': item['no_unik'] ??
                  'Kosong', // Check for null before accessing
              'dateTime': dateTime, // Add the dateTime field for sorting
            };
          }).toList();
        });
      } else {
        // Handle error
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Add a new key 'dateTime' to each entry with the converted DateTime
    riwayatList.forEach((entry) {
      entry['dateTime'] = convertDateString(entry['time']);
    });

    // Sort the list based on the 'dateTime' key in descending order
    riwayatList.sort((a, b) => b['dateTime'].compareTo(a['dateTime']));
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
      body: ListView.builder(
        itemCount: riwayatList.length,
        itemBuilder: (context, index) {
          return buildRiwayatCard(context, riwayatList[index]);
        },
      ),
    );
  }

  Widget buildRiwayatCard(BuildContext context, Map<String, dynamic> data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(data['imagePath']),
                      ),
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 5,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['title'],
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.timer, color: Colors.blue),
                            SizedBox(width: 5),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                data['time'],
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 350,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Permintaan surat ${data['title']} ${data['content']}',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    data['deskripsi'],
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryButtonColor,
                      ),
                      onPressed: () {
                        if (data['status'] != 'Kosong') {
                          TemporNik().resetValues();
                          TemporNik().nikC = data['nik'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProfilePageAriwayat()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Belum adan surat yang di ajukan, anda bisa mengajukan pengajuan baru.'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        data['status'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DateTime convertDateString(String dateString) {
    return DateTime.parse(dateString);
  }
}
