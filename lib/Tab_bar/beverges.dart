import 'package:flutter/material.dart';

class beverges extends StatefulWidget {
  const beverges({Key? key}) : super(key: key);

  @override
  State<beverges> createState() => _InventoryState();
}

class _InventoryState extends State<beverges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildInventoryCard(
            itemName: 'Orange Juice',
            imageUrl:
                'https://www.alphafoodie.com/wp-content/uploads/2020/11/Orange-Juice-1-of-1-500x500.jpeg',
            price: 10,
            quantity: 5,
            remaining: 10,
            popularity: 4.5,
          ),
          _buildInventoryCard(
            itemName: 'Apple Juice',
            imageUrl:
                'https://images.onlymyhealth.com/imported/images/2022/November/19_Nov_2022/main-applejuicebenefits.jpg',
            price: 20,
            quantity: 3,
            remaining: 7,
            popularity: 4.2,
          ),
          _buildInventoryCard(
            itemName: 'Juice',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHPQtpGR-DhK_2eZ6pROYIw0xSq3_Mkwj0Lw&s',
            price: 60,
            quantity: 3,
            remaining: 7,
            popularity: 4.2,
          ),
          // Add more cards as needed
        ],
      ),
    );
  }

  Widget _buildInventoryCard({
    required String itemName,
    required String imageUrl,
    required int price,
    required int quantity,
    required int remaining,
    required double popularity,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;

    return Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF195DAD),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  itemName,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            // Divider(),
            Container(
              color: Color(0xFFA3D9FF),
              child: Row(
                children: [
                  Expanded(
                    flex: isSmallScreen ? 3 : 3,
                    child: Image.network(
                      imageUrl,
                      height: 100,
                      width: 300,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: isSmallScreen ? 5 : 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow('Price', '$price'),
                        _buildInfoRow('Quantity', quantity.toString()),
                        _buildInfoRow('Remaining', remaining.toString()),
                        _buildInfoRow('Popularity', popularity.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs. $price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement edit functionality
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF195DAD)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: beverges(),
  ));
}