import 'package:flutter/material.dart';
import 'package:pendawa/nextsign.dart';
import 'package:pendawa/settings.dart';
import 'package:http/http.dart' as http;
import 'package:pendawa/api.dart';

class MySign extends StatelessWidget {
  const MySign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignPage(),
    );
  }
}

// Define controllers
final TextEditingController KKController = TextEditingController();
TextEditingController nomorRTController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
Future<void> signUp(BuildContext context, String kartuKeluarga, String password,
    int? no_rt) async {
  try {
    final response = await http.post(
      Uri.parse(Api.addAccount),
      body: {
        'kartu_keluarga': kartuKeluarga,
        'password': password,
        'no_rt':
            (no_rt ?? 0).toString(), // Provide a default value or handle null
      },
    );

    if (response.statusCode == 200) {
      // PHP script executed successfully
      print(response.body); // This will print the response message from PHP

      // You can handle the response further based on your requirements
      if (response.body.contains('User signed up successfully!')) {
        // Handle success
        //next page
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NextSignPage()));
      } else if (response.body.contains('Kartu Keluarga already exists!')) {
        // Handle kartu_keluarga already exists error
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(
                  'Kartu Keluarga already exists! Please contact admin for further assistance.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle other errors
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(
                  'An unknown error occurred. Please contact admin for further assistance.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Handle errors (HTTP status code other than 200)
      print('Error: ${response.statusCode}');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content:
                Text('An error occurred. Status code: ${response.statusCode}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  } catch (e) {
    // Handle exceptions
    print('Exception: $e');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exception'),
          content: Text('An exception occurred: $e'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
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
                SizedBox(height: 30),
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
                      'Nomor Kartu Keluarga ( KK )',
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
                        controller: KKController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan no KK',
                          hintStyle: textTextstyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Nomor RT', // New label for Nomor RT
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
                        controller:
                            nomorRTController, // You need to define nomorRTController
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              'Masukkan Nomor RT', // Customize the hint text
                          hintStyle: textTextstyle.copyWith(
                            fontSize: 12,
                            color: textColor.withOpacity(0.6),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
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
                        controller: passwordController,
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
                        controller: confirmPasswordController,
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
                    // Add the ElevatedButton here
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButtonColor,
                        ),
                        onPressed: () {
                          //set to nothing
                          TemporKK().resetValues();
                          // Get values from text fields
                          String kartu_keluarga = KKController.text;
                          String no_rtB = nomorRTController.text;
                          int? no_rt = int.tryParse(no_rtB);
                          // I need the nik again for later
                          RT().resetValues();
                          RT().rt = no_rt ??
                              0; // Use a default value (0 in this case) if no_rt is null
                          TemporKK().tkk = KKController.text;
                          // Get NIK from TextField controller or however you manage it
                          String password = passwordController
                              .text; // Get password from TextField controller or however you manage it

                          // Call signUp function
                          signUp(context, kartu_keluarga, password, no_rt);
                        },
                        child: Text(
                          'NEXT SIGN UP',
                          style: whiteTextstyle.copyWith(fontWeight: bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
