
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/pendataan.dart';
import 'package:pendawa/pengajuan.dart';
import 'package:pendawa/profileARiwayat.dart';
import 'package:pendawa/settings.dart';
import 'package:path/path.dart';
import 'package:pendawa/api.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

class MyStatusImage extends StatelessWidget {
  const MyStatusImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatusPage(),
    );
  }
}

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusState();
}

class _StatusState extends State<StatusPage> {
  String filepath = '';
  String selectedGender = '';
  String selectedKewarganegaraan = '';
  String selectedPerkawinan = '';
  DateTime selectedDate = DateTime.now();
  String path = RiwayatUser().surat_path;
  String Deskripsi = RiwayatUser().Deskripsi;
  String no_unik = RiwayatUser().no_unik;
  String jenis_surat = RiwayatUser().jenis_surat;

  late String selectedFileName;

  Future<void> downloadFile(String fileUrl, String fileName) async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo;

    try {
      androidInfo = await deviceInfo.androidInfo;
    } catch (e) {
      print("Error getting Android device info: $e");
      // Handle error, set a default SDK version, or take appropriate action.
      return;
    }

    PermissionStatus storageStatus;

    if (androidInfo.version.sdkInt < 33) {
      storageStatus = await Permission.storage.request();
    } else {
      storageStatus = PermissionStatus.granted;
    }

    if (storageStatus == PermissionStatus.granted) {
      try {
        // Get the external storage directory
        Directory? externalDir = await getExternalStorageDirectory();

        if (externalDir != null) {
          // Get the parent directory (root of external storage)
          Directory rootDir = externalDir.parent;

          // Construct the path to save the file
          String savePath = '${rootDir.path}/$fileName';

          print('Save Path: $savePath');

          // Download and save the file using Dio
          await Dio().download(
            fileUrl,
            savePath,
            onReceiveProgress: (received, total) {
              if (total != -1) {
                print((received / total * 100).toStringAsFixed(0) + '%');
                // You can build a progress bar feature here.
              }
            },
          );

          // Show an on-screen message
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(
              content: Text('Download completed. File saved to: $savePath'),
            ),
          );
          print('File is saved to the download folder.');
        } else {
          print('External storage directory is null.');
        }
      } catch (e) {
        print('Error downloading and saving file: $e');
      }
    } else if (storageStatus == PermissionStatus.denied) {
      // Permission not granted, show a dialog or take appropriate action
    } else if (storageStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
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
            icon: Icon(Icons.add_to_home_screen),
            label: 'Pengajuan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            label: 'Pendataan',
          ),
        ],
        unselectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PengajuanPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DataPage()),
            );
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
                        builder: (context) => ProfilePageAriwayat(),
                      ),
                    );
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
                  'Hasil Pengajuan Anda',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the image here
                path.toLowerCase().endsWith('.pdf')
                    ? Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            await downloadFile(
                              '${Api.surat}/$path',
                              path,
                            );
                          },
                          child: Text('Download PDF'),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          '${Api.surat}/$path', // Replace with your image path
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                SizedBox(height: 10),
                Text(
                  'Status Pengajuan Anda',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Di atas adalah status pengajuan ada, lebih lengkapnya hubungi RT/RW anda. Jika ingin menghapus data pengajuan silahkan untuk menekan tombol di bawah ini.',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 80,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 38,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Red color
                      ),
                      onPressed: () {
                        // Placeholder logic for "Hapus" button
                        // You can call downloadFile here with the appropriate fileUrl and fileName
                      },
                      child: Text(
                        'Hapus',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
