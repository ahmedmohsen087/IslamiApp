import 'package:flutter/material.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/features/layout/qiblah/qibla.dart';
import 'package:islamic/features/layout/radio/radio_tab.dart';
import 'package:islamic/features/layout/tasbeh/sabha_tab.dart';
import 'package:islamic/features/layout/times/times_tab.dart';

import '../../core/theme/aap_colors.dart';
import 'hadith/pages/hadith_tab.dart';
import 'quran/pages/quran_tab.dart';
import 'widgets/custom_navbar_item.dart';

class LayoutPage extends StatefulWidget {
  static const routeName = 'layout_page';

  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SabhaTab(),
    RadioTab(),
    TimesTab(),
    CompassWithQiblah(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primaryColor,
            fixedColor: AppColors.white,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: CustomNavbarItem(
                    selectedIndex: selectedIndex,
                    navBarItem: 0,
                    iconBath: AppAssets.quranIcon,
                  ),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  icon: CustomNavbarItem(
                    selectedIndex: selectedIndex,
                    navBarItem: 1,
                    iconBath: AppAssets.hadithIcon,
                  ),
                  label: 'Hadith'),
              BottomNavigationBarItem(
                  icon: CustomNavbarItem(
                    selectedIndex: selectedIndex,
                    navBarItem: 2,
                    iconBath: AppAssets.sabahIcon,
                  ),
                  label: 'Sabha'),
              BottomNavigationBarItem(
                  icon: CustomNavbarItem(
                    selectedIndex: selectedIndex,
                    navBarItem: 3,
                    iconBath: AppAssets.radioIcon,
                  ),
                  label: 'Radio'),
              BottomNavigationBarItem(
                  icon: CustomNavbarItem(
                    selectedIndex: selectedIndex,
                    navBarItem: 4,
                    iconBath: AppAssets.timeIcon,
                  ),
                  label: 'Time'),
              BottomNavigationBarItem(
    icon: CustomNavbarItem(
    selectedIndex: selectedIndex,
        navBarItem: 5,
        iconBath: AppAssets.timeIcon,
    ),
    label: 'Qiblah'),
            ]),
        body: tabs[selectedIndex],
      ),
    );
  }
}
