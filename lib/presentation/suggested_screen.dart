import 'package:flutter/material.dart';

const Color pinkBadge = Color(0xFFFF85B4);
const Color blueButton = Color(0xFF045AD1);
const Color greenButton = Color(0xFF0C8911);
const Color lightGray = Color(0xFFA6B5B8);



class SuggestedScreen extends StatelessWidget {
  const SuggestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            children: [
              // ===== Profile image section =====
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      // Example profile image placeholder
                      // Positioned.fill(
                      //   child: Image.asset(
                      //     'assets/profile.jpg',
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),

                      // Subtle white overlay bottom
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(18)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 6,
                                  offset: const Offset(0, -3)),
                            ],
                          ),
                        ),
                      ),

                      // Gradient overlay at bottom
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.black.withOpacity(0.55),
                                Colors.transparent
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Pink badge 50%
                      Positioned(
                        right: 20,
                        top: MediaQuery.of(context).size.height * 0.28,
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: pinkBadge,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: pinkBadge.withOpacity(0.34),
                                blurRadius: 10,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              '50%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ===== White card area =====
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== Name / age / height =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "I, 29, 160 cm",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text("Lives in Delhi",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black54)),
                          ],
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ===== Compatibility heading =====
                    const Text("Check Your Compatibility",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16)),

                    const SizedBox(height: 12),

                    // ===== Compatibility cards =====
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: _compatCard(
                            labelTop: "Personality",
                            labelBottom: "Compatibility",
                            icon: Icons.lock_outline,
                            background: pinkBadge.withOpacity(0.12),
                            border: pinkBadge.withOpacity(0.25),
                            textColor: Colors.black87,
                            innerIconBg: pinkBadge.withOpacity(0.2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 5,
                          child: _compatCard(
                            labelTop: "Astro",
                            labelBottom: "Compatibility",
                            icon: Icons.circle_outlined,
                            background: const Color(0xFFDFF2FF),
                            border: const Color(0xFFBFDFF6),
                            textColor: Colors.black87,
                            innerIconBg: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),


                    // ===== Action buttons =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _roundAction(Icons.close, Colors.black54, 60,
                            bgColor: Colors.black.withOpacity(0.08)),
                        _roundAction(Icons.stacked_line_chart, blueButton, 58,
                            bgColor: blueButton.withOpacity(0.12)),
                        _roundAction(Icons.check, greenButton, 60,
                            bgColor: greenButton.withOpacity(0.12)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),

      // ===== Bottom Navigation Bar =====
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: lightGray.withOpacity(0.45))),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, -2))
          ],
        ),
       
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: _bottomNavItem(Icons.grid_view_rounded, "Suggested", true),
            ),
            Flexible(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _bottomNavItem(Icons.favorite_outline, "Likes You", false),
                  Positioned(
                    right: -10,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
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
            ),
            Flexible(
                child: _bottomNavItem(Icons.coffee_outlined, "TM Cafe", false)),
            Flexible(
                child:
                    _bottomNavItem(Icons.chat_bubble_outline, "Chat", false)),
            Flexible(
                child: _bottomNavItem(Icons.person_outline, "Me", false)),
          ],
        ),
      ),
    );
  }

  // ===== Compatibility Card =====
  static Widget _compatCard({
    required String labelTop,
    required String labelBottom,
    required IconData icon,
    required Color background,
    required Color border,
    required Color textColor,
    required Color innerIconBg,
  }) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: innerIconBg,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2))
              ],
            ),
            child: Icon(icon, size: 18, color: Colors.black54),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(labelTop,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 13)),
                const SizedBox(height: 2),
                Text(labelBottom,
                    style: TextStyle(
                        color: textColor.withOpacity(0.9),
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
  static Widget _roundAction(IconData icon, Color iconColor, double size,
      {Color? bgColor}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: iconColor, size: size * 0.45),
    );
  }

  // ===== Bottom Nav Item =====
  static Widget _bottomNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6), // reduced from 8 → fix overflow
          decoration: BoxDecoration(
            color: isActive ? pinkBadge.withOpacity(0.08) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isActive
                ? [
                    BoxShadow(
                        color: pinkBadge.withOpacity(0.14),
                        blurRadius: 8,
                        spreadRadius: 1)
                  ]
                : [],
          ),
          child: Icon(icon,
              size: 24, // slightly smaller
              color: isActive ? pinkBadge : Colors.black54),
        ),
        const SizedBox(height: 2), // reduced to save space
        Text(
          label,
          style: TextStyle(
              color: isActive ? pinkBadge : Colors.black54,
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500),
        )
      ],
    );
  }
}
