import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pendawa/home.dart';
import 'package:pendawa/pendataan.dart';
import 'package:pendawa/pengajuan.dart';
import 'package:pendawa/settings.dart';

class MyDataKeluarga extends StatelessWidget {
  const MyDataKeluarga({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataKeluargaPage(),
    );
  }
}

class DataKeluargaPage extends StatefulWidget {
  const DataKeluargaPage({super.key});

  @override
  State<DataKeluargaPage> createState() => _DataKeluargaPageState();
}

class _DataKeluargaPageState extends State<DataKeluargaPage> {
  String filepath = '';
  String selectedGender = '';
  String selectedKewarganegaraan = '';
  String selectedAgama = '';
  String selectedPendidikan = '';
  String selectedPekerjaan = '';
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
                        MaterialPageRoute(builder: (context) => DataPage()));
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
                  'Tambah Anggota Keluarga',
                  style:
                      primaryTextstyle.copyWith(fontSize: 25, fontWeight: bold),
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
                Text(
                  'Wajib di isi.',
                  style: redTextstyle.copyWith(fontSize: 13, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Surat yang harus dipersiapkan :',
                  style: redTextstyle.copyWith(fontSize: 13, fontWeight: bold),
                ),
                Text(
                  '- Kartu Keluarga',
                  style: redTextstyle.copyWith(fontSize: 13, fontWeight: bold),
                ),
                Text(
                  '- Surat / Kartu Identitas (KTP,KTM)*',
                  style: redTextstyle.copyWith(fontSize: 13, fontWeight: bold),
                ),
                Text(
                  '- Foto Anggota*',
                  style: redTextstyle.copyWith(fontSize: 13, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Tanda * berarti opsional.',
                  style: redTextstyle.copyWith(fontSize: 13, fontWeight: bold),
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
                    'Upload Foto Anggota Keluarga',
                    style: primaryTextstyle.copyWith(
                        fontSize: 15, fontWeight: bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Upload Foto Kartu Tanda Penduduk ( JPEG, JPG, PNG )',
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
                      'Upload Foto Anggota Keluarga',
                      style: primaryTextstyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
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
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Row(
                            children: [
                              Radio(
                                  value: 'Laki - Laki',
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value!;
                                    });
                                  }),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  'Laki - Laki',
                                  style:
                                      primaryTextstyle.copyWith(fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
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
                  'Tempat Tanggal Lahir',
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
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Row(
                            children: [
                              Radio(
                                  value: 'WNI',
                                  groupValue: selectedKewarganegaraan,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedKewarganegaraan = value!;
                                    });
                                  }),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  'WNI',
                                  style:
                                      primaryTextstyle.copyWith(fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 50),
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
            margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    child: Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 'Islam',
                                  groupValue: selectedAgama,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAgama = value!;
                                    });
                                  }),
                              Text(
                                'Islam',
                                style: primaryTextstyle.copyWith(fontSize: 13),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Kristen',
                                  groupValue: selectedAgama,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAgama = value!;
                                    });
                                  }),
                              Text(
                                'Kristen',
                                style: primaryTextstyle.copyWith(fontSize: 13),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Khatolik',
                                  groupValue: selectedAgama,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAgama = value!;
                                    });
                                  }),
                              Text(
                                'Khatolik',
                                style: primaryTextstyle.copyWith(fontSize: 13),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Budha',
                                  groupValue: selectedAgama,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAgama = value!;
                                    });
                                  }),
                              Text(
                                'Budha',
                                style: primaryTextstyle.copyWith(fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      ),
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
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 'SD',
                                groupValue: selectedPendidikan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPendidikan = value!;
                                  });
                                }),
                            Text(
                              'SD',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: [
                            Radio(
                                value: 'SLTP',
                                groupValue: selectedPendidikan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPendidikan = value!;
                                  });
                                }),
                            Text(
                              'SLTP',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: [
                            Radio(
                                value: 'SLTA',
                                groupValue: selectedPendidikan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPendidikan = value!;
                                  });
                                }),
                            Text(
                              'SLTA',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: [
                            Radio(
                                value: 'Sarjana',
                                groupValue: selectedPendidikan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPendidikan = value!;
                                  });
                                }),
                            Text(
                              'Sarjana',
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
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 'Swasta',
                                groupValue: selectedPekerjaan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPekerjaan = value!;
                                  });
                                }),
                            Text(
                              'Swasta',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'BUMN',
                                groupValue: selectedPekerjaan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPekerjaan = value!;
                                  });
                                }),
                            Text(
                              'BUMN',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'PNS',
                                groupValue: selectedPekerjaan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPekerjaan = value!;
                                  });
                                }),
                            Text(
                              'PNS',
                              style: primaryTextstyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'Lainnya',
                                groupValue: selectedPekerjaan,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPekerjaan = value!;
                                  });
                                }),
                            Text(
                              'Lainnya',
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
                                    selectedPekerjaan = value!;
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
                  'No. KTP/SIM/Paspor',
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
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButtonColor),
                      onPressed: () {
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
