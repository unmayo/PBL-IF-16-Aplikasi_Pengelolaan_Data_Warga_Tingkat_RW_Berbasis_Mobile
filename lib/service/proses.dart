import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pendawa/homeadmin.dart';
import 'package:pendawa/pengajuanadmin.dart';
import 'package:pendawa/rtlist.dart';
import 'package:pendawa/settings.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';

class MyProses extends StatelessWidget {
  const MyProses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProsesPage(),
    );
  }
}

class ProsesPage extends StatefulWidget {
  const ProsesPage({super.key});

  @override
  State<ProsesPage> createState() => _ProsesPageState();
}

class _ProsesPageState extends State<ProsesPage> {
  String filepath = '';
  String selectedGender = '';
  String selectedKewarganegaraan = '';
  String selectedPerkawinan = '';
  DateTime selectedDate = DateTime.now();

  late String selectedFileName;

  void chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filepath = result.files.single.path!;
        selectedFileName = basename(filepath);
      });
      print('File yand dipilih: $filepath');
    } else {
      filepath = 'failed';
    }
  }

  Future<void> uploadFiles(String no_unik, String filepath) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.uploadsurat),
      );

      request.fields['no_unik'] = no_unik; // Add 'no_ktp' as a POST field

      if (filepath != 'failed') {
        request.files.add(
          await http.MultipartFile.fromPath('file_profile', filepath),
        );
      }

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print('Files upload successful');
        print('php: $responseBody');
      } else {
        print('Files upload failed with status ${response.statusCode}');
      }
    } catch (e) {
      print("Error uploading files: $e");
    }
  }


  Future<void> AddAcc(String surat_path, String no_unik) async {
    final response = await http.post(
      Uri.parse(Api.suratadd),
      body: {'profile_image': surat_path, 'no_unik': no_unik},
    );

    if (response.statusCode == 200) {
      // Successfully signed up
      print('User signed up successfully!');
      print(response.body);
      // You can navigate to the next screen or handle success accordingly.
    } else {
      // Failed to sign up
      print('Failed to sign up. Status code: ${response.statusCode}');
      // Handle failure accordingly.
    }
  }

  Future<void> updateStatus(String noUnik) async {
    // Replace the URL with the actual URL where your PHP script is hosted
    final String phpScriptUrl = Api.diTolak;

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
                MaterialPageRoute(builder: (context) => HomeAdminPage()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PengajuanAdminPage()));
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => RTListPage()));
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
                            builder: (context) => PengajuanAdminPage()));
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
                  'Upload ${PengajuanKey().surat}',
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
                    'Upload File ${PengajuanKey().surat}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Upload File ${PengajuanKey().surat} ( PDF )',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: Colors.grey, style: BorderStyle.solid)),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: chooseFile,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.file_upload,
                        color: Colors.blue, // Change color as needed
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Upload Surat Anda',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
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
                                  String no_unik = PengajuanKey().key;

                                  // Extract file name and extension
                                  String nameWithoutExtensionLain =
                                      selectedFileName.split('.').first;
                                  String fileExtensionLain =
                                      selectedFileName.split('.').last;

                                  // Alter the file name by adding no_ktpB
                                  String surat_path =
                                      '$nameWithoutExtensionLain.$no_unik.$fileExtensionLain';

                                  uploadFiles(no_unik, filepath);
                                  AddAcc(surat_path, no_unik);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PengajuanAdminPage(),
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
                      'Kirim',
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
                                  // Perform the action when confirmed
                                  updateStatus(PengajuanKey().key);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PengajuanAdminPage(),
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
