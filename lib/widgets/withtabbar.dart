import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WithTabBar extends StatefulWidget {
  const WithTabBar({Key? key}) : super(key: key);

  @override
  _WithTabBarState createState() => _WithTabBarState();
}

class _WithTabBarState extends State<WithTabBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MedPage(),
    MapPage(),
    HomePage(),
    ListPage(),
    NotifPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedGuardian'),
        elevation: 0,
        
      ),
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Crear',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Avisos',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MedPage extends StatelessWidget {
  const MedPage();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Crear medicación',
                  ),
                  Tab(
                    text: 'Crear tratamiento',
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CrearMed(),
            CrearTrat(),
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
  int count = 10;

  void clear() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medication, size: 350),
            // Text('Total incoming calls: $count',
            //     style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: clear,
      //   child: Icon(Icons.clear_all),
      // ),
    );
  }

  @override
  bool get wantKeepAlive => true;
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