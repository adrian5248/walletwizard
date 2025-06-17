import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'notifications_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Placeholder(), // Aquí pondrías la pantalla de gráficas
    const SearchScreen(),
    const Placeholder(), // Aquí pondrías la pantalla de historial
    const NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFF4FFF9),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Gráficas"),
          BottomNavigationBarItem(icon: Icon(Icons.compare_arrows), label: "Transferencias"),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Historial"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
