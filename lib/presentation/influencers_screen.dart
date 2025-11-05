import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/extensions/textstyle_extensions.dart';

class InfluencersScreen extends StatefulWidget {
  const InfluencersScreen({super.key});

  @override
  State<InfluencersScreen> createState() => _InfluencersScreenState();
}

class _InfluencersScreenState extends State<InfluencersScreen> {
  // Mock data for top-rated members/influencers (celebrities on the app)
  final List<Map<String, dynamic>> _influencers = [
    {
      'id': '1',
      'name': 'Emma Rodriguez',
      'title': 'Model & Content Creator',
      'followers': '2.5M',
      'rating': 4.9,
      'verified': true,
      'image': 'https://picsum.photos/200/200?random=10',
      'specialty': 'Lifestyle Influencer',
      'likes': 12400,
      'location': 'Mumbai',
      'age': 26,
      'status': 'Single',
    },
    {
      'id': '2',
      'name': 'Michael Chen',
      'title': 'Fitness Influencer',
      'followers': '1.8M',
      'rating': 4.8,
      'verified': true,
      'image': 'https://picsum.photos/200/200?random=11',
      'specialty': 'Fitness & Wellness',
      'likes': 9500,
      'location': 'Delhi',
      'age': 29,
      'status': 'Single',
    },
    {
      'id': '3',
      'name': 'Sophia Anderson',
      'title': 'Celebrity & Actress',
      'followers': '5.2M',
      'rating': 5.0,
      'verified': true,
      'image': 'https://picsum.photos/200/200?random=12',
      'specialty': 'Entertainment',
      'likes': 21000,
      'location': 'Bangalore',
      'age': 28,
      'status': 'Single',
    },
    {
      'id': '4',
      'name': 'David Thompson',
      'title': 'Travel Vlogger',
      'followers': '980K',
      'rating': 4.7,
      'verified': true,
      'image': 'https://picsum.photos/200/200?random=13',
      'specialty': 'Adventure & Travel',
      'likes': 6800,
      'location': 'Goa',
      'age': 31,
      'status': 'Single',
    },
    {
      'id': '5',
      'name': 'Priya Sharma',
      'title': 'Fashion Designer',
      'followers': '3.1M',
      'rating': 4.9,
      'verified': true,
      'image': 'https://picsum.photos/200/200?random=14',
      'specialty': 'Fashion & Style',
      'likes': 15800,
      'location': 'Mumbai',
      'age': 27,
      'status': 'Single',
    },
    {
      'id': '6',
      'name': 'Rahul Kapoor',
      'title': 'Musician & Singer',
      'followers': '2.8M',
      'rating': 4.8,
      'verified': true,
      'image': 'https://picsum.photos/200/200?random=15',
      'specialty': 'Music & Arts',
      'likes': 13200,
      'location': 'Delhi',
      'age': 30,
      'status': 'Single',
    },
  ];

  String _selectedFilter = 'All';
  final List<String> _filters = [
    'All',
    'Lifestyle',
    'Fitness',
    'Entertainment',
    'Travel',
    'Fashion',
    'Music',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          children: [
            Text('Top Members', style: context.appTextStyles.heading.withFontSize(20)),
            Text(
              'Featured & Verified',
              style: context.appTextStyles.small
                  .withFontSize(11)
                  .withFontColor(AppColors.textSecondary),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.surface,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement search
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            height: 60,
            color: AppColors.surface,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    backgroundColor: AppColors.background,
                    selectedColor: AppColors.primary.withOpacity(0.2),
                    labelStyle: context.appTextStyles.body
                        .withFontSize(13)
                        .withFontColor(isSelected ? AppColors.primary : AppColors.textSecondary)
                        .withFontWeight(isSelected ? FontWeight.w600 : FontWeight.w400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: isSelected ? AppColors.primary : AppColors.divider),
                    ),
                  ),
                );
              },
            ),
          ),

          // Influencers List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _influencers.length,
              itemBuilder: (context, index) {
                final influencer = _influencers[index];
                return _buildInfluencerCard(influencer);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfluencerCard(Map<String, dynamic> influencer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.black10, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            context.push('/influencer-details/${influencer['id']}', extra: influencer);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Profile Image
                Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          influencer['image'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.primaryLight.withOpacity(0.2),
                              child: Icon(Icons.person, color: AppColors.primary, size: 40),
                            );
                          },
                        ),
                      ),
                    ),
                    if (influencer['verified'])
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.surface, width: 2),
                          ),
                          child: const Icon(Icons.verified_rounded, color: Colors.white, size: 14),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              influencer['name'],
                              style: context.appTextStyles.title
                                  .withFontSize(16)
                                  .withFontWeight(FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        influencer['title'],
                        style: context.appTextStyles.body
                            .withFontSize(13)
                            .withFontColor(AppColors.primary),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.stars_rounded, size: 16, color: AppColors.accentYellow),
                          const SizedBox(width: 4),
                          Text(
                            '${influencer['rating']}',
                            style: context.appTextStyles.small
                                .withFontSize(12)
                                .withFontWeight(FontWeight.w600),
                          ),
                          const SizedBox(width: 16),
                          Icon(Icons.people_rounded, size: 16, color: AppColors.textSecondary),
                          const SizedBox(width: 4),
                          Text(
                            influencer['followers'],
                            style: context.appTextStyles.small.withFontSize(12),
                          ),
                          const SizedBox(width: 16),
                          Icon(Icons.favorite_rounded, size: 16, color: AppColors.accentPink),
                          const SizedBox(width: 4),
                          Text(
                            '${influencer['likes']}',
                            style: context.appTextStyles.small.withFontSize(12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.location_on_rounded, size: 12, color: AppColors.primary),
                                const SizedBox(width: 4),
                                Text(
                                  influencer['location'],
                                  style: context.appTextStyles.small
                                      .withFontSize(11)
                                      .withFontColor(AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.accentPink.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '${influencer['age']} yrs',
                              style: context.appTextStyles.small
                                  .withFontSize(11)
                                  .withFontColor(AppColors.accentPink),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Arrow
                Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.textSecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
