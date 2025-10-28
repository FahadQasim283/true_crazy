import 'package:flutter/material.dart';
import 'package:truly_crazy/presentation/chat_screen.dart';
import 'package:truly_crazy/presentation/like_screen.dart';
import 'package:truly_crazy/presentation/profile_screen.dart';
import 'package:truly_crazy/presentation/tmcafe_screen.dart';

// ====== Colors ======
const Color pinkBadge = Color(0xFFFF85B4);
const Color blueButton = Color(0xFF045AD1);
const Color greenButton = Color(0xFF0C8911);
const Color lightGray = Color(0xFFA6B5B8);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    SuggestedScreen(),
    LikeScreen(),
    TmcafeScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: lightGray.withOpacity(0.45))),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, -2),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(Icons.grid_view_rounded, "Suggested", 0),
            Stack(
              clipBehavior: Clip.none,
              children: [
                _bottomNavItem(Icons.favorite_outline, "Likes You", 1),
                Positioned(
                  right: -10,
                  top: -6,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.redAccent.withOpacity(0.25),
                            blurRadius: 6)
                      ],
                    ),
                    child: const Text(
                      "7",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            _bottomNavItem(Icons.coffee_outlined, "TM Cafe", 2),
            _bottomNavItem(Icons.chat_bubble_outline, "Chat", 3),
            _bottomNavItem(Icons.person_outline, "Me", 4),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, String label, int index) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isActive ? pinkBadge.withOpacity(0.08) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: pinkBadge.withOpacity(0.14),
                        blurRadius: 8,
                        spreadRadius: 1,
                      )
                    ]
                  : [],
            ),
            child: Icon(
              icon,
              size: 24,
              color: isActive ? pinkBadge : Colors.black54,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isActive ? pinkBadge : Colors.black54,
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
class SuggestedScreen extends StatefulWidget {
  const SuggestedScreen({super.key});

  @override
  State<SuggestedScreen> createState() => _SuggestedScreenState();
}

class _SuggestedScreenState extends State<SuggestedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Header =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Suggested',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.search, size: 22, color: Colors.black87),
                ],
              ),
              const SizedBox(height: 20),

              // ===== Big Profile Image =====
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.network(
                      'https://picsum.photos/id/1011/400/400',
                      height: 380,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 15,
                      top: 15,
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: pinkBadge,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '50%',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // ===== Profile Details =====
              const Text(
                'I, 29, 160 cm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Lives in Delhi',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // ===== Compatibility Section =====
              const Text(
                'Check Your Compatibility',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black87),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _compatibilityCard(
                      title: 'Personality',
                      subtitle: 'Compatibility',
                      icon: Icons.lock_outline,
                      color: pinkBadge.withOpacity(0.1),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _compatibilityCard(
                      title: 'Astro',
                      subtitle: 'Compatibility',
                      icon: Icons.circle_outlined,
                      color: const Color(0xFFDFF2FF),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ===== Action Buttons =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _roundAction(Icons.close, Colors.black54,
                      bgColor: Colors.black.withOpacity(0.08)),
                  _roundAction(Icons.stacked_line_chart, blueButton,
                      bgColor: blueButton.withOpacity(0.12)),
                  _roundAction(Icons.check, greenButton,
                      bgColor: greenButton.withOpacity(0.12)),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ===== Compatibility Card Widget =====
  Widget _compatibilityCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            width: 38,
            height: 38,
            child: Icon(icon, size: 18, color: Colors.black54),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 13)),
                Text(subtitle,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black38),
        ],
      ),
    );
  }

  // ===== Round Action Buttons =====
  Widget _roundAction(IconData icon, Color iconColor, {Color? bgColor}) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: iconColor, size: 26),
    );
  }
}