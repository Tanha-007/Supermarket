import 'package:flutter/material.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Collection App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: FoodHomePage(),
    );
  }
}

class FoodHomePage extends StatefulWidget {
  @override
  _FoodHomePageState createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  // Food list data
  List<Map<String, String>> foods = [
    {
      "name": "Burger",
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?w=600",
      "desc": "A juicy beef burger with cheese."
    },
    {
      "name": "Pizza",
      "image":
          "https://images.unsplash.com/photo-1601924578365-00cd82a79f85?w=600",
      "desc": "Hot and cheesy pepperoni pizza."
    },
  ];

  // Add food function
  void addFood(String name, String image, String desc) {
    setState(() {
      foods.add({
        "name": name,
        "image": image,
        "desc": desc,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Collection"),
        centerTitle: true,
      ),

      // Show list of foods
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                foods[index]["image"]!,
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(foods[index]["name"]!),
              subtitle: Text(foods[index]["desc"]!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        FoodDetails(food: foods[index]),
                  ),
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddFoodPage(onAdd: addFood),
            ),
          );
        },
      ),
    );
  }
}

class AddFoodPage extends StatefulWidget {
  final Function(String, String, String) onAdd;

  AddFoodPage({required this.onAdd});

  @override
  _AddFoodPageState createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Food"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Food Name"),
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: "Image URL"),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Add Food"),
              onPressed: () {
                widget.onAdd(
                  nameController.text,
                  imageController.text,
                  descController.text,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FoodDetails extends StatelessWidget {
  final Map<String, String> food;

  FoodDetails({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food["name"]!),
      ),
      body: Column(
        children: [
          Image.network(food["image"]!),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              food["desc"]!,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
