import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'scr.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    )
  );
}

class FirstPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Tecnologia da Programação'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: <Widget>[
          const Image(
            image: AssetImage('images/wallpaper.jpg'),
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 100),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Image.asset('images/tp.png'),
                      )
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          child: TextFormField(
                            controller: _categoryNameController,
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))],
                            decoration:  const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              labelText: "Procure por imagens via categoria",
                              labelStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.black54,
                              filled: true,
                            ),
                            style: const TextStyle(color: Colors.white, fontSize: 25.0),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Digite alguma categoria antes de procurar!";
                              }
                            },
                          ),
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          height: 50.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              elevation: 15,
                              shadowColor: Colors.red,
                            ),
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context){
                                      return SecondPage(category: _categoryNameController.text);
                                    })
                                );
                              }
                            },
                            child: const Text(
                              'Procurar',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  String category;
  SecondPage({required this.category});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,

      appBar: AppBar(
        title: const Text('Tecnologia da Programação'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),

      body: FutureBuilder(
        future: _getPics(widget.category),
        builder: (context, snapShot){
          Map? data = snapShot.data;
          if(snapShot.hasError){
            return const Text(
              'Falha ao conectar com o servidor',
              style: TextStyle(color: Colors.white, backgroundColor: Colors.black),
            );
          }else if(snapShot.hasData){
            return Center(
              child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index){
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: 300.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16.0)
                          ),
                          child: InkWell(
                          onTap: (){},
                          child: Image.network(snapShot.data!["hits"][index]["largeImageURL"]),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }else{
          return const Center(
          child: CircularProgressIndicator(),
          );
          }
        }
      ),
    );
  }
}

Future<Map> _getPics(String category) async {
String url = 'https://pixabay.com/api/?key=$apiKey&q=$category&image_type=photo&pretty=true';
http.Response response = await http.get(Uri.parse(url));
return json.decode(response.body);
}