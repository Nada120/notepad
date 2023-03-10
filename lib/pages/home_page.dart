import 'package:flutter/material.dart';

import '../comp.dart/comp_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/8,),
            const Text(
              'Notepad',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            TextFormField(
              decoration: InputDecoration(
                focusColor: Colors.amber,
                hintText: 'Search notes',
                prefixIcon: const Icon(Icons.search_outlined,),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            myListTile( 
              title: 'Today grocery list', 
              subtitle: 'june 26, 2022 08:05 PM', 
              color: const Color(0xFFb3ffb3),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            myListTile(
              title: 'Rich dad Poor dad quotes',
              subtitle: 'June 22, 2022 05:00 PM',
              color: const Color(0xFFffff99),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: (){},
        child: const Icon(Icons.add, color: Colors.black, size: 40,),
      ),
    );
  }
}