import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const GalleryPage(),
    );
  }
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl = 'https://picsum.photos/id/237/600/400/';
    const heroTag = 'doggo-hero';
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DetailPage()),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Hero(
                    tag: heroTag,
                    child: Image(
                      image: NetworkImage(imageUrl),
                      width: 240,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const ListTile(
                    title: Text('Tap untuk lihat detail'),
                    subtitle: Text('Contoh Hero Animation sederhana'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl = 'https://picsum.photos/id/237/600/400/';
    const heroTag = 'doggo-hero';
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image(
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Judul Gambar',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Ini adalah halaman detail. Widget gambar yang sama dibungkus Hero dengan tag identik, sehingga saat navigasi terjadi animasi yang mulus dari ukuran/posisi awal ke tujuan.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
