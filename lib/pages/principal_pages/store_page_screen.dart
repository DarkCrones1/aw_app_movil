import 'package:flutter/material.dart';

class StorePageScreen extends StatefulWidget {
  const StorePageScreen({super.key});

  @override
  State<StorePageScreen> createState() => _StorePageScreenState();
}

class _StorePageScreenState extends State<StorePageScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> categories = [
    'Últimas Piezas',
    'Hogar',
    'Moda',
    'Piezas de colección',
  ];

  final List<Map<String, String>> products = [
    {
      'name': 'Funda cojín Lidxi',
      'price': '\$2,644.80',
      'image': 'assets/Funda_cojin.webp'
    },
    {
      'name': 'Huipil Aldama',
      'price': '\$2,383.00',
      'image': 'assets/Huipil_Aldama.webp'
    },
    {
      'name': 'Blusa Aguacatenango',
      'price': '\$2,027.00',
      'image': 'assets/Blusa_Aguacatenango.webp'
    },
    {
      'name': 'Bolsa Liagre',
      'price': '\$742.00',
      'image': 'assets/Bolsa_Liagre.webp'
    },
    {
      'name': 'Banca Zimatlán',
      'price': '\$5,807.00',
      'image': 'assets/Banca_Zimatlán.webp'
    },
    {
      'name': 'Hamaca Carolina',
      'price': '\$2,401.00',
      'image': 'assets/Hamaca_Carolina.webp'
    },
    {
      'name': 'Dije Pavo Real',
      'price': '\$562.00',
      'image': 'assets/Dije_Pavo_Real.webp'
    },
    {
      'name': 'Huipil Mixe',
      'price': '\$3,080.00',
      'image': 'assets/Huipil_Mixe.jpg'
    },
    {
      'name': 'Camisa Añil Mediana',
      'price': '\$2,240.00',
      'image': 'assets/Camisa_Añil_Mediana.webp'
    },
    {
      'name': 'Rebozo Mar',
      'price': '\$6,566.00',
      'image': 'assets/Rebozo_Mar.webp'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mundo Artesano',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.bold, // Texto blanco
          ),
        ), // Color marrón oscuro
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        categories[index],
                        style: TextStyle(
                          color: _selectedCategoryIndex == index
                              ? Colors.white
                              : const Color(
                                  0xFF6D4C41), // Blanco o marrón oscuro
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      selected: _selectedCategoryIndex == index,
                      selectedColor:
                          const Color(0xFF6D4C41), // Color marrón oscuro
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedCategoryIndex = selected ? index : 0;
                        });
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 3,
                      shadowColor: Colors.grey.withOpacity(0.4),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              products[index]['image']!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index]['name']!,
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  products[index]['price']!,
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color(
                                        0xFF6D4C41), // Color marrón oscuro
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right,
                              size: 30,
                              color: Color(
                                  0xFF6D4C41)), // Icono con color marrón oscuro
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
