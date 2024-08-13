import 'package:financial_advisory/BalanceHistory.dart';
import 'package:financial_advisory/SipCalci.dart';
import 'package:financial_advisory/Statistics.dart';
import 'package:financial_advisory/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'MyProfile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> items;

  @override
  void initState() {
    super.initState();
    items = [
      "My Wallet",
      "My Investment",
      "Graphs and Growth Rate",
      "My Balance and History",
      "SIP Calculator",
      "Set Password",
      "FAQ",
      "About Us",
      "Help",
      "Logout",
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double fontSize = width * 0.05;
    final double padding = width * 0.06;
    final double hOffset = width * 0.03;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Financial Advisor",
          style: TextStyle(
            fontSize: fontSize * 1.9,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: const Color(0xFF0E103D),
        backgroundColor: Colors.indigoAccent,
        leading: Padding(
          padding: EdgeInsets.only(top: padding * 0.4),
          child: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProfile()),
              );
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black87,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: padding * 4.0),
              child: Text(
                'More of Us',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: fontSize * 1.5,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 250),
                      child: SlideAnimation(
                        horizontalOffset: hOffset * 2.2,
                        child: FadeInAnimation(
                          child: ListTile(
                            title: Text(
                              items[index],
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: fontSize * 0.8,
                              ),
                            ),
                            onTap: () {
                              switch (index) {
                                case 0:
                                  break;
                                case 1:
                                  break;
                                case 2:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const balHis()),
                                  );
                                  break;
                                case 3:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const balHis()),
                                  );
                                  break;
                                case 4:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Sip()),
                                  );
                                  break;
                                case 5:
                                  break;
                                case 6:
                                  break;
                                case 7:
                                  break;
                                case 8:
                                  break;
                                case 9:
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const loginPage()),
                                  );
                                  break;
                                default:
                                  break;
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: padding * 2.6),
              const Image(image: AssetImage('assets/Projection.jpg')),
              SizedBox(height: padding * 2.8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding * 1.7),
                child: Text('“Invest for the long haul.\n Don’t get too greedy and don’t get too scared.”',
                  style: TextStyle(
                    color: const Color(0xFF00008B),
                    fontWeight: FontWeight.w800,
                    fontSize: fontSize * 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
