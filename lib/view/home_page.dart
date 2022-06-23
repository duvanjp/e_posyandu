import 'package:e_posyandu/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int pageIndex = 0;
  // late HomeCubit homeCubit;

  @override
  void initState() {
    // homeCubit = BlocProvider.of<HomeCubit>(context);
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {},
      // bloc: homeCubit,
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            pageSnapping: false,
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          backgroundColor: Colors.white,
          elevation: 5,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: AppColor.disableGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          iconSize: 26,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (key) {
            setState(() {
              pageIndex = key;
              _pageController.jumpToPage(key);
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: "Pasien",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_rounded),
              label: "Catatan Kesehatan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_rounded),
              label: "Monitoring Anak",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership),
              label: "NFC",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Profil Petugas",
            ),
          ],
        ),
      ),
    );
  }
}
