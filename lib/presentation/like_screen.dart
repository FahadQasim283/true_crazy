import 'package:flutter/material.dart';
import 'package:truly_crazy/core/constants/app_colors.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
 final List<String> imageUrls = [
    'https://picsum.photos/id/1011/400/400',
    'https://picsum.photos/id/1012/400/400',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Likes You(7)', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: AppColors.textPrimary),
            textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                gridDelegate: 
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10, // space between columns
                  mainAxisSpacing: 10,
                  ),
                  itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(imageUrls[index]),
                      fit: BoxFit.cover, // makes the image fill the container
                    ),
                  ),
              
                  );
                },
              ),
            ),
          ),


          Spacer(),

            const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
              "MatchMaker will share profiles interested in you",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentPink,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                   
                  },
                  child: Text(
                    "See Who Likes You",
                    style: TextStyle(fontSize: 18, color: AppColors.textOnSecondary),
                  ),
                ),
              ),
            ),
          ),
        ],
      ), 
    );
  }
}