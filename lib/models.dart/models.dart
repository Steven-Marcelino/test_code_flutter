// ignore_for_file: camel_case_types

class dataSample {
  String fav, image;
  int jumlah;

  dataSample(
    this.fav,
    this.image,
    this.jumlah,
  );
}

List<dataSample> sample = sampleData
    .map((item) => dataSample(item['fav'], item['image'], item['jumlah']))
    .toList();

var sampleData = [
  {
    "fav": "91 terjual | Disukai oleh 12",
    "jumlah": 0,
    "image": "assets/makanan1.jpg",
  },
  {
    "fav": "120 terjual | Disukai oleh 100",
    "jumlah": 0,
    "image": "assets/makanan2.jpg",
  },
  {
    "fav": "10 terjual | Disukai oleh 3",
    "jumlah": 0,
    "image": "assets/makanan3.jpg",
  },
  {
    "fav": "20 terjual | Disukai oleh 20",
    "jumlah": 0,
    "image": "assets/makanan4.jpeg",
  },
  {
    "fav": "77 terjual | Disukai oleh 70",
    "jumlah": 0,
    "image": "assets/makanan5.jpg",
  },
  {
    "fav": "17 terjual | Disukai oleh 17",
    "jumlah": 0,
    "image": "assets/jusmang.png",
  },
  {
    "fav": "67 terjual | Disukai oleh 60",
    "jumlah": 0,
    "image": "assets/jusStr.jpg",
  },
];
