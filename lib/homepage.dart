import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ratingbar/star_count.dart';

import 'rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rating Bar"),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
          child: ElevatedButton(
            child: const Text('Open Dialog'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actions: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent), // Set the button color
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent), // Set the button color
                        ),
                        child: const Text('OK',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // Perform an action
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                    content: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Consumer<StarCountProvider>(
                        builder: (context, provider, child) {
                          debugPrint(
                              'main pass value--> ${provider.getstarcount}');
                          return RatingBar(
                            starCount: 5,
                            rating: provider.getstarcount,
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
