import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController input = TextEditingController();
  double kelvin = 0;
  double reamur = 0;

  hitung() {
    setState(() {
      if (formKey.currentState!.validate()) {
        reamur = 4 / 5 * double.parse(input.text);
        kelvin = double.parse(input.text) + 273;
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Konversi Suhu',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Koversi Suhu"),
            backgroundColor: Colors.red,
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: input,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silahkan masukkan suhu dalam celcius';
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "inputkan angka",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("Suhu dalam Kelvin"),
                          Text(
                            kelvin.toString(),
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("Suhu dalam Reamor"),
                          Text(
                            reamur.toString(),
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton( 
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        hitung();
                      }
                    },
                    child: Text("Hitung"),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
