class Api {
  // static const _host = 'http://192.168.1.5/PBL%202';
  static const _host = 'https://pendawa16.000webhostapp.com/';
  static String _Anggota = '$_host/user';
  static String _Account = '$_host/account';
  static String _pengajuan = '$_host/pengajuan';
  static String img = '$_host/images';
  static String _surat = '$_host/surat';
  static String profileimg = '$_host/profilesimg';
  static String surat = '$_host/surat';

  static String login = '$_host/login.php';
  static String uploadimg = '$_host/upload.php';
  static String uploadprofileimg = '$_host/upload_profileimg.php';
  static String downloadimg = '$_host/download.php';

  /// Account
  static String addAccount = '$_Account/add_account.php';
  static String deleteAccount = '$_Account/delete_account.php';
  static String getAccount = '$_Account/get_account.php';
  static String updateAccount = '$_Account/update_account.php';

  /// Anggota
  static String addAnggota = '$_Anggota/add_anggota.php';
  static String addAnggotaIMG = '$_Anggota/add_anggota_img.php';
  static String deleteAnggota = '$_Anggota/delete_anggota.php';
  static String getAnggota = '$_Anggota/get_anggota.php';
  static String getKeluarga = '$_Anggota/get_anggota_keluarga.php';
  static String getKeluargaA = '$_Anggota/get_anggota_keluarga_admin.php';
  static String updateAnggota = '$_Anggota/update_anggota.php';
  static String namanik = '$_Anggota/find_nama.php';
  static String profilepicedit = '$_Anggota/add_profile_pic.php';

  /// Pengajuan
  static String addPengajuan = '$_pengajuan/add_pengajuan.php';
  static String getPengajuan = '$_pengajuan/get_pengajuan.php';
  static String getPengajuanAdmin = '$_pengajuan/get_pengajuan_admin.php';
  static String getPengajuanAdminRT = '$_pengajuan/get_pengajuan_adminRT.php';
  static String getRiwayat = '$_pengajuan/get_riwayat.php';
  static String diTolak = '$_pengajuan/di_tolak.php';
  static String diKonfirmasi = '$_pengajuan/di_konfirmasi.php';
  static String getRiwayatAdmin = '$_pengajuan/get_riwayat_admin.php';
  static String suratadd = '$_pengajuan/add_surat.php';
  static String _imgpengajuan = '$_pengajuan/imgpengajuan';
  static String imgpengajuan_directory = '$_pengajuan/imgpengajuan';
  static String imgpengajuan = '$_imgpengajuan/upload_img_pengajuan.php';

  // Surat
  static String uploadsurat = '$_surat/upload_surat.php';
}
