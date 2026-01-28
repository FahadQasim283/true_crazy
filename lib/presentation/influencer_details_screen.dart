import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/extensions/textstyle_extensions.dart';
import '../../core/shared/widgets/premium_purchase_bottom_sheet.dart';

class InfluencerDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> influencer;

  const InfluencerDetailsScreen({super.key, required this.influencer});

  @override
  State<InfluencerDetailsScreen> createState() => _InfluencerDetailsScreenState();
}

class _InfluencerDetailsScreenState extends State<InfluencerDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Sarah Johnson',
      'rating': 5.0,
      'comment':
          'Such an inspiring person! Love their content and positive vibes. Would love to connect!',
      'date': '2 days ago',
      'image': 'https://picsum.photos/50/50?random=20',
    },
    {
      'name': 'Mike Peterson',
      'rating': 4.8,
      'comment': 'Amazing personality and great conversations. Really engaging profile!',
      'date': '1 week ago',
      'image': 'https://picsum.photos/50/50?random=21',
    },
    {
      'name': 'Emily Davis',
      'rating': 5.0,
      'comment': 'One of the most genuine people on this app. Their stories are so relatable!',
      'date': '2 weeks ago',
      'image': 'https://picsum.photos/50/50?random=22',
    },
    {
      'name': 'Raj Malhotra',
      'rating': 4.9,
      'comment': 'Great energy and authentic content. Love following their journey!',
      'date': '3 weeks ago',
      'image': 'https://picsum.photos/50/50?random=23',
    },
  ];

  final List<Map<String, String>> _achievements = [
    {'icon': '🏆', 'title': 'Top Rated', 'description': '2024'},
    {'icon': '⭐', 'title': 'Featured', 'description': 'Member'},
    {'icon': '�', 'title': '10K+', 'description': 'Likes'},
    {'icon': '✨', 'title': 'Verified', 'description': 'Profile'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // App Bar with Image
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: AppColors.surface,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // TODO: Share influencer
                },
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.share_rounded, color: Colors.white, size: 18),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.influencer['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.primaryLight.withOpacity(0.2),
                        child: Icon(Icons.person, size: 80, color: AppColors.primary),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.influencer['name'],
                                style: context.appTextStyles.heading
                                    .withFontSize(24)
                                    .withFontColor(Colors.white),
                              ),
                            ),
                            if (widget.influencer['verified'])
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.verified_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.influencer['title'],
                          style: context.appTextStyles.body
                              .withFontSize(14)
                              .withFontColor(Colors.white.withOpacity(0.9)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Stats
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black10,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStat(
                        icon: Icons.stars_rounded,
                        value: '${widget.influencer['rating']}',
                        label: 'Rating',
                        color: AppColors.accentYellow,
                      ),
                      _buildDivider(),
                      _buildStat(
                        icon: Icons.people_rounded,
                        value: widget.influencer['followers'],
                        label: 'Followers',
                        color: AppColors.primary,
                      ),
                      _buildDivider(),
                      _buildStat(
                        icon: Icons.favorite_rounded,
                        value: '${widget.influencer['likes']}',
                        label: 'Likes',
                        color: AppColors.accentPink,
                      ),
                    ],
                  ),
                ),

                // Achievements
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black10,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Achievements',
                        style: context.appTextStyles.title
                            .withFontSize(18)
                            .withFontWeight(FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _achievements.map((achievement) {
                          return Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    achievement['icon']!,
                                    style: const TextStyle(fontSize: 28),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                achievement['title']!,
                                style: context.appTextStyles.body
                                    .withFontSize(13)
                                    .withFontWeight(FontWeight.w600),
                              ),
                              Text(
                                achievement['description']!,
                                style: context.appTextStyles.small
                                    .withFontSize(11)
                                    .withFontColor(AppColors.textSecondary),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Tabs
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black10,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        indicatorColor: AppColors.primary,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.textSecondary,
                        labelStyle: context.appTextStyles.body
                            .withFontSize(14)
                            .withFontWeight(FontWeight.w600),
                        tabs: const [
                          Tab(text: 'About'),
                          Tab(text: 'Reviews'),
                          Tab(text: 'Gallery'),
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: TabBarView(
                          controller: _tabController,
                          children: [_buildAboutTab(), _buildReviewsTab(), _buildGalleryTab()],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildStat({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: context.appTextStyles.title.withFontSize(18).withFontWeight(FontWeight.w700),
        ),
        Text(
          label,
          style: context.appTextStyles.small
              .withFontSize(12)
              .withFontColor(AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(width: 1, height: 50, color: AppColors.divider);
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About ${widget.influencer['name']}',
            style: context.appTextStyles.title.withFontSize(16).withFontWeight(FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            'Experienced ${widget.influencer['title']} with over 10 years of expertise in helping individuals find meaningful connections. Specialized in ${widget.influencer['specialty']} with a proven track record of success.',
            style: context.appTextStyles.body
                .withFontSize(14)
                .withFontColor(AppColors.textSecondary),
          ),
          const SizedBox(height: 20),
          Text(
            'Expertise',
            style: context.appTextStyles.title.withFontSize(16).withFontWeight(FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _buildInfoItem('Location', widget.influencer['location'], Icons.location_on_rounded),
          _buildInfoItem('Age', '${widget.influencer['age']} years', Icons.cake_rounded),
          _buildInfoItem('Status', widget.influencer['status'], Icons.favorite_rounded),
          const SizedBox(height: 20),
          Text(
            'Interests',
            style: context.appTextStyles.title.withFontSize(16).withFontWeight(FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _buildInterestChip('Travel & Adventure'),
          _buildInterestChip('Photography'),
          _buildInterestChip('Fitness & Yoga'),
          _buildInterestChip('Music & Dance'),
          _buildInterestChip('Food & Cooking'),
          const SizedBox(height: 20),
          Text(
            'Looking For',
            style: context.appTextStyles.title.withFontSize(16).withFontWeight(FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            'Someone genuine, adventurous, and ready for a meaningful connection. Love deep conversations, trying new things, and making memories together.',
            style: context.appTextStyles.body
                .withFontSize(14)
                .withFontColor(AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.appTextStyles.small
                    .withFontSize(11)
                    .withFontColor(AppColors.textSecondary),
              ),
              Text(
                value,
                style: context.appTextStyles.body.withFontSize(14).withFontWeight(FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInterestChip(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_rounded, color: AppColors.accentPink, size: 16),
          const SizedBox(width: 8),
          Text(
            text,
            style: context.appTextStyles.body.withFontSize(13).withFontColor(AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _reviews.length,
      itemBuilder: (context, index) {
        final review = _reviews[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 20, backgroundImage: NetworkImage(review['image'])),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review['name'],
                          style: context.appTextStyles.body
                              .withFontSize(14)
                              .withFontWeight(FontWeight.w600),
                        ),
                        Text(
                          review['date'],
                          style: context.appTextStyles.small
                              .withFontSize(11)
                              .withFontColor(AppColors.textHint),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: AppColors.accentYellow, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${review['rating']}',
                        style: context.appTextStyles.body
                            .withFontSize(13)
                            .withFontWeight(FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                review['comment'],
                style: context.appTextStyles.body
                    .withFontSize(13)
                    .withFontColor(AppColors.textSecondary),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGalleryTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/300/350?random=${index + 40}'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.favorite_rounded, color: AppColors.accentPink, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        '${(index + 1) * 234}',
                        style: context.appTextStyles.small
                            .withFontSize(11)
                            .withFontColor(Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(color: AppColors.black10, blurRadius: 8, offset: const Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Like Button
            Container(
              width: 60,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.accentPink.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.accentPink, width: 2),
              ),
              child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Liked ${widget.influencer['name']}! 💕'),
                      backgroundColor: AppColors.accentPink,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      margin: const EdgeInsets.all(16),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_rounded, color: AppColors.accentPink, size: 24),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Messaging ${widget.influencer['name']}...'),
                      backgroundColor: AppColors.primary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      margin: const EdgeInsets.all(16),
                    ),
                  );
                },
                icon: const Icon(Icons.message_rounded, size: 20),
                label: const Text('Message'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: BorderSide(color: AppColors.primary, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showConnectSheet();
                  },
                  icon: const Icon(Icons.person_add_rounded, size: 20),
                  label: const Text('Connect'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConnectSheet() {
    PremiumPurchaseBottomSheet.show(
      context,
      title: 'Connect with ${widget.influencer['name']}',
      subtitle: 'Unlock premium features to connect with top members',
      plans: [
        PremiumPlan(duration: '1 Week', weeks: 1, originalPrice: 1399),
        PremiumPlan(
          duration: '6 Weeks',
          weeks: 6,
          originalPrice: 4999,
          discountedPrice: 4499,
          discountPercentage: 10,
          isPopular: true,
        ),
        PremiumPlan(
          duration: '20 Weeks',
          weeks: 20,
          originalPrice: 9999,
          discountedPrice: 7999,
          discountPercentage: 20,
        ),
      ],
      onPurchase: (plan) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Premium activated! You can now connect with ${widget.influencer['name']}',
            ),
            backgroundColor: AppColors.success,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(16),
          ),
        );
      },
    );
  }
}
