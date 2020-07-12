import 'package:flutter/material.dart';
import 'nodo.dart';
import 'arbol.dart';

class ArbolPainter extends CustomPainter {
  Arbol objArbol = Arbol();
  static final double diametro = 10;
  static final double radio = diametro / 2;
  static final int ancho = 20;

  ArbolPainter(Arbol obj) {
    this.objArbol = obj;
  }
  @override
  void paint(Canvas canvas, Size size) {
    pintar(canvas, size.width / 2, 20, objArbol.raiz);
  }

  @override
  bool shouldRepaint(ArbolPainter oldDelegate) => true;

  void pintar(Canvas canvas, double x, double y, Nodo n) {
    if (n == null) {
      print("El nodo es nulo!");
    } else {
      
      Paint brushCirculoBorde = new Paint()
        ..color = Color(0xff278ea5)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

        Paint brushCirculo = new Paint()
        ..color = Color(0xff21e6c1)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill
        ..strokeWidth = 0;
        

      Paint brushLinea = new Paint()
        ..color = Color(0xff278ea5)
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 1.5;

      final textStyle = TextStyle(
        color: Color(0xff1f4287),
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
      final textSpan = TextSpan(
        text: n.dato.toString(),
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: x,
        maxWidth: x,
      );


      final offsetText = Offset(x - 6, y - 6);

      double extra = objArbol.altura(n) * (ancho / 2);

      if (n.izquierda != null) {
        canvas.drawLine(Offset(x + radio, y - radio),
            Offset(x - ancho - extra + radio, y + ancho + radio * 0.2), brushLinea);
      }
      if (n.derecha != null) {
        canvas.drawLine(Offset(x + radio, y + radio * 0.2),
            Offset(x + ancho + extra + radio, y + ancho + radio), brushLinea);
      }

      canvas.drawCircle(Offset(x, y), diametro, brushCirculo);
      canvas.drawCircle(Offset(x, y), diametro, brushCirculoBorde);
      textPainter.paint(canvas, offsetText);

      pintar(canvas, x - ancho - extra, y + ancho, n.izquierda);
      pintar(canvas, x + ancho + extra, y + ancho, n.derecha);
    }
  }
}
