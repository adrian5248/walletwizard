import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedCategory;
  DateTime selectedDate = DateTime.now();
  String reportType = 'Detallado';

  final TextEditingController _searchController = TextEditingController();

  final List<String> categories = [
    'Comida',
    'Transporte',
    'Ahorro',
    'Entretenimiento',
    'Otros',
  ];

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C49A), // Verde de fondo
      body: SafeArea(
        child: Column(
          children: [

            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  Text(
                    'Buscar',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.notifications_none, color: Colors.white),
                ],
              ),
            ),


            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFF4FFF9),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      // aqui con este puedo hacer las Busquedas
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),


                      const SizedBox(height: 20),
                      const Text("Categorías", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),

                      //aqui me sirve para que ponga las categorias que necesito
                      DropdownButtonFormField<String>(
                        value: selectedCategory,
                        hint: const Text('Selecciona la categoría'),
                        items: categories.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCategory = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFE6F4EC),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Fecha", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),

                      //con este inkell puedo poner la opcion del calendario
                      InkWell(
                        onTap: _selectDate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F4EC),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.calendar_today_outlined),
                            ],
                          ),
                        ),
                      ),


                      const SizedBox(height: 20),
                      const Text("Reporte", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: const Text("Corto"),
                              value: 'Corto',
                              groupValue: reportType,
                              onChanged: (value) {
                                setState(() {
                                  reportType = value!;
                                });
                              },
                            ),
                          ),


                          Expanded(
                            child: RadioListTile(
                              title: const Text("Detallado"),
                              value: 'Detallado',
                              groupValue: reportType,
                              onChanged: (value) {
                                setState(() {
                                  reportType = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,

                        
                        child: ElevatedButton(
                          onPressed: () {
                            // Aqui con este puedo hacer las búsquedas
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF004B80),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Buscar', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
