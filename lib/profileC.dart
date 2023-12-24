import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pendawa/pendataanadminRT.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pendawa/pengajuanadminRT.dart';
import 'package:pendawa/profile.dart';
import 'package:flutter/material.dart';
import 'package:pendawa/homeadminRT.dart';
import 'package:pendawa/settings.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Biodata {
  final String namaLengkap;
  final String jenisKelamin;
  final String noHandphone;
  final String tanggalLahir;
  final String namaIbuKandung;
  final String namaAyahKandung;
  final String alamatSekarang;
  final String kewarganegaraan;
  final String agama;
  final String pendidikanTerakhir;
  final String pekerjaan;
  final String statusPerkawinan;
  final String noKtp;
  final String noKartuKeluarga;
  final String deskripsi;
  final String fotoKTP;
  final String fotoKK;
  final String fotoLain;
  final String Imgprofile;

  Biodata({
    required this.namaLengkap,
    required this.jenisKelamin,
    required this.noHandphone,
    required this.tanggalLahir,
    required this.namaIbuKandung,
    required this.namaAyahKandung,
    required this.alamatSekarang,
    required this.kewarganegaraan,
    required this.agama,
    required this.pendidikanTerakhir,
    required this.pekerjaan,
    required this.statusPerkawinan,
    required this.noKtp,
    required this.noKartuKeluarga,
    required this.deskripsi,
    required this.fotoKTP,
    required this.fotoKK,
    required this.fotoLain,
    required this.Imgprofile,
  });
}

class MyProfileC extends StatelessWidget {
  const MyProfileC({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePageC(),
    );
  }
}

class ProfilePageC extends StatefulWidget {
  const ProfilePageC({Key? key}) : super(key: key);

  @override
  State<ProfilePageC> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageC> {
  String fileUrl = ''; // Move this line here
  // Your existing code...
  @override
  void initState() {
    super.initState();
    // Fetch biodata from the server when the widget initializes
    fetchData().then((_) {
      // Call combineImageUrl when the fetchData is completed
      combineImageUrl();
    });
  }

  Biodata biodata = Biodata(
    // Replace this sample data with the actual data from your SQL database
    namaLengkap: '',
    jenisKelamin: '',
    noHandphone: '',
    tanggalLahir: '',
    namaIbuKandung: '',
    namaAyahKandung: '',
    alamatSekarang: '',
    kewarganegaraan: '',
    agama: '',
    pendidikanTerakhir: '',
    pekerjaan: '',
    statusPerkawinan: '',
    noKtp: '',
    noKartuKeluarga: '',
    deskripsi: '',
    fotoKTP: '',
    fotoKK: '',
    fotoLain: '',
    Imgprofile: '',
  );

  // Function to fetch biodata from the server
  Future<void> fetchData() async {
    String nikB = TemporNik().nikC;
    final response = await http.post(
      Uri.parse(Api.getAnggota), // Replace with your PHP script URL
      body: {'nik': nikB},
    );

    if (response.statusCode == 200) {
      print(response.body);
      // If the server returns a 200 OK response, parse the JSON
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        // Update the state with the fetched biodata
        biodata = Biodata(
          namaLengkap: data['nama_lengkap'],
          jenisKelamin: data['jenis_kelamin'],
          noHandphone: data['no_handphone'],
          tanggalLahir: data['tanggal_lahir'],
          namaIbuKandung: data['nama_ibu_kandung'],
          namaAyahKandung: data['nama_ayah_kandung'],
          alamatSekarang: data['alamat_sekarang'],
          kewarganegaraan: data['kewarganegaraan'],
          agama: data['agama'],
          pendidikanTerakhir: data['pendidikan_terakhir'],
          pekerjaan: data['pekerjaan'],
          statusPerkawinan: data['status_perkawinan'],
          noKtp: data['no_ktp'],
          noKartuKeluarga: data['no_kartu_keluarga'],
          fotoKTP: data['foto_ktp'],
          fotoKK: data['foto_kartu_keluarga'],
          fotoLain: data['foto_pendukung_lain'],
          deskripsi: data['deskripsi'],
          Imgprofile: data['profile_image'],
        );
        fileUrl = '${Api.img}/${biodata.fotoKTP}';
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception or handle the error accordingly.
      throw Exception('Failed to load biodata');
    }
  }

  void combineImageUrl() {
    String originalUrl = biodata.Imgprofile;
    TemporIMGProfile().resetValuesB();
    if (originalUrl.isNotEmpty) {
      int dotIndex = originalUrl.lastIndexOf('.');
      String filename = originalUrl.substring(0, dotIndex);
      String extension = originalUrl.substring(dotIndex);
      print('${Api.profileimg}/$filename$extension');
      TemporIMGProfile().imgpAdapt = '${Api.profileimg}/$filename$extension';
    } else {
      TemporIMGProfile().imgpAdapt = '${Api.profileimg}/noimage.jpg';
    }
  }

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
          ScaffoldMessenger.of(context).showSnackBar(
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
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Permission Required"),
          content: Text("Please grant storage permission to download files."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
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
              icon: Icon(Icons.add_to_home_screen), label: 'Pengajuan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind), label: 'Pendataan'),
        ],
        unselectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 0) {
            TemporNik().resetValues();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeAdminRTPage()));
          } else if (index == 1) {
            TemporNik().resetValues();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PengajuanAdminRTPage()));
          } else if (index == 2) {
            TemporNik().resetValues();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PendataanAdminRTPage()));
          }
        },
      ),
      body: ListView(
        children: [
          Row(
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
                        TemporNik().resetValues();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeAdminRTPage()));
                      },
                    )
                  ],
                ),
              ),
              Container(
                child: Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Profile',
                    style: primaryTextstyle.copyWith(
                        fontSize: 18, fontWeight: bold),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorpath1, colorpath2],
                stops: [0.3, 0.7],
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 108,
                        width: 108,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56),
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 5,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            // Use the $image variable for the network image URL
                            TemporIMGProfile().imgpAdapt,
                            fit: BoxFit.cover,
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
                        'Nama Lengkap : ${biodata.namaLengkap}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Jenis Kelamin : ${biodata.jenisKelamin}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'No Handpone : ${biodata.noHandphone}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Tanggal Lahir : ${biodata.tanggalLahir}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Nama Ibu Kandung : ${biodata.namaIbuKandung}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Nama Ayah Kandung : ${biodata.namaAyahKandung}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Alamat Sekarang : ${biodata.alamatSekarang}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Kewarganegaraan : ${biodata.kewarganegaraan}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Agama : ${biodata.agama}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Pendidikan Terakhir : ${biodata.pendidikanTerakhir}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Pekerjaan : ${biodata.pekerjaan}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Status Perkawinan : ${biodata.statusPerkawinan}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'No KTP : ${biodata.noKtp}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'No Kartu Keluarga : ${biodata.noKartuKeluarga}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        'Deskripsi : ${biodata.deskripsi}',
                        style: whiteTextstyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Foto KTP : ${biodata.fotoKTP}',
                        style: whiteTextstyle.copyWith(
                            fontSize: 20, fontWeight: bold),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 210,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 5,
                          ),
                        ),
                        child: () {
                          if (biodata.fotoKTP.toLowerCase().endsWith('.pdf')) {
                            return Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await downloadFile(
                                      '${Api.img}/${biodata.fotoKTP}',
                                      biodata.fotoKTP);
                                },
                                child: Text('Download PDF'),
                              ),
                            );
                          } else {
                            try {
                              String a = '${biodata.fotoKTP}';
                              // Separate filename and extension
                              int dotIndex = a.lastIndexOf('.');
                              String b = a.substring(0, dotIndex); // Filename
                              String extension =
                                  a.substring(dotIndex); // Extension

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  '${Api.img}/$b$extension',
                                  fit: BoxFit.cover,
                                ),
                              );
                            } catch (e) {
                              // Print a message indicating that an exception occurred, but continue execution
                              print('Exception occurred, but continuing: $e');
                              return Container(); // You can replace this with a suitable fallback widget or an empty container
                            }
                          }
                        }(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Foto KK : ${biodata.fotoKK}',
                        style: whiteTextstyle.copyWith(
                            fontSize: 20, fontWeight: bold),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 210,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 5,
                          ),
                        ),
                        child: () {
                          if (biodata.fotoKK.toLowerCase().endsWith('.pdf')) {
                            return Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await downloadFile(
                                      '${Api.img}/${biodata.fotoKK}',
                                      biodata.fotoKK);
                                },
                                child: Text('Download PDF'),
                              ),
                            );
                          } else {
                            try {
                              String a = '${biodata.fotoKK}';
                              // Separate filename and extension
                              int dotIndex = a.lastIndexOf('.');
                              String b = a.substring(0, dotIndex); // Filename
                              String extension =
                                  a.substring(dotIndex); // Extension

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  '${Api.img}/$b$extension',
                                  fit: BoxFit.cover,
                                ),
                              );
                            } catch (e) {
                              // Print a message indicating that an exception occurred, but continue execution
                              print('Exception occurred, but continuing: $e');
                              return Container(); // You can replace this with a suitable fallback widget or an empty container
                            }
                          }
                        }(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Foto Tambahan Lain : ${biodata.fotoLain}',
                        style: whiteTextstyle.copyWith(
                            fontSize: 20, fontWeight: bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 210,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 5,
                          ),
                        ),
                        child: () {
                          if (biodata.fotoLain.toLowerCase().endsWith('.pdf')) {
                            return Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await downloadFile(
                                      '${Api.img}/${biodata.fotoLain}',
                                      biodata.fotoLain);
                                },
                                child: Text('Download PDF'),
                              ),
                            );
                          } else {
                            try {
                              String a = '${biodata.fotoLain}';
                              // Separate filename and extension
                              int dotIndex = a.lastIndexOf('.');
                              String b = a.substring(0, dotIndex); // Filename
                              String extension =
                                  a.substring(dotIndex); // Extension

                              print(TemporIMGProfile().imgpAdapt);

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  '${Api.img}/$b$extension',
                                  fit: BoxFit.cover,
                                ),
                              );
                            } catch (e) {
                              // Print a message indicating that an exception occurred, but continue execution
                              print('Exception occurred, but continuing: $e');
                              return Container(); // You can replace this with a suitable fallback widget or an empty container
                            }
                          }
                        }(),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()));
                        },
                        child: Text(
                          'Edit Profile',
                          style: primaryTextstyle.copyWith(
                              fontWeight: bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
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
