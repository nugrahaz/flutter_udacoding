class DataKamus {
  String kata;
  String terjemahan;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  DataKamus({
    this.kata,
    this.terjemahan,
  });

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory DataKamus.fromJson(Map<String, dynamic> json) => DataKamus(
      kata: json['kata'],
      terjemahan: json['terjemahan'],
  );
}