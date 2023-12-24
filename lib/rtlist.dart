import 'package:flutter/material.dart';
import 'package:pendawa/homeadmin.dart';
import 'package:pendawa/pendataanadmin.dart';
import 'package:pendawa/pengajuanadmin.dart';
import 'package:pendawa/settings.dart';

class Myrtlist extends StatelessWidget {
  const Myrtlist({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PendataanAdminPage(),
    );
  }
}

class RTListPage extends StatelessWidget {
  const RTListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataPage(),
    );
  }
}

class DataPage extends StatelessWidget {
  const DataPage({Key? key});

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
      body: ListView.builder(
        itemCount: 10, // Assuming you have 10 RTs
        itemBuilder: (context, index) {
          int rtNumber = index + 1; // RT numbers start from 1
          return buildRTCard(context, rtNumber);
        },
      ),
    );
  }

  Widget buildRTCard(BuildContext context, int rtNumber) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colorpath1, colorpath2],
              stops: [0.3, 0.7],
              begin: Alignment.centerLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('images/adib.jpg')),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 5)),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: IconButton(
                      padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                      onPressed: () {
                        // Handle button press for the specific RT
                        // You can use rtNumber to identify the selected RT
                        print('Button pressed for RT $rtNumber');
                      },
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
                  'RT Nomor ${rtNumber}',
                  style:
                      whiteTextstyle.copyWith(fontSize: 13, fontWeight: bold),
                ),
                Text(
                  'Resident Name', // Replace with actual resident name
                  style: whiteTextstyle.copyWith(fontSize: 12),
                ),
                Text(
                  'Gender', // Replace with actual gender
                  style: whiteTextstyle.copyWith(fontSize: 12),
                ),
                Text(
                  'Phone Number', // Replace with actual phone number
                  style: whiteTextstyle.copyWith(fontSize: 12),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: whiteColor),
                  onPressed: () {
                    RT().resetValues();
                    RT().rt = rtNumber;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PendataanAdminPage()));
                  },
                  child: Text(
                    'Detail Keluarga RT ${rtNumber}',
                    style: primaryTextstyle.copyWith(
                        fontWeight: bold, fontSize: 12),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
