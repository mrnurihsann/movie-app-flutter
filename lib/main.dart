import 'package:flutter/material.dart'; // Import package material untuk komponen UI Flutter.

void main() {
  runApp(MyApp()); // Titik masuk aplikasi.
}

// Kelas MyApp merepresentasikan widget utama aplikasi.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"), // Judul untuk app bar.
          backgroundColor:
              Colors.blueGrey, // Warna latar belakang untuk app bar.
        ),
        backgroundColor:
            Colors.black26, // Warna latar belakang untuk layar utama.
        drawer: Drawer(
          // Widget drawer untuk menu navigasi.
          child: ListView(
            children: [
              // Header drawer akun pengguna.
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Muhammad Ridwan Nur Ihsan", // Nama pengguna.
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                accountEmail: Text(
                    "muhammadridhwannurihsan@gmail.com"), // Email pengguna.
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey, // Warna latar belakang avatar.
                ),
                decoration: BoxDecoration(
                    color: Colors.blueGrey), // Dekorasi untuk header drawer.
              ),
              // List tile untuk opsi navigasi.
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profil"),
              ),
              ListTile(
                leading: Icon(Icons.airplane_ticket_outlined),
                title: Text("Tiket Anda"),
              ),
              ListTile(
                leading: Icon(Icons.save),
                title: Text("Disimpan"),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Tentang"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Pengaturan"),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Keluar"),
              ),
            ],
          ),
        ),
        body:
            MovieTicketBooking(), // Tubuh aplikasi berisi widget MovieTicketBooking.
      ),
    );
  }
}

// Kelas MovieTicketBooking merepresentasikan widget untuk menampilkan kartu film.
class MovieTicketBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Widget scrollable untuk menampilkan beberapa kartu film.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Membangun kartu film menggunakan fungsi _buildMovieCard.
          _buildMovieCard(context, 'Siksa Kubur', 'assets/siksakubur.png',
              'Horor', '8.5/10', '35.000'),
          _buildMovieCard(context, 'Ancika', 'assets/ancika.jpeg',
              'Romance, Drama', '8.3/10', '35.000'),
          _buildMovieCard(context, 'Agak Laen', 'assets/agaklain.jpeg',
              'Horor, Komedi', '8.7/10', '35.000'),
          _buildMovieCard(context, 'Badarawuhi', 'assets/badarawuhi.jpg',
              'Horor', '8.2/10', '35.000'),
          _buildMovieCard(
              context,
              'Petualangan Anak Penangkap Hantu',
              'assets/petualangan.jpg',
              'Horor, Petualangan, Komedi',
              '8/10',
              '35.000'),
          _buildMovieCard(context, 'Sehidup Semati', 'assets/sehidupsemati.jpg',
              'Horor, Tegang', '7.8/10', '35.000'),
        ],
      ),
    );
  }

  // Fungsi untuk membangun kartu film individu.
  Widget _buildMovieCard(BuildContext context, String title, String imagePath,
      String genres, String rating, String harga) {
    return GestureDetector(
      // Gesture detector untuk menangani ketukan pada kartu film.
      onTap: () {
        // Navigasi ke MovieDetailsPage ketika kartu film ditekan.
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieDetailsPage(
                  title: title,
                  imagePath: imagePath,
                  genres: genres,
                  rating: rating,
                  harga: harga)),
        );
      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.asset(
                imagePath,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title, // Judul film.
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Genre: $genres', // Genre film.
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Rating: $rating', // Rating film.
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Harga: $harga', // Harga tiket film.
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas MovieDetailsPage merepresentasikan widget untuk menampilkan detail film.
class MovieDetailsPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String genres;
  final String rating;
  final String harga;

  const MovieDetailsPage(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.genres,
      required this.rating,
      required this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Judul halaman detail film.
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              imagePath, // Gambar film.
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Judul: $title', // Judul film.
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Genre: $genres', // Genre film.
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rating: $rating', // Rating film.
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Harga: $harga', // Harga tiket film.
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Menampilkan dialog box saat tombol ditekan untuk konfirmasi pembelian.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Konfirmasi Pembelian'),
                            content: Text(
                                'Anda telah berhasil memesan tiket untuk $title.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Selesai'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Beli Sekarang'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
