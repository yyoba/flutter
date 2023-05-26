import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Item_provider.dart';
import 'Items_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Items(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ItemListScreen(),
      ),
    );
  }
}

class  ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 19.0,
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.data_object),
              onPressed: () {},
            ),
            SizedBox(width: 30),
            Container(
              child: const Text("List of items"),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // ignore: prefer_const_constructors
            DrawerHeader(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: Colors.blue,
              ),

              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/eyob.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Center(
                    child: Text(
                      'Eyob Minichil',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'minichileyob@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              title: const Text('Dashboard'),
              leading: const Icon(
                Icons.dashboard,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.data_object,
              ),
              title: const Text('items'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Setting'),
              leading: const Icon(
                Icons.settings,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Account'),
              leading: const Icon(
                Icons.person,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      //drawer: drawer(),

      body: ListView.builder(
  itemCount: items.length,
  itemBuilder: (ctx, index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Add spacing here
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Image.network(items[index].imageUrl),
          title: Text(items[index].name),
          subtitle: Text('Price: \$${items[index].price.toStringAsFixed(2)}'),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailScreen(item: items[index]),
              ),
            );
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  },
),
   floatingActionButton: FloatingActionButton(
          child:  Icon(Icons.add),
          onPressed: () {
            // Handle add button pressed
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked
    );
  }
}
class ItemDetailScreen extends StatelessWidget {
  final Item item;

 ItemDetailScreen({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(item.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}