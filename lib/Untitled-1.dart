import 'package:flutter/material.dart';

class ParcialApp extends StatelessWidget {
  const ParcialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const PantallaBase(i: 0),
        '/favoritos': (_) => const PantallaBase(i: 1),
        '/perfil': (_) => const PantallaBase(i: 2),
        '/turismo': (_) => const TurismoScreen(),
      },
    );
  }
}

class PantallaBase extends StatelessWidget {
  const PantallaBase({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    final rutas = ['/', '/favoritos', '/perfil'];
    final titulos = ['Belleza Natural', 'Favoritos', 'Perfil del Explorador'];
    final pantallas = [
      ListView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              'imagen/prueba.webp',
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: _TarjetaImagen(
                  url:
                      'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=700&q=80',
                  texto: 'Paisajes',
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: _TarjetaImagen(
                  url:
                      'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?auto=format&fit=crop&w=700&q=80',
                  texto: 'Playas',
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Text(
            'Explora los paisajes y adentrate en una aventura',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _BotonRedondo(
                icono: Icons.videocam_outlined,
                fondo: Colors.white,
                colorIcono: Color(0xFF9BD3D5),
              ),
              SizedBox(width: 14),
              _BotonRedondo(
                icono: Icons.mic_off,
                fondo: Colors.white,
                colorIcono: Color(0xFFB7BEC7),
              ),
              SizedBox(width: 14),
              _BotonRedondo(
                icono: Icons.call,
                fondo: Color(0xFFFF5A5F),
                colorIcono: Colors.white,
              ),
            ],
          ),
        ],
      ),
      const Center(child: Text('Pantalla Favoritos')),
      ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
        children: const [
          SizedBox(height: 10),
          CircleAvatar(
            radius: 42,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 70, color: Colors.green),
          ),
          SizedBox(height: 18),
          Text(
            'Viajero del Mundo Natural',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nivel: Guia Ecologico',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 28),
          Text(
            'Resumen del Recorrido',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 22),
          Text(
            'Experiencias Destacadas',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 18),
          _Logro(texto: 'Conociste senderos de montana'),
          SizedBox(height: 14),
          _Logro(texto: 'Recorriste paisajes junto al rio'),
          SizedBox(height: 14),
          _Logro(texto: 'Observaste la biodiversidad del bosque'),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: i == 2
            ? IconButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                icon: const Icon(Icons.arrow_back),
              )
            : IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
        title: Text(titulos[i]),
        centerTitle: true,
      ),
      body: pantallas[i],
      floatingActionButton: i == 0
          ? FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, '/turismo'),
              child: const Icon(Icons.arrow_forward),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i,
        onTap: (x) {
          if (x == 0 || x == 1) {
            return;
          }
          if (x != i) {
            Navigator.pushReplacementNamed(context, rutas[x]);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Tooltip(message: 'Inicio', child: Icon(Icons.home)),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(message: 'Favoritos', child: Icon(Icons.favorite)),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(message: 'Perfil', child: Icon(Icons.person)),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class TurismoScreen extends StatefulWidget {
  const TurismoScreen({super.key});

  @override
  State<TurismoScreen> createState() => _TurismoScreenState();
}

class _TurismoScreenState extends State<TurismoScreen> {
  static int _indiceGlobal = 0;
  final imagenes = ['imagen/par1.jpg', 'imagen/par2.jpg', 'imagen/par3.jpg'];
  late final String imagenActual;

  @override
  void initState() {
    super.initState();
    imagenActual = imagenes[_indiceGlobal];
    _indiceGlobal = (_indiceGlobal + 1) % imagenes.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Turismo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagenActual,
                height: 310,
                width: 310,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Image.asset(
                  'imagen/prueba.webp',
                  height: 310,
                  width: 310,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Descubre destinos turisticos llenos de naturaleza y aventura.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonRedondo extends StatelessWidget {
  const _BotonRedondo({
    required this.icono,
    required this.fondo,
    required this.colorIcono,
  });

  final IconData icono;
  final Color fondo;
  final Color colorIcono;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: fondo,
        shape: BoxShape.circle,
        border: Border.all(color: colorIcono.withOpacity(0.35), width: 2),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icono, color: colorIcono),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen({required this.url, required this.texto});

  final String url;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            url,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(texto, textAlign: TextAlign.center),
      ],
    );
  }
}

class _Logro extends StatelessWidget {
  const _Logro({required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 22),
        const SizedBox(width: 10),
        Text(texto, style: const TextStyle(fontSize: 16, color: Colors.black87)),
      ],
    );
  }
}