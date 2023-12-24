import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/pendataan.dart';
import 'package:pendawa/pengajuan.dart';
import 'package:pendawa/profile.dart';
import 'package:pendawa/settings.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';

class MyProfileImage extends StatelessWidget {
  const MyProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileImagePage(),
    );
  }
}

class ProfileImagePage extends StatefulWidget {
  const ProfileImagePage({super.key});

  @override
  State<ProfileImagePage> createState() => _ProfileImagePageState();
}

class _ProfileImagePageState extends State<ProfileImagePage> {
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

  Future<void> uploadFiles(String no_ktpB, String filepath) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.uploadprofileimg),
      );

      request.fields['no_ktp'] = no_ktpB; // Add 'no_ktp' as a POST field

      if (filepath != 'failed') {
        request.files.add(
          await http.MultipartFile.fromPath('file_profile', filepath),
        );
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Files upload successful');
      } else {
        print('Files upload failed with status ${response.statusCode}');
      }
    } catch (e) {
      print("Error uploading files: $e");
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> AddAcc(String profile_image, String no_ktpB) async {
    final response = await http.post(
      Uri.parse(Api.profilepicedit),
      body: {'profile_image': profile_image, 'nik': no_ktpB},
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
                        MaterialPageRoute(builder: (context) => ProfilePage()));
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
                  'Ubah Gambar Profil',
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
                    'Upload Foto Profil Anda',
                    style: primaryTextstyle.copyWith(
                        fontSize: 15, fontWeight: bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Upload Foto Profil Anda ( JPEG, JPG, )',
                    style: primaryTextstyle.copyWith(fontSize: 12),
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
                        color: primaryButtonColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Upload Foto Profil Anda',
                      style: primaryTextstyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
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
                          backgroundColor: primaryButtonColor),
                      onPressed: () {
                        String no_ktpB = TemporNik().nikC;
                        //FOTO KK ALTER
                        // Extract file name and extension
                        String nameWithoutExtensionLain =
                            selectedFileName.split('.').first;
                        String fileExtensionLain =
                            selectedFileName.split('.').last;
                        // Alter the file name by adding no_ktpB
                        String profile_image =
                            '$nameWithoutExtensionLain.$no_ktpB.$fileExtensionLain';

                        uploadFiles(no_ktpB, filepath);
                        AddAcc(profile_image, no_ktpB);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DataPage()));
                      },
                      child: Text(
                        'Kirim',
                        style: whiteTextstyle.copyWith(
                            fontWeight: bold, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
