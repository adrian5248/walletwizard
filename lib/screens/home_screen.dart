import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C49A),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Hi, Adro\n',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Buenos días',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.notifications_none, color: Colors.white),
                ],
              ),
            ),
            // Finanzas resumen
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("💰 Total De Ingreso", style: TextStyle(color: Colors.white)),
                      Text("\$7,783.00", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("📉 Total Restante", style: TextStyle(color: Colors.white)),
                      Text("\$1,187.40", style: TextStyle(color: Color(0xFFB3E5FC), fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            // Ahorro barra
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                value: 0.8,
                color: Colors.white,
                backgroundColor: Color(0xFFB2DFDB),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("\$2000", style: TextStyle(color: Colors.white)),
              ),
            ),
            // Contenido
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF4FFF9),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1F2EB),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: const [
                                Icon(Icons.pie_chart, size: 60, color: Colors.teal),
                                Text("40%\nGastado", textAlign: TextAlign.center),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("💵 Saldo de hoy", style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text("\$1000.00"),
                                  SizedBox(height: 10),
                                  Text("💸 Saldo disponible", style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text("-\$100.00", style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ToggleButtons(
                      isSelected: const [false, false, true],
                      borderRadius: BorderRadius.circular(12),
                      children: const [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("Daily")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("Weekly")),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("Monthly")),
                      ],
                      onPressed: (index) {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
