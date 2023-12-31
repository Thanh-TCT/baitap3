import 'package:baitap3/loginpage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  static const name = '/homepage';

  @override
  State<homepage> createState() => _homepageState();
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();
String username = "username";
String password = "password";

class _homepageState extends State<homepage> {
  Future<Response> postData(String username, String password) async {
    var response =
        await Dio().post('https://js-post-api.herokuapp.com/api/login',
            data: {
              "username": username,
              "password": password,
            },
            options: Options(
              validateStatus: (status) => status! < 500,
            ));

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 229, 240),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 200,
              thickness: 100,
              color: Color.fromARGB(255, 208, 229, 240),
              indent: 200,
            ),
            Container(
              child: Text(
                ' Welcome back',
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
            ),
            Container(
              child: Text('Login to your account',
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 350,
              height: 80,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.person),
                      ),
                      SizedBox(
                        width: 200,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                labelText: "Username",
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 350,
              height: 80,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.password),
                      ),
                      SizedBox(
                        width: 100,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ),
                        ),
                      ),
                      Divider(
                        height: 50,
                        thickness: 50,
                        indent: 150,
                      ),
                      Container(
                        child: Icon(
                          Icons.remove_red_eye,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30.0)),
                child: ElevatedButton(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  onPressed: () async {
                    final username = usernameController.text;
                    final password = passwordController.text;
                    final result = await postData(username, password);

                    final statusC = result.statusCode;

                    print(statusC);

                    if (statusC == 200) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginpage()));
                      setState(() {});
                    } else {
                      print('Status code: ${result.statusCode}');
                      print(result.data['error']);
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 80,
                ),
                Container(
                  child: Text('Dont have an account ? ',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(' Signup',
                      style: TextStyle(color: Colors.blue, fontSize: 15)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
