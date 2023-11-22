import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _onBottomNavBarItemTap(int index) => widget.child.goBranch(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.child.currentIndex,
        onItemTap: _onBottomNavBarItemTap,
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });

  final int currentIndex;
  final void Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF3C3D42),
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => onItemTap(0),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 0 ? 'pics/house_a.svg' : 'pics/house.svg',
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onItemTap(1),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 1 ? 'pics/teacher_a.svg' : 'pics/teacher.svg',
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onItemTap(2),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 2 ? 'pics/wallet_a.svg' : 'pics/wallet.svg',
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onItemTap(3),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 3 ? 'pics/inbox_a.svg' : 'pics/inbox.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
