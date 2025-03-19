import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Good Afternoon", style: TextStyle(fontSize: 16)),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://via.placeholder.com/50"), // Replace with actual user image
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Amit Mohan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard("Spending", "\$1,021", Colors.pink, Icons.arrow_upward),
                _buildInfoCard("Income", "\$10,000", Colors.green, Icons.arrow_downward),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("Balance: \$8,979", style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 20),
            const Text(
              "Recent transactions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionCard("\$50.0", "Fruits & vegetables", "08 Feb 24", LucideIcons.shoppingCart), 
                  _buildTransactionCard("\$19.99", "Netflix Subscription", "08 Feb 24", LucideIcons.gamepad),
                  _buildTransactionCard("\$60.0", "Uber to Office", "07 Feb 24", LucideIcons.car),
                  _buildTransactionCard("\$105.0", "Shopping from Amazon", "07 Feb 24", LucideIcons.shoppingCart),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Analysis"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Accounts"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String amount, Color color, IconData icon) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
              Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(String amount, String description, String date, IconData icon) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[800],
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(description, style: TextStyle(fontSize: 16)),
        subtitle: Text(date, style: TextStyle(color: Colors.grey)),
        trailing: Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
