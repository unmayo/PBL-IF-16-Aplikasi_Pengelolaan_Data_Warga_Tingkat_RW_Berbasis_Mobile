import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color whiteColor = Color(0xffffffff);
Color textColor = Color(0xff0D0140);
Color secondaryTextColor = Color(0xff524B6B);
Color buttonColor = Color(0xffE6E1FF);
Color primaryButtonColor = Color(0xff130160);
Color tncButtonColor = Color(0xffFF9228);
Color greyColor = Colors.grey;
Color redColor = Colors.red;
Color colorpath = Color(0xff5C469C);
Color colorpath1 = Color(0xff12486B);
Color colorpath2 = Color(0xff419197);

TextStyle whiteTextstyle = GoogleFonts.dmSans(
  color: whiteColor,
);
TextStyle textTextstyle = GoogleFonts.dmSans(
  color: textColor,
);
TextStyle secondaryTextstyle = GoogleFonts.dmSans(
  color: secondaryTextColor,
);
TextStyle tncTextstyle = GoogleFonts.dmSans(
  color: tncButtonColor,
);
TextStyle greyTextstyle = GoogleFonts.dmSans(
  color: greyColor,
);
TextStyle redTextstyle = GoogleFonts.dmSans(
  color: redColor,
);
TextStyle primaryTextstyle = GoogleFonts.dmSans(
  color: primaryButtonColor,
);

FontWeight bold = FontWeight.bold;

class UserNik {
  static final UserNik _instance = UserNik._internal();

  factory UserNik() {
    return _instance;
  }

  UserNik._internal();

  String nik = '';
}

class UserKK {
  static final UserKK _instanc = UserKK._internal();

  factory UserKK() {
    return _instanc;
  }

  UserKK._internal();

  String kk = '';
}

class UserAjuan {
  static final UserAjuan _instanci = UserAjuan._internal();

  factory UserAjuan() {
    return _instanci;
  }

  UserAjuan._internal();

  String aju = '';

  void resetValues() {
    aju = '';
  }
}

class AjuanIMG {
  static final AjuanIMG _instanco = AjuanIMG._internal();

  factory AjuanIMG() {
    return _instanco;
  }

  AjuanIMG._internal();

  String aju_img = '';

  void resetValues() {
    aju_img = '';
  }
}

class TemporNik {
  static final TemporNik _instance = TemporNik._internal();

  factory TemporNik() {
    return _instance;
  }

  TemporNik._internal();

  String nikC = '';

  void resetValues() {
    nikC = '';
  }
}

class TemporIMG {
  static final TemporIMG _instance = TemporIMG._internal();

  factory TemporIMG() {
    return _instance;
  }

  TemporIMG._internal();

  String img = '';

  void resetValues() {
    img = '';
  }
}

class TemporKK {
  static final TemporKK _instance = TemporKK._internal();

  factory TemporKK() {
    return _instance;
  }

  TemporKK._internal();

  String tkk = '';

  void resetValues() {
    tkk = '';
  }
}

class TemporIMGProfile {
  static final TemporIMGProfile _instance = TemporIMGProfile._internal();

  factory TemporIMGProfile() {
    return _instance;
  }

  TemporIMGProfile._internal();

  String imgp = '';
  String imgpAdapt = '';

  void resetValuesA() {
    imgp = '';
  }

  void resetValuesB() {
    imgpAdapt = ''; // Reset only imgpAdapt
  }
}

class PengajuanKey {
  static final PengajuanKey _instance = PengajuanKey._internal();

  factory PengajuanKey() {
    return _instance;
  }

  PengajuanKey._internal();

  String key = '';
  String surat = '';

  void resetValues() {
    key = '';
  }

  void resetValuesB() {
    key = '';
  }
}

class RT {
  static final RT _instance = RT._internal();

  factory RT() {
    return _instance;
  }

  RT._internal();

  late int _rt; // Make it private

  int get rt => _rt;

  set rt(int value) {
    _rt = value;
  }

  void resetValues() {
    _rt = 0; // Reset to a default value
  }
}

class RiwayatUser {
  static final RiwayatUser _instance = RiwayatUser._internal();

  factory RiwayatUser() {
    return _instance;
  }

  RiwayatUser._internal();

  String Deskripsi = '';
  String no_unik = '';
  String jenis_surat = '';
  String surat_path = '';

  void resetValues() {
    Deskripsi = '';
    no_unik = '';
    jenis_surat = '';
    surat_path = '';
  }
}
