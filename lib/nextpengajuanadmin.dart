import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pendawa/homeadmin.dart';
import 'package:pendawa/pendataanadmin.dart';
import 'package:pendawa/pengajuanadmin.dart';
import 'package:pendawa/riwayatsurat.dart';
import 'package:pendawa/settings.dart';

class MyNextPengajuanAdmin extends StatelessWidget {
  const MyNextPengajuanAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NextPengajuanAdminPage(),
    );
  }
}

class NextPengajuanAdminPage extends StatefulWidget {
  const NextPengajuanAdminPage({super.key});

  @override
  State<NextPengajuanAdminPage> createState() => _NextPengajuanAdminPageState();
}

class _NextPengajuanAdminPageState extends State<NextPengajuanAdminPage> {
  String filepath = '';
  String selectedGender = '';
  String selectedKewarganegaraan = '';
  String selectedPerkawinan = '';
  DateTime selectedDate = DateTime.now();

  void chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filepath = result.files.single.path!;
      });
      print('File yand dipilih: $filepath');
    } else {
      print('Pemilihan file dibatalkan');
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PendataanAdminPage()));
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
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 20),
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
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/pengajuan1.png')),
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 5))),
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
                          'Pengajuan Surat Pembuatan Kartu Keluarga.',
                          style: primaryTextstyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Nama : Respati Hadinata',
                          style: redTextstyle.copyWith(
                              fontSize: 13, fontWeight: bold),
                        ),
                        Text(
                          'Jenis Kelamin : Laki - Laki',
                          style: redTextstyle.copyWith(
                              fontSize: 13, fontWeight: bold),
                        ),
                        Text(
                          'No Handphone : 082278859597',
                          style: redTextstyle.copyWith(
                              fontSize: 13, fontWeight: bold),
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload Fotokopi KTP',
                    style: primaryTextstyle.copyWith(
                        fontSize: 15, fontWeight: bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Upload Foto Kartu Tanda Penduduk ( JPEG, JPG, PNG, PDF )',
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
                      'Upload Foto KTP',
                      style: primaryTextstyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Upload Fotokopi Kartu Keluarga',
                    style: primaryTextstyle.copyWith(
                        fontSize: 15, fontWeight: bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Upload Foto Kartu Keluarga ( JPEG, JPG, PNG, PDF )',
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
                      'Upload Foto Kartu Keluarga',
                      style: primaryTextstyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Upload Bukti Pendukung Lainnya (Jika Ada)',
                    style: primaryTextstyle.copyWith(
                        fontSize: 15, fontWeight: bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Upload Foto Bukti ( JPEG, JPG, PNG, PDF )',
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
                      'Upload Foto Bukti Lainnya',
                      style: primaryTextstyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deskripsi ( Keterangan Tambahan )",
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 5),
                Text(
                  "*Jika tidak ada pilihan diatas, silakan di tulis Keterangan Tambahan dibawah.",
                  style: redTextstyle.copyWith(fontSize: 13, fontWeight: bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Colors.grey, style: BorderStyle.solid)),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Masukkan Keterangan Tambahan ( Jika Ada ).',
                      hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                ),
              ],
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
                    width: 125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     RiwayatSuratPage()));
                      },
                      child: Text(
                        'Tolak',
                        style: primaryTextstyle.copyWith(
                            fontWeight: bold, fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  SizedBox(
                    height: 38,
                    width: 125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButtonColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     RiwayatSuratPage()));
                      },
                      child: Text(
                        'Terima',
                        style: whiteTextstyle.copyWith(
                            fontWeight: bold, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
