import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/pendataan.dart';
import 'package:pendawa/pengajuan.dart';
import 'package:pendawa/settings.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';
import 'package:path/path.dart';

class MySuratPengajuan extends StatelessWidget {
  const MySuratPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SuratPengajuanPage(),
    );
  }
}

class SuratPengajuanPage extends StatefulWidget {
  const SuratPengajuanPage({super.key});

  @override
  State<SuratPengajuanPage> createState() => _SuratPengajuanPageState();
}

class _SuratPengajuanPageState extends State<SuratPengajuanPage> {
  String filepathKTP = '';
  String filepathKK = '';
  String filepathLain = '';
  String selectedGender = '';
  String selectedKewarganegaraan = '';
  String selectedPerkawinan = '';
  DateTime selectedDate = DateTime.now();
  String ajuan = UserAjuan().aju;
  String ajuan_img = AjuanIMG().aju_img;

  late String selectedFileNameKTP;
  late String selectedFileNameKK;
  late String selectedFileNameLain;

  void chooseFileKTP() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filepathKTP = result.files.single.path!;
        selectedFileNameKTP = basename(filepathKTP);
      });
      print('File yand dipilih: $filepathKTP');
    } else {
      filepathKTP = 'failed';
    }
  }

  void chooseFileKK() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filepathKK = result.files.single.path!;
        selectedFileNameKK = basename(filepathKK);
      });
      print('File yand dipilih: $filepathKK');
    } else {
      filepathKK = 'failed';
    }
  }

  void chooseFileLain() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filepathLain = result.files.single.path!;
        selectedFileNameLain = basename(filepathLain);
      });
      print('File yand dipilih: $filepathLain');
    } else {
      filepathLain = 'failed';
    }
  }

  Future<void> uploadFiles(String no_ktpB, String filepathKTP,
      String filepathKK, String filepathLain) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.imgpengajuan),
      );

      request.fields['no_ktp'] = no_ktpB; // Add 'no_ktp' as a POST field

      if (filepathKTP != 'failed') {
        request.files.add(
          await http.MultipartFile.fromPath('file_ktp', filepathKTP),
        );
      }

      if (filepathKK != 'failed') {
        request.files.add(
          await http.MultipartFile.fromPath('file_kk', filepathKK),
        );
      }

      if (filepathLain != 'failed') {
        request.files.add(
          await http.MultipartFile.fromPath('file_lain', filepathLain),
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

  final TextEditingController no_rtController = TextEditingController();
  final TextEditingController nama_lengkapController = TextEditingController();
  final TextEditingController no_handphoneController = TextEditingController();
  final TextEditingController tanggal_lahirController = TextEditingController();
  final TextEditingController nama_ibu_kandungController =
      TextEditingController();
  final TextEditingController nama_ayah_kandungController =
      TextEditingController();
  final TextEditingController alamat_sekarangController =
      TextEditingController();
  final TextEditingController agamaController = TextEditingController();
  final TextEditingController pendidikan_terakhirController =
      TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController no_ktpController = TextEditingController();
  final TextEditingController no_kartu_keluargaController =
      TextEditingController();
  final TextEditingController foto_ktpController = TextEditingController();
  final TextEditingController foto_kartu_keluargaController =
      TextEditingController();
  final TextEditingController foto_pendukung_lainController =
      TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  Future<void> AddAcc(
      int no_rt,
      String ajuan,
      String nama_lengkapB,
      String jenis_kelaminB,
      String no_handphoneB,
      String tanggal_lahirB,
      String nama_ibu_kandungB,
      String nama_ayah_kandungB,
      String alamat_sekarangB,
      String kewarganegaraanB,
      String agamaB,
      String pendidikan_terakhirB,
      String pekerjaanB,
      String status_perkawinanB,
      String no_ktpB,
      String no_kartu_keluargaB,
      String foto_ktpB,
      String foto_kartu_keluargaB,
      String foto_pendukung_lainB,
      String deskripsiB,
      String formattedDate,
      String nikloged) async {
    final response = await http.post(
      Uri.parse(Api.addPengajuan),
      body: {
        'no_rt': no_rt.toString(),
        'jenis_surat': ajuan,
        'nama_lengkap': nama_lengkapB,
        'jenis_kelamin': jenis_kelaminB,
        'no_handphone': no_handphoneB,
        'tanggal_lahir': tanggal_lahirB,
        'nama_ibu_kandung': nama_ibu_kandungB,
        'nama_ayah_kandung': nama_ayah_kandungB,
        'alamat_sekarang': alamat_sekarangB,
        'kewarganegaraan': kewarganegaraanB,
        'agama': agamaB,
        'pendidikan_terakhir': pendidikan_terakhirB,
        'pekerjaan': pekerjaanB,
        'status_perkawinan': status_perkawinanB,
        'no_ktp': no_ktpB,
        'no_kartu_keluarga': no_kartu_keluargaB,
        'foto_ktp': foto_ktpB,
        'foto_kartu_keluarga': foto_kartu_keluargaB,
        'foto_pendukung_lain': foto_pendukung_lainB,
        'deskripsi': deskripsiB,
        'tgl_upload': formattedDate,
        'nik_pengaju': nikloged
      },
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
          ajuan = UserAjuan().aju;
          if (index == 0) {
            UserAjuan().resetValues();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 1) {
            UserAjuan().resetValues();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PengajuanPage()));
          } else if (index == 2) {
            UserAjuan().resetValues();
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
                    UserAjuan().resetValues();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PengajuanPage()));
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
                                    image: AssetImage('$ajuan_img')),
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
                          'Pengajuan $ajuan.',
                          style: primaryTextstyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Silakan isi data sesuai Keterangan.',
                          style: redTextstyle.copyWith(
                              fontSize: 15, fontWeight: bold),
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
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Lengkap',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Column(
                    children: [
                      TextField(
                        controller: nama_lengkapController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Nama Lengkap',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jenis Kelamin',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 'Laki - Laki',
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                }),
                            Text(
                              'Laki - Laki',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        SizedBox(width: 30),
                        Row(
                          children: [
                            Radio(
                                value: 'Perempuan',
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                }),
                            Text(
                              'Perempuan',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No Handphone',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Column(
                    children: [
                      TextField(
                        controller: no_handphoneController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Nomor Handphone',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanggal Lahir',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: AbsorbPointer(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid)),
                      child: TextFormField(
                        controller: TextEditingController(
                          text: selectedDate.toLocal().toString().split(' ')[0],
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tanggal Lahir',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            suffixIcon: Icon(Icons.calendar_month),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Ibu Kandung',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Column(
                    children: [
                      TextField(
                        controller: nama_ibu_kandungController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan sesuai data',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Ayah Kandung',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Column(
                    children: [
                      TextField(
                        controller: nama_ayah_kandungController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Sesuai data',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alamat Sekarang',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: alamat_sekarangController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Alamat Lengkap',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kewarganegaraan',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 'WNI',
                                groupValue: selectedKewarganegaraan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedKewarganegaraan = value!;
                                  });
                                }),
                            Text(
                              'WNI',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        SizedBox(width: 30),
                        Row(
                          children: [
                            Radio(
                                value: 'WNA',
                                groupValue: selectedKewarganegaraan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedKewarganegaraan = value!;
                                  });
                                }),
                            Text(
                              'WNA',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Agama',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Column(
                    children: [
                      TextField(
                        controller: agamaController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan sesuai data',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pendidikan Terakhir',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Column(
                    children: [
                      TextField(
                        controller: pendidikan_terakhirController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Pendidikan Terakhir',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pekerjaan',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  child: Column(
                    children: [
                      TextField(
                        controller: pekerjaanController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Pekerjaan Sekarang',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status Perkawinan',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 'Kawin',
                                groupValue: selectedPerkawinan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPerkawinan = value!;
                                  });
                                }),
                            Text(
                              'Kawin',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'Tidak Kawin',
                                groupValue: selectedPerkawinan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPerkawinan = value!;
                                  });
                                }),
                            Text(
                              'Tidak Kawin',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'Cerai',
                                groupValue: selectedPerkawinan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPerkawinan = value!;
                                  });
                                }),
                            Text(
                              'Cerai',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No. KTP',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: no_ktpController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan sesuai data',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No. Kartu Keluarga',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: no_kartu_keluargaController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan sesuai data',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No. RT',
                  style:
                      primaryTextstyle.copyWith(fontSize: 15, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid)),
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: no_rtController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan nomor RT (example: 1)',
                            hintStyle: primaryTextstyle.copyWith(fontSize: 12),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
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
              onTap: chooseFileKTP,
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
              onTap: chooseFileKK,
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
              onTap: chooseFileLain,
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
                  controller: deskripsiController,
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
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButtonColor),
                      onPressed: () {
                        // Get values from text fields
                        String no_rtB = no_rtController.text;
                        int no_rt = int.parse(no_rtB);
                        String nama_lengkapB = nama_lengkapController.text;
                        String jenis_kelaminB = selectedGender;
                        String no_handphoneB = no_handphoneController.text;
                        String tanggal_lahirB = DateFormat('yyyy-MM-dd')
                            .format(selectedDate.toLocal());
                        ;
                        String nama_ibu_kandungB =
                            nama_ibu_kandungController.text;
                        String nama_ayah_kandungB =
                            nama_ayah_kandungController.text;
                        String alamat_sekarangB =
                            alamat_sekarangController.text;
                        String kewarganegaraanB = selectedKewarganegaraan;
                        String agamaB = agamaController.text;
                        String pendidikan_terakhirB =
                            pendidikan_terakhirController.text;
                        String pekerjaanB = pekerjaanController.text;
                        String status_perkawinanB = selectedPerkawinan;
                        String no_ktpB = no_ktpController.text;
                        String no_kartu_keluargaB =
                            no_kartu_keluargaController.text;
                        String deskripsiB = deskripsiController.text;
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(DateTime.now());
                        String nikloged = UserNik().nik;

                        //FOTO KTP ALTER
                        // Extract file name and extension
                        String nameWithoutExtensionKTP =
                            selectedFileNameKTP.split('.').first;
                        String fileExtensionKTP =
                            selectedFileNameKTP.split('.').last;
                        // Alter the file name by adding no_ktpB
                        String foto_ktpB =
                            '$nameWithoutExtensionKTP.$no_ktpB.$fileExtensionKTP';
                        //FOTO KK ALTER
                        // Extract file name and extension
                        String nameWithoutExtensionKK =
                            selectedFileNameKK.split('.').first;
                        String fileExtensionKK =
                            selectedFileNameKK.split('.').last;
                        // Alter the file name by adding no_ktpB
                        String foto_kartu_keluargaB =
                            '$nameWithoutExtensionKK.$no_ktpB.$fileExtensionKK';
                        //FOTO KK ALTER
                        // Extract file name and extension
                        String nameWithoutExtensionLain =
                            selectedFileNameLain.split('.').first;
                        String fileExtensionLain =
                            selectedFileNameLain.split('.').last;
                        // Alter the file name by adding no_ktpB
                        String foto_pendukung_lainB =
                            '$nameWithoutExtensionLain.$no_ktpB.$fileExtensionLain';
                        // Get password from TextField controller or however you manage it
                        // Upload the file IMG
                        uploadFiles(
                            no_ktpB, filepathKTP, filepathKK, filepathLain);
                        // Call AddAcc function
                        AddAcc(
                            no_rt,
                            ajuan,
                            nama_lengkapB,
                            jenis_kelaminB,
                            no_handphoneB,
                            tanggal_lahirB,
                            nama_ibu_kandungB,
                            nama_ayah_kandungB,
                            alamat_sekarangB,
                            kewarganegaraanB,
                            agamaB,
                            pendidikan_terakhirB,
                            pekerjaanB,
                            status_perkawinanB,
                            no_ktpB,
                            no_kartu_keluargaB,
                            foto_ktpB,
                            foto_kartu_keluargaB,
                            foto_pendukung_lainB,
                            deskripsiB,
                            formattedDate,
                            nikloged);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PengajuanPage()));
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
