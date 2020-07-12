import 'nodo.dart';
import 'dart:math' show max;

class Arbol {
  Nodo _raiz;

  void insertarNodo(int elemento) {
    Nodo nuevo = new Nodo(elemento);
    if (_raiz == null) {
      _raiz = nuevo;
    } else {
      _raiz = nuevo.insertar(raiz, nuevo);
    }
  }

  int altura(Nodo n) {
    int altder = (n.derecha == null ? 0 : 1 + altura(n.derecha));
    int altizq = (n.izquierda == null ? 0 : 1 + altura(n.izquierda));
    return max(altder, altizq);
  }

  void resetArbol() {
    _raiz = null;
  }

  Nodo get raiz {
    return _raiz;
  }

  set raiz(Nodo n) {
    this._raiz = n;
  }
}
