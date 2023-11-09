//
//   =================
//   ||             ||    Autor: LR
//   ||   </Miss    ||    Alias: Miss Stormy
//   ||   Stormy>   ||    App: MedGuardian
//   ||             ||    Web: missstormy.neocities.org
//   =================
//   //_____________\\
//  

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


//Al ser StatefulWidget indica que su estado puede ir variando
//durante el uso de la aplicación
class WithTabBar extends StatefulWidget { 
  //Const define el constructor, en este caso, sin parametros
  //key? key simplemente es un argumento opcional que sirve para identificar
  //otros widgets
  const WithTabBar({Key? key}) : super(key: key);
  //El metodo createState() sirve para llamar a los cambios de estado
  //del widget (statefulwidget recuerdas? ;)
  @override
  _WithTabBarState createState() => _WithTabBarState();
}

class _WithTabBarState extends State<WithTabBar> {
  // Variable para mantener el índice de la página seleccionada en el BottomNavigationBar.
  int _selectedIndex = 0;

  // Lista de widgets que representan las páginas del contenido de la aplicación.
  static const List<Widget> _pages = <Widget>[
    MedPage(),
    MapPage(),
    HomePage(),
    ListPage(),
    NotifPage()
  ];

  // Método que se llama cuando se toca uno de los elementos del BottomNavigationBar.
  void _onItemTapped(int index) {
    // Actualiza el estado para cambiar la página seleccionada.
    setState(() {
      _selectedIndex = index;
    });
  }

  // Método obligatorio para construir la interfaz de usuario del widget.
  @override
  Widget build(BuildContext context) {
    //Scaffold es el esqueleto principal de la app
    return Scaffold(
      // Barra de aplicación en la parte superior de la pantalla.
      appBar: AppBar(
        title: const Text('MedGuardian'), // Título de la aplicación.
        elevation: 0, // Elevación de la barra de aplicación (en este caso, sin sombra).
      ),
      // Contenido principal de la aplicación, mostrando la página seleccionada.
      body: IndexedStack(
        children: _pages, // Lista de páginas que se pueden mostrar.
        index: _selectedIndex, // Índice de la página actualmente seleccionada.
      ),
      // Barra de navegación en la parte inferior de la pantalla.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medication), // Icono para la primera página.
            label: 'Crear', // Etiqueta para la primera página.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place), // Icono para la segunda página.
            label: 'Mapa', // Etiqueta para la segunda página.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Icono para la tercera página.
            label: 'Home', // Etiqueta para la tercera página.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list), // Icono para la cuarta página.
            label: 'Lista', // Etiqueta para la cuarta página.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications), // Icono para la quinta página.
            label: 'Avisos', // Etiqueta para la quinta página.
          ),
        ],
        currentIndex: _selectedIndex, // Índice de la página actualmente seleccionada.
        onTap: _onItemTapped, // Función que se llama cuando se toca un ítem del BottomNavigationBar.
      ),
    );
  }
}

class MedPage extends StatelessWidget {
  const MedPage(); // Constructor constante de la clase MedPage.

  @override
  Widget build(BuildContext context) {
    // Retorna un widget DefaultTabController que gestiona las pestañas.
    return DefaultTabController(
      length: 2, // Número de pestañas en el TabBarView.
      child: Scaffold(
        appBar: AppBar(
          // Barra de aplicación que contiene las pestañas.
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Columna que contiene el TabBar en la parte inferior de la AppBar.
              TabBar(
                tabs: [
                  Tab(
                    text: 'Crear medicación', // Etiqueta para la primera pestaña.
                  ),
                  Tab(
                    text: 'Crear tratamiento', // Etiqueta para la segunda pestaña.
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          // Contenido de las pestañas.
          children: [
            CrearMed(), // Widget para crear medicación, probablemente definido en otro lugar.
            CrearTrat(), // Widget para crear tratamiento, probablemente definido en otro lugar.
          ],
        ),
      ),
    );
  }
}

class CrearMed extends StatefulWidget {
  @override
  _CrearMedState createState() => _CrearMedState();
}

class _CrearMedState extends State<CrearMed>
    with AutomaticKeepAliveClientMixin<CrearMed> {
  // Variable para mantener un contador de alguna entidad (en este caso, count de llamadas).
  int count = 10;

  // Método para restablecer el contador a cero.
  void clear() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retorna un Scaffold, un widget de estructura básica para la pantalla.
    return Scaffold(
      // Contenido principal del Scaffold.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de medicación con un tamaño específico.
            Icon(Icons.medication, size: 350),
            // Texto que muestra el total de llamadas entrantes (actualmente desactivado).
            // Text('Total de llamadas entrantes: $count', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      // Botón flotante que resta el contador a cero (actualmente desactivado).
      // floatingActionButton: FloatingActionButton(
      //   onPressed: clear,
      //   child: Icon(Icons.clear_all),
      // ),
    );
  }

  @override
  bool get wantKeepAlive => true; // Indica que el estado del widget debe mantenerse vivo.
}

class CrearTrat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.medication_liquid, size: 350);
  }
}
class MapPage extends StatelessWidget{
  const MapPage();
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.place, size: 350);
  }

}
class HomePage extends StatelessWidget{
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.home, size: 350);
  }
}
class ListPage extends StatelessWidget{
  const ListPage();
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.list, size: 350);
  }
}
class NotifPage extends StatelessWidget{
  const NotifPage();
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.notifications, size: 350);
  }
}