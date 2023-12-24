import 'package:flutter/material.dart';
import 'package:pendawa/login.dart';
import 'package:pendawa/settings.dart';

class MySign extends StatelessWidget {
  const MySign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignPage(),
    );
  }
}

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EFEF),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Membuat Akun Baru',
                  style: textTextstyle.copyWith(fontSize: 30, fontWeight: bold),
                ),
                SizedBox(height: 1),
                Text(
                  'Aplikasi Pengelolaan Data Warga Tingkat RW Berbasis Mobile. Perumahan Mega Legenda',
                  style: secondaryTextstyle.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Induk Keluarga (NIK)',
                      style: textTextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan NIK',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Lengkap',
                      style: textTextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Nama Lengkap',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Telepon',
                      style: textTextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Nomor Telepon',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alamat',
                      style: textTextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Alamat Lengkap',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: textTextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Email',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Password',
                      style: textTextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          suffixIcon: Icon(Icons.visibility_off),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Konfirmasi Password',
                      style: textTextstyle.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          suffixIcon: Icon(Icons.visibility_off),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryButtonColor),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Text(
                      'SIGN UP',
                      style: whiteTextstyle.copyWith(fontWeight: bold),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 19),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: buttonColor),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MASUK DENGAN GOOGLE',
                          style: textTextstyle.copyWith(fontWeight: bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      child: Text(
                        'Anda Sudah Memiliki Akun?',
                        style: tncTextstyle.copyWith(
                            fontSize: 12, fontWeight: bold),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
