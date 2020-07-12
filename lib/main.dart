import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'arbol.dart';
import 'arbolPainter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Arbol Binario de Busqueda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ABB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Arbol objArbol = new Arbol();
  final _textFieldController = TextEditingController();
  var _dato;

  ArbolPainter _painter;
  @override
  void initState() {
    super.initState();
    _painter = new ArbolPainter(objArbol);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff071e3d),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                  width: 60,
                ),
                Center(child:  Text("Arbol Binario de Busqueda", style: TextStyle(color: Colors.white, fontSize: 20),),),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container(
                  child: CustomPaint(
                    painter: _painter,
                    size: Size(MediaQuery.of(context).size.width, 250),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                      controller: _textFieldController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Ingresa un numero",hintStyle: TextStyle(color: Colors.white), ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoButton(
                            padding: EdgeInsets.all(5),
                            color: Color(0xff3282b8),
                            onPressed: () {
                              setState(() {
                                _dato = _textFieldController.text;
                                objArbol.insertarNodo(int.parse(_dato));
                                _textFieldController.text = "";
                              });
                            },
                            child: Text(
                              "Agregar",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xfffff5a5),
                              ),
                            ),
                          ),
                        ),
                      ),
                       Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoButton(
                            padding: EdgeInsets.all(5),
                            color: Color(0xffff6464),
                            onPressed: () {
                              setState(() {
                                //Eliminar
                              });
                            },
                            child: Text(
                              "Eliminar",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xfffff5a5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      objArbol.resetArbol();
                    });
                  },
                  child: Text("Resetear Arbol",style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
