import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_widget/count_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'Sliver Example', home: const SliverDemoPage());
//   }
// }

class SliverDemoPage extends StatelessWidget {
  const SliverDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(2, (i) => 'Item List #$i');
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.red,
    ];
    final image =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Kelimutu_2008-08-08.jpg/800px-Kelimutu_2008-08-08.jpg';
    final images = [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Kelimutu_2008-08-08.jpg/800px-Kelimutu_2008-08-08.jpg',
      'https://cdn.pixabay.com/photo/2016/12/09/11/51/lake-toba-1894746_960_720.jpg',
    ];
    return Scaffold(
      body: CustomScrollView(
        // physics: CarouselScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sliver Widgets'),
              // background: Container(
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight,
              //       colors: [Color(0xFF2A5BB1), Color(0xFF245FA6)],
              //     ),
              //   ),
              //   child: Align(
              //     alignment: Alignment.bottomLeft,
              //     child: Padding(
              //       padding: EdgeInsets.all(16),
              //       child: Text(
              //         'Appbar Yang Collapsable',
              //         style: TextStyle(color: Colors.white70),
              //       ),
              //     ),
              //   ),
              // ),
              background: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                child: ListTile(
                  title: const Text('SliverToBoxAdapter'),
                  subtitle: const Text(
                    'Ini Widget Biasa di dalam CustomSCrollView',
                  ),
                  trailing: FilledButton(
                    onPressed: () {},
                    child: const Text('Aksi'),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.separated(
              itemBuilder: (_, i) => ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(image: images[i], index: i),
                    ),
                  );
                },
                leading: Hero(
                  tag: i,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(images[i]),
                  ),
                ),
                title: Text(items[i]),
                subtitle: const Text('item di SliverList'),
              ),
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemCount: items.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: colors[index % colors.length].withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colors[index % colors.length].withOpacity(0.5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Grid #$index',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                );
              }, childCount: 12),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.index, required this.image});

  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tourism Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: index,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(image, width: 200),
              ),
            ),
            const SizedBox.square(dimension: 16),
            Text(
              'Item #$index Detail',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox.square(dimension: 16),
            Text(
              'Ini Halaman Detail untuk Item #$index',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
