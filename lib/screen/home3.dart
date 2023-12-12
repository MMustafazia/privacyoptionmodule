import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:privacyoption/privacygallery/home.dart';
import 'package:privacyoption/screen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();

  void checkpassword() async {
    print("pressed");
    print(controller1.text);
    print(controller2.text);
    print(controller3.text);
    print(controller4.text);
    print(controller5.text);
    String value1 = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text +
        controller5.text;

    print("${value1}");

    var sharedpref = await SharedPreferences.getInstance();
    var keyvalue = sharedpref.getString("KEYPASS");
    print("key value: ${keyvalue}");
    if (value1.toString() == keyvalue.toString()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged In'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Password'), backgroundColor: Colors.red,
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
      setState(() {
        controller1.clear();
        controller2.clear();
        controller3.clear();
        controller4.clear();
        controller5.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Privacy Gallery",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w300, color: Colors.purple),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter Password",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    color: Colors.purple),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Form(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller1,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller2,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller3,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller4,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              Container(
                height: 68,
                width: 64,
                child: TextFormField(
                  controller: controller5,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    FocusScope.of(context).nextFocus();
                  },
                ),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                checkpassword();
                // var sharedpref = await SharedPreferences.getInstance();
                // var waa = sharedpref.getString("KEYPASS");
                // print("${waa}");
              },
              child: Text("submit"))
        ],
      ),
    );
  }
}
