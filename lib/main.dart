import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/components/My_textfield.dart';
import 'package:my_app/components/asset_image_widget.dart';
import 'package:my_app/components/auth_wrapper.dart';
import 'package:my_app/components/custom_search_delegate.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/signUp_button.dart';
import 'package:my_app/cubit/auth/auth_cubit.dart';
import 'package:my_app/cubit/balance_cubit/cubit/balance_cubit.dart';
import 'package:my_app/cubit/counter_cubit.dart';
import 'package:my_app/screens/APIbaru.dart';
import 'package:my_app/screens/CrudSQL_screen.dart';
import 'package:my_app/screens/UTS/issues_List_screen.dart';
import 'package:my_app/screens/balance_screen.dart';
import 'package:my_app/screens/counter_screen.dart';
import 'package:my_app/screens/form_postuts.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/login_page.dart';
import 'package:my_app/screens/longList_screen.dart';
import 'package:my_app/screens/routes/akun_screen.dart';
import 'package:my_app/screens/longList_screen.dart';
import 'package:my_app/screens/routes/second_screen.dart';
import 'package:my_app/screens/routes/signUp_screen.dart';
import 'package:my_app/screens/setting_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/spending_form.dart';
import 'package:my_app/screens/spending_screen.dart';
import 'package:my_app/screens/testuts.dart';
import 'package:my_app/screens/uts_post_screen.dart';
import 'package:my_app/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
          BlocProvider<BalanceCubit>(create: (context) => BalanceCubit()),
          BlocProvider<AuthCubit>(create: (context) => AuthCubit())
        ],
        child: MaterialApp(
          title: 'HomeTory',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          debugShowCheckedModeBanner: false,
          // home: const LoginPage(),
          initialRoute: '/login-page',
          routes: {
            '/': (context) => const MyHomePage(
                  title: 'HomeTory',
                ),
            '/login-page': (context) => const LoginPage(),
            '/setting_screen': (context) => const SecondScreen(),
            '/profile_screen': (context) => const AkunScreen(),
            '/welcome_screen': (context) => const WelcomeScreen(),
            '/counter_screen': (context) => const CounterScreen(),
            '/spending_screen': (context) => const AuthWrapper(child: SpendingScreen()),
            '/balance_screen': (context) => const AuthWrapper(child: BalanceScreen())
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.shifting;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SettingScreen(),
    const BarangScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Ruangan',
    'Barang',
    'Profile',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: _screens[_selectedIndex],
      drawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const UserAccountsDrawerHeader(
                      accountName: Text('Dewa Putu Aditya Gunawan'),
                      accountEmail: Text('2215091047'),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pfp.jpg'),
                      ),
                      decoration: BoxDecoration(color: Colors.blueGrey),
                    ),
                    const Divider(height: 10),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondScreen()),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AkunScreen()),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log Out'),
                      onTap: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false),
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.person),
                      title: Text('Aditya Gunawan | 4B'),
                      children: [
                        // ListTile(
                        //   leading: Icon(Icons.newspaper),
                        //   title: Text('Latihan API 1 News'),
                        //   onTap: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const LongListScreen()),
                        //   ),
                        // ),
                        // ListTile(
                        //   leading: Icon(Icons.storage),
                        //   title: Text('Latihan CRUD SQLITE'),
                        //   onTap: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const CrudSQLScreen()),
                        //   ),
                        // ),
                        // ListTile(
                        //   leading: Icon(Icons.storage),
                        //   title: Text('Latihan API 2 Datas'),
                        //   onTap: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const APIbaru()),
                        //   ),
                        // ),
                        ListTile(
                          leading: Icon(Icons.storage),
                          title: Text('API UTS'),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Testuts()),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.storage),
                          title: Text('coba post uts'),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormPostUts()),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.add_call),
                          title: Text('Spending Screen'),
                          onTap: () {
                            Navigator.pushNamed(context, '/spending_screen');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.add_call),
                          title: Text('Balance Screen'),
                          onTap: () {
                            Navigator.pushNamed(context, '/balance_screen');
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.add_call),
                      title: Text('Welcome Screen'),
                      onTap: () {
                        Navigator.pushNamed(context, '/welcome_screen');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.countertops),
                      title: Text('Counter Screen'),
                      onTap: () {
                        Navigator.pushNamed(context, '/counter_screen');
                      },
                    ),
                    // ListTile(
                    //   leading: Icon(Icons.storage),
                    //   title: Text('Spending Form'),
                    //   onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const FormPostUts()),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.blueGrey,
        type: _bottomNavType,
        onTap: _onItemTapped,
        items: _navBarItems,
      ),
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.meeting_room_outlined),
    activeIcon: Icon(Icons.meeting_room),
    label: 'Ruangan',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.category_outlined),
    activeIcon: Icon(Icons.category),
    label: 'Barang',
  ),
];
