import 'package:baitap3/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key});
  static const name = '/loginpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Divider(
            height: 60,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Login App',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Divider(
                height: 20,
                thickness: 100,
                indent: 180,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  foregroundColor: Colors.white,
                  child: Icon(Icons.logout_rounded),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homepage()));
                  },
                ),
              ),
            ],
          ),
          Divider(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Welcome',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Container(
                child: Icon(
                  Icons.celebration_sharp,
                  size: 15,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Flutter',
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}
