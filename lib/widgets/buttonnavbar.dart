import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MiScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Color de fondo del scaffold
      backgroundColor: const Color.fromARGB(255, 253, 75, 75),
      
      //Barra superior

      appBar: AppBar(
        //si queremos el color en hexadecimal
        //utilizamos Color en lugar de colors
        //antecedemos le valor con 0xff y a continuacion el color hexadecimal
        backgroundColor: Color(0xffe6ebf4),
        //la elevación la utilizamos para que tenga una sombra
        //si no queremos sombra 0
        //marcará la elevación de nuestra barra, cuanto mas grande
        //mas visible la sombra
        elevation: 10,
        //fija el color de la sombra
        shadowColor: Colors.grey,
        //titulo de la barra superior
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18),
        //creamos una fila, en la cual pondremos dos textos
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //App con el color y tipografia por defecto
            Text(
              "App"),
               //Flutter que estará en negrita y azul
              Text(
                "Flutter",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                  )
                )
          ],
        ),
        //Dentro del appbar podemos poner botones, en este caso se 
        //pone uno para ajustes y otro para logout
        //Si se quiere probar el endDrawer, comentad la parte de actions
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout))
        ],  
          ),
      //boton que expande el menu lateral
      drawer: Drawer(
        elevation: 10,
        //como contenido presenta un column, esto es porque necesitamos en un primer momento
        //bajar el primer elememto, pues sale en la parte superior del telefono y no se ve
        //se puede usar como contenido cualquier widget
        child: Column(children: [
          SizedBox(height: 40),
          //inicialmente no se ve al estar arriba
          Text("TExto1", 
          style: TextStyle(
            color: Colors.black
            ),
            )
        ]),
      ),
      //deteccion de cambio de estad del drawer
      //en nuestro caso abrirá colocará un texto en la consola indicando que se abre
      //declaramos una funcion que recibe como parametro que ha cambiado el estado
      onDrawerChanged: (isOpen) {
        print(isOpen);
      },
      
      // El endDrawer es la posibilidad de poner el menu en la parte izquierda del appbar
      // podemos tener solo el Drawer en la parte izquierda, podemos tener solo en la derecha con el endDrawer
      // o incluso podemos tener los dos
      // endDrawer: Drawer(
      //   elevation: 10,
      //   child: Column(children: [
      //     SizedBox(height: 40),
      //     //inicialmente no se ve al estar arriba
      //     Text("Final", 
      //     style: TextStyle(
      //       color: Colors.black
      //       ),
      //       )
      //   ]),
      // ),
      // //deteccion de cambio de estad del enddrawer
      // onEndDrawerChanged: (isOpen) {
      //   print("derecho $isOpen");
      // },

      //boton flotante
      floatingActionButton: FloatingActionButton(
        //los iconos los podemos buscar en la web de flutter, en material
        child: Icon(Icons.add, size: 30,),
        onPressed: (){
          //mensaje a consola para probar boton flotante
          print("pulsado");
        }
        ),
        //colocación del boton flotante
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
        //por defecto cuando aparece el teclado nuestra zona central se redimensiona
        //para evitarlo fijamos este parametro, util cuando tenemos botones flotantes
        //para que no queden en lugares no deseados
        resizeToAvoidBottomInset: false, 
        
        //Menú inferior
        bottomNavigationBar: BottomNavigationBar(items: [
          //no se pueden pasar widgets, sino elementos de la clase bottonNavigationBarItem
          BottomNavigationBarItem(
            //ajuste del icono del boton inferior
            icon: Icon(Icons.home),
            label: "Inicio",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil"),
        ]) ,
        
        //contenido central, podemos añadir cualquier widget
        body: Container(
          color: Colors.grey,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
            Expanded(child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: TextField(),
                ),
                ),
                ),
            Text("jejejejjeje"),
            SizedBox(height: 30,)
            ]
            ),
        ),
          
        
        
            
    );
  }

}