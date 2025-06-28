import 'package:flutter/material.dart';
import 'package:voic_assistant/pallete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Allen"),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(
          horizontal: 8
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // The first part in the stack is always back, the next one is upper
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.only(
                      top: 4
                    ),
                    decoration: BoxDecoration(
                      color: Pallete.assistantCircleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  height: 125,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/images/virtualAssistant.png"))
                  ),
                )
              ],
            ),
            
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 10
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 40
              ).copyWith(
                top: 30
              ),
              decoration: BoxDecoration(),
            )
          ],
        ),),
      ),
    );
  }
}