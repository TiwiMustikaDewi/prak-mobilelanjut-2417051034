import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _besar = false;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _bukaDetail() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondary) => const DetailPage(),
        transitionsBuilder: (context, animation, secondary, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tanpaGerak = MediaQuery.of(context).disableAnimations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animasi & Aksesibilitas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset kotak',
            onPressed: () => setState(() => _besar = false),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            '1. Implicit Animation',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Center(
            child: Semantics(
              label: _besar ? 'Kotak ukuran besar' : 'Kotak ukuran kecil',
              child: AnimatedContainer(
                duration: Duration(milliseconds: tanpaGerak ? 0 : 500),
                curve: Curves.easeInOut,
                width: _besar ? 200 : 100,
                height: _besar ? 200 : 100,
                decoration: BoxDecoration(
                  color: _besar ? Colors.indigo : Colors.orange,
                  borderRadius: BorderRadius.circular(_besar ? 40 : 8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => setState(() => _besar = !_besar),
            child: const Text('Ubah Kotak'),
          ),
          const Divider(height: 32),
          Text(
            '2. Explicit Animation',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Center(
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.8, end: 1.2).animate(_controller),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 48,
                semanticLabel: 'Ikon hati berdenyut',
              ),
            ),
          ),
          const Divider(height: 32),
          Text(
            '3. Hero & Page Transition',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Center(
            child: Semantics(
              label: 'Buka halaman detail',
              button: true,
              child: InkWell(
                onTap: _bukaDetail,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Hero(
                    tag: 'hero-ikon',
                    child: Icon(
                      Icons.rocket_launch,
                      size: 64,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}