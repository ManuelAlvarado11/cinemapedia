# Dart

Caracteristicas

° Es un lenguaje Compilado
° No es fuertemente tipado
° Valor por defecto al declarar una variable es <null>
° Todo programa en Dart se ejecuta a partir de un <Main()>
° Uso obligatorio de <;> al final de cada linea de codigo

Template String

```
'Hola $nombre'
```

## TIPOS DE DATOS

| Tipo de datos  | Ejemplos                                                          |
| -------------- | ----------------------------------------------------------------- |
| String         |                                                                   |
| int            |                                                                   |
| double         |                                                                   |
| bool           |                                                                   |
| var            |                                                                   |
| const          |                                                                   |
| final          |                                                                   |
| Lista (Arrays) | `List<int> ` Lista de numeros enteros                             |
| Map (Objetos)  | `Map<String,dynamic>` Objetos de tipo llave:String, valor:dynamic |

Para declarar variables nuleables

```bash
bool? isActive
```

## FUNCIONES

° Se debe especificar el tipo de dato de retorno
° Los argumentos que recibe la funcion pueden ser

1. Posicionales

```bash
string saludar(String nombre, String apellido){

}
```

2. Por nombre

```bash
string saludar({String nombre, String apellido}){

}
```

## CLASES

Declarar clase

```bash
class Heroe {
  #Propidades de la clase
  String nombre;
  String poder;

  #Contructor
  Heroe(this.nombre, this.poder);

  #Sobreescribir el metodo
  @override
  String toString(){
    return 'nombre: ${this.nombre}, Poder: ${this.poder}';
  }
}
```

Constructores

```bash
#Contructor
Heroe(this.nombre, this.poder);

#Contructor con nombre
Heroe.fromJson( Map<String, String> json ):
  this.nombre = json['nombre'] ?? '',
  this.poder = json['poder'] ?? '';

```

Instanciar con el contructor

```bash
#Contructor
final batman = Heroe(
    'Manuel Alvarado',
    'Volar'
  );


#Contructor con nombre
final rawJson = {
    'nombre': 'Manuel Alvarado',
    'poder': 'Correr'
  };
final ironMan = Heroe.fromJson(rawJson);
```

Getters

```bash
String get nombreCompleto {
    return '${this.nombre} ${this.apellido}';
  }
```

Setters

```bash
set nombreCompleto(String nombre){
    this.nombre = nombre;
  }
```

° El guion bajo (\_) al inicio del nombre de una clase o variable significa que es privada.

## CLASES ABSTRACTAS

° Es una clase padre donde únicamente colocamos una estructura muy general, dejando que sean las clases hijas quienes definan los detalles.

° Es una clase que no se puede instanciar

° Para que sea una clase abstracta debe poseer al menos 1 metodo abstacto, es decir, vacio

° Metodos o propiedades `Static` pueden ser accedidas sin necesidad de instanciar la clase

### Implements

° Las clases que implementan de la clase abstracta, deben implementar su estructura como tal, metodos abstractos y atributos

```bash
abstract class Animal {
  int? patas;

  Animal();

  void emitirSonido();
}

class Perro implements Animal {
  @override
  int? patas;

  @override
  void emitirSonido(){
    print('Guaaaau');
  }
}
```

### Extends

° Las clases que extienden de la clase abstracta, ya tienen implemntados los metodos y propidades de su padre para ser usados

```bash
abstract class Personaje {
  String? poder;
  String? nombre;

  Personaje(this.nombre);

  @override
  String toString(){
    return '$nombre - $poder';
  }

}

class Heroe extends Personaje {
  Heroe(String nombre): super(nombre);
}
```

### Mixins

° Es la implementacion de una combinacion de caracteristicas de un conjunto de clases abstractas
° Se define atravez de la palabra reservada `<with>`
° Por ejemplo

```bash
abstract class Animal {}

abstract class Ave extends Animal{}
abstract class Pez extends Animal{}

abstract class Volador {
  void volar() => print('Estoy volalndo');
}
abstract class Caminante {
  void caminar() => print('Estoy Caminando');
}
abstract class Nadador {
  void nadar() => print('Estoy nadando');
}

class Delfin extends Pez with Nadador{}
class Aguila extends Ave with Caminante, Volador {}
```

### Futures (Promesas)

- Es una tarea asincrona, como por ejemplo una peticion http

### Async - Await

```bash
Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}
```

# Flutter

Caracteristicas

° Todos los Widget son clases
° Las clases pueden ser : Widget || Modelos
° Generalmente los Widget tiene un solo hijo <child>
° Algunos Widget de Flutter tienen diferntes constructores como: separated(), adaptive() ---> Sustituyen al constructor por defecto

Estado

| StatelessWidget                        | StatefulWidget                                      |
| -------------------------------------- | --------------------------------------------------- |
| Sus propiedades no cambian             | Realiza un seguimiento a cambios de sus propiedades |
| Es mas dificil redibujarse a si mismos | Pueden redibujarse a si mismos                      |
| Clase Abstracta                        | Clase Abstracta                                     |

BuildContext

° Es el arbol de Widget, es decir, tiene toda la informacion de la estructura y jerarquia de los Widget

EJEMPLOS

° <const Persona(...)> ----> <new Persona(...)>
Nota: Sera const cuando la clase a instanciar asi lo defina
° const <Widget[]> -----> Valida los elementos del Array a tipo Widget
° Propiedad -----> Se define en la clase del Widget
° Variable ------> Se define en el metodo <build()>

## Consumir API (Provider)

1. Crear modelos para mapear la informacion del Response
2. Crear EndPoint en su respectivo Provider

### Forma 1

3. Capturar la data(response) en variables de nuestro Provider
4. Llamar endpoint atravez de su Provider
5. Usar la data a travez de las variables correspondientes de nuestro Provider

### Forma 2

3. Retornar la data de nuestro Endpoint creado en paso anterior
4. Llamar al endpoint atravz de su Provider en Un FutureBuilder
5. Usar la data atravez de nuestro Snapshot de FutureBuilder

## Notas Documentacion

° SingleChildScrollView || ListView ---> Son dos widgets similares.

° ListView() --> Para una cantidad pequeña de elementos determinada y no tan pesados.
ListView.builder() ---> Para una cantidad grande de elementos no determinada.

° DecoratedBox ----> Es un widget que dibuja una caja que sera decorada
BoxDecoration ---> Es una clase que decora una caja. Ej (DecoratedBox, Container .....)

° SizedBox -----> Crea un cuadro de tamaño fijo
