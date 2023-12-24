
import 'package:flutter/material.dart';
import 'package:pendawa/homeadminRT.dart';
import 'package:pendawa/pendataanadminRT.dart';
import 'package:pendawa/pengajuanadminRT.dart';
import 'package:pendawa/settings.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';

class MyProsesC extends StatelessWidget {
  const MyProsesC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProsesCPage(),
    );
  }
}

class ProsesCPage extends StatefulWidget {
  const ProsesCPage({super.key});

  @override
  State<ProsesCPage> createState() => _ProsesCPageState();
}

class _ProsesCPageState extends State<ProsesCPage> {
  String filepath = '';
  String selectedGender = '';
  String selectedKewarganegaraan = '';
  String selectedPerkawinan = '';
  DateTime selectedDate = DateTime.now();

  late String selectedFileName;

  Future<void> updateStatus(String noUnik, String answer) async {
    // Replace the URL with the actual URL where your PHP script is hosted
    String phpScriptUrl;
    if (answer == 'Tolak') {
      phpScriptUrl = Api.diTolak;
    } else if (answer == 'konfirmasi') {
      phpScriptUrl = Api.diKonfirmasi;
    } else {
      // Handle other cases if needed
      // You might want to throw an exception or provide a default URL
      // based on your application logic
      throw Exception('Invalid answer value: $answer');
    }

    try {
      final response = await http.post(
        Uri.parse(phpScriptUrl),
        body: {'no_unik': noUnik},
      );

      if (response.statusCode == 200) {
        print('Status updated successfully');
      } else {
        print('Error updating status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeAdminRTPage()));
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PengajuanAdminRTPage()));
          } else if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PendataanAdminRTPage()));
          }
        },
      ),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PengajuanAdminRTPage()));
                  },
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Konfirmasi ${PengajuanKey().surat}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Konfirmasi Permintaan ${PengajuanKey().surat}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Pilih Konfirmasi atau Tolak pada ${PengajuanKey().surat}, jika terkonfirmasi akan di lanjukan ke RW jika di tolak maka pengajuan akan batal',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 38,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Change color as needed
                    ),
                    onPressed: () {
                      // Show confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Konfirmasi"),
                            content: Text("Apakah Anda yakin ingin mengirim?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text("Batal"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Perform the action when confirmed
                                  String answer = 'konfirmasi';

                                  // Extract file name and extension
                                  updateStatus(PengajuanKey().key, answer);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PengajuanAdminRTPage(),
                                    ),
                                  );
                                },
                                child: Text("Ya"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Konfirmasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Atau',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 38,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Change color as needed
                    ),
                    onPressed: () {
                      // Show confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Konfirmasi"),
                            content: Text("Apakah Anda yakin ingin menolak?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text("Batal"),
                              ),
                              TextButton(
                                onPressed: () {
                                  String answer = 'tolak';
                                  // Perform the action when confirmed
                                  updateStatus(PengajuanKey().key, answer);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PengajuanAdminRTPage(),
                                    ),
                                  );
                                },
                                child: Text("Ya"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Tolak',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
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
