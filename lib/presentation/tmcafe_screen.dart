import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:truly_crazy/core/constants/app_colors.dart';
import 'package:truly_crazy/presentation/detail_screen.dart';

class TmcafeScreen extends StatefulWidget {
  const TmcafeScreen({super.key});

  @override
  State<TmcafeScreen> createState() => _TmcafeScreenState();
}

class _TmcafeScreenState extends State<TmcafeScreen> {
  final List<String> textItems = [
    'When will I find\nmy true love?',
    'Feeling lonely small\nthings make me happy'
  ];

  final List<Map<String, dynamic>> profiles = [
    {
      "name": "Alice Johnson",
      "image": "https://picsum.photos/id/1011/400/400",
      "rating": 4.8,
      "dating": "Dating",
      "hours": "41 hours",
    },
    {
      "name": "Brian Smith",
      "image": "https://picsum.photos/id/1012/400/400",
      "rating": 4.2,
      "dating": "Dating",
      "hours": "20 hours",
    },
  ];

  int selectedButtonIndex = 0;
  final List<String> buttonLabels = ["Coaches", "Astrologers", "Listeners"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6EC),

      // ✅ Fixed Bottom Buttons (Blue background + White text)
      bottomNavigationBar: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(buttonLabels.length, (index) {
            final isSelected = selectedButtonIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedButtonIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.3,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : [],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    buttonLabels[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),

      // ✅ BODY CONTENT
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TM Cafe',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.dividerDark,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          '\$ 0',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textOnPrimary,
                          ),
                        ),
                        VerticalDivider(color: Colors.grey, width: 1),
                        Text(
                          '+',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textOnPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              const Text(
                'Tap to know more',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),

              const SizedBox(height: 20),

              // ✅ CAROUSEL
              CarouselSlider.builder(
                itemCount: textItems.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: NetworkImage("https://picsum.photos/600/200"),
                        fit: BoxFit.cover,
                        opacity: 0.2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textItems[index],
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 100.0,
                  autoPlay: false,
                  viewportFraction: 0.9,
                ),
              ),

              const SizedBox(height: 16),

              // ✅ PROFILE LIST
              Expanded(
                child: ListView.builder(
                  itemCount: profiles.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final profile = profiles[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen()));
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: NetworkImage(profile['image']),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profile['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: Colors.grey, size: 18),
                                        const SizedBox(width: 4),
                                        Text(
                                          profile['rating'].toString(),
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(width: 12),
                                        const Icon(Icons.access_time,
                                            color: Colors.grey, size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          profile['hours'],
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      profile['dating'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    const Text(
                                      'Empower your connections with Truly Crazy - where every match is a step towards something extraordinary.',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                        ),
                                        child: const Text(
                                          "On Call",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
