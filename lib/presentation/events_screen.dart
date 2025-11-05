import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/extensions/textstyle_extensions.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  // Mock data for dating events (Admin created)
  final List<Map<String, dynamic>> _upcomingEvents = [
    {
      'id': '1',
      'title': 'Speed Dating Night - Ages 25-35',
      'date': 'Nov 15, 2025',
      'time': '7:00 PM - 10:00 PM',
      'location': 'The Grand Hotel, Mumbai',
      'price': '₹999',
      'attendees': 45,
      'maxAttendees': 50,
      'image': 'https://picsum.photos/400/200?random=30',
      'category': 'Speed Dating',
      'featured': true,
      'description':
          'Meet 10-15 potential matches in one fun evening! Enjoy drinks, conversations, and find your perfect match.',
      'ageGroup': '25-35',
      'gender': 'Mixed',
    },
    {
      'id': '2',
      'title': 'Singles Wine & Dine',
      'date': 'Nov 18, 2025',
      'time': '8:00 PM - 11:00 PM',
      'location': 'Sky Lounge, Delhi',
      'price': '₹1,299',
      'attendees': 28,
      'maxAttendees': 40,
      'image': 'https://picsum.photos/400/200?random=31',
      'category': 'Social Mixer',
      'featured': true,
      'description':
          'An elegant evening of fine dining and romantic connections. Perfect for professionals looking for meaningful relationships.',
      'ageGroup': '28-40',
      'gender': 'Mixed',
    },
    {
      'id': '3',
      'title': 'Coffee Meets Dating - Sunday Brunch',
      'date': 'Nov 20, 2025',
      'time': '11:00 AM - 2:00 PM',
      'location': 'Cafe Delight, Bangalore',
      'price': '₹599',
      'attendees': 35,
      'maxAttendees': 40,
      'image': 'https://picsum.photos/400/200?random=32',
      'category': 'Casual Meet',
      'featured': false,
      'description':
          'Relaxed brunch setting to meet fellow singles. Great food, great vibes, and potential matches!',
      'ageGroup': '22-32',
      'gender': 'Mixed',
    },
    {
      'id': '4',
      'title': 'Adventure Dating - Trekking Together',
      'date': 'Nov 22, 2025',
      'time': '6:00 AM - 4:00 PM',
      'location': 'Nandi Hills, Bangalore',
      'price': '₹899',
      'attendees': 18,
      'maxAttendees': 30,
      'image': 'https://picsum.photos/400/200?random=33',
      'category': 'Outdoor Dating',
      'featured': false,
      'description':
          'For adventure lovers! Trek together, bond over nature, and find someone who shares your passion for the outdoors.',
      'ageGroup': '24-38',
      'gender': 'Mixed',
    },
    {
      'id': '5',
      'title': 'Blind Date Night - Mystery Matches',
      'date': 'Nov 25, 2025',
      'time': '7:30 PM - 10:30 PM',
      'location': 'Secret Location, Mumbai',
      'price': '₹1,499',
      'attendees': 20,
      'maxAttendees': 24,
      'image': 'https://picsum.photos/400/200?random=36',
      'category': 'Exclusive',
      'featured': true,
      'description':
          'Our AI matches you with your perfect date! Experience the thrill of a curated blind date in an exclusive setting.',
      'ageGroup': '26-38',
      'gender': 'Mixed',
    },
    {
      'id': '6',
      'title': 'Couples Cooking Class for Singles',
      'date': 'Nov 28, 2025',
      'time': '6:00 PM - 9:00 PM',
      'location': 'Culinary Studio, Delhi',
      'price': '₹1,199',
      'attendees': 14,
      'maxAttendees': 20,
      'image': 'https://picsum.photos/400/200?random=37',
      'category': 'Activity Dating',
      'featured': false,
      'description':
          'Cook together, laugh together, connect together! Learn to make amazing dishes while meeting someone special.',
      'ageGroup': '25-40',
      'gender': 'Mixed',
    },
  ];

  final List<Map<String, dynamic>> _pastEvents = [
    {
      'id': '7',
      'title': 'Valentine\'s Love Gala 2025',
      'date': 'Feb 14, 2025',
      'attendees': 150,
      'rating': 4.8,
      'image': 'https://picsum.photos/400/200?random=34',
      'matches': 42,
    },
    {
      'id': '8',
      'title': 'Summer Beach Dating Party',
      'date': 'Jul 20, 2025',
      'attendees': 120,
      'rating': 4.9,
      'image': 'https://picsum.photos/400/200?random=35',
      'matches': 35,
    },
    {
      'id': '9',
      'title': 'Monsoon Romance Meetup',
      'date': 'Aug 10, 2025',
      'attendees': 80,
      'rating': 4.7,
      'image': 'https://picsum.photos/400/200?random=38',
      'matches': 28,
    },
  ];

  String _selectedCategory = 'All';
  final List<String> _categories = [
    'All',
    'Speed Dating',
    'Social Mixer',
    'Casual Meet',
    'Outdoor Dating',
    'Exclusive',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          children: [
            Text('Dating Events', style: context.appTextStyles.heading.withFontSize(20)),
            Text(
              'Curated for you',
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
              _showEventInfo();
            },
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // Category Filter
            Container(
              height: 60,
              color: AppColors.surface,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
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

            // Tabs
            Container(
              color: AppColors.surface,
              child: TabBar(
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                labelStyle: context.appTextStyles.body
                    .withFontSize(14)
                    .withFontWeight(FontWeight.w600),
                tabs: const [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Past Events'),
                ],
              ),
            ),

            // Tab Views
            Expanded(child: TabBarView(children: [_buildUpcomingEvents(), _buildPastEvents()])),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _upcomingEvents.length,
      itemBuilder: (context, index) {
        final event = _upcomingEvents[index];
        return _buildEventCard(event);
      },
    );
  }

  Widget _buildPastEvents() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _pastEvents.length,
      itemBuilder: (context, index) {
        final event = _pastEvents[index];
        return _buildPastEventCard(event);
      },
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    final spotsLeft = event['maxAttendees'] - event['attendees'];
    final isFeatured = event['featured'];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: isFeatured ? Border.all(color: AppColors.primary, width: 2) : null,
        boxShadow: [
          BoxShadow(
            color: isFeatured ? AppColors.primary.withOpacity(0.15) : AppColors.black10,
            blurRadius: isFeatured ? 12 : 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  event['image'],
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      color: AppColors.primaryLight.withOpacity(0.2),
                      child: Icon(Icons.event_rounded, size: 60, color: AppColors.primary),
                    );
                  },
                ),
              ),
              if (isFeatured)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'FEATURED',
                      style: context.appTextStyles.small
                          .withFontSize(10)
                          .withFontWeight(FontWeight.w700)
                          .withFontColor(Colors.white),
                    ),
                  ),
                ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    event['category'],
                    style: context.appTextStyles.small
                        .withFontSize(11)
                        .withFontWeight(FontWeight.w600)
                        .withFontColor(Colors.white),
                  ),
                ),
              ),
            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title'],
                  style: context.appTextStyles.title
                      .withFontSize(17)
                      .withFontWeight(FontWeight.w700),
                ),
                const SizedBox(height: 12),

                // Date & Time
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 8),
                    Text(
                      event['date'],
                      style: context.appTextStyles.body
                          .withFontSize(13)
                          .withFontColor(AppColors.textSecondary),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.access_time_rounded, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        event['time'],
                        style: context.appTextStyles.body
                            .withFontSize(13)
                            .withFontColor(AppColors.textSecondary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Location
                Row(
                  children: [
                    Icon(Icons.location_on_rounded, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        event['location'],
                        style: context.appTextStyles.body
                            .withFontSize(13)
                            .withFontColor(AppColors.textSecondary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Age Group & Gender
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.accentPink.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.accentPink.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person_outline_rounded, size: 14, color: AppColors.accentPink),
                          const SizedBox(width: 4),
                          Text(
                            'Ages ${event['ageGroup']}',
                            style: context.appTextStyles.small
                                .withFontSize(11)
                                .withFontWeight(FontWeight.w600)
                                .withFontColor(AppColors.accentPink),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.accentCyan.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.accentCyan.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.wc_rounded, size: 14, color: AppColors.accentCyan),
                          const SizedBox(width: 4),
                          Text(
                            event['gender'],
                            style: context.appTextStyles.small
                                .withFontSize(11)
                                .withFontWeight(FontWeight.w600)
                                .withFontColor(AppColors.accentCyan),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Attendees & Price
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: spotsLeft <= 5
                            ? AppColors.error.withOpacity(0.1)
                            : AppColors.primaryLight.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_rounded,
                            size: 14,
                            color: spotsLeft <= 5 ? AppColors.error : AppColors.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$spotsLeft spots left',
                            style: context.appTextStyles.small
                                .withFontSize(12)
                                .withFontWeight(FontWeight.w600)
                                .withFontColor(
                                  spotsLeft <= 5 ? AppColors.error : AppColors.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      event['price'],
                      style: context.appTextStyles.title
                          .withFontSize(18)
                          .withFontWeight(FontWeight.w700)
                          .withFontColor(AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Register Button
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: isFeatured ? AppColors.primaryGradient : null,
                    color: isFeatured ? null : AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleRegister(event);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Register Now',
                      style: context.appTextStyles.title
                          .withFontSize(15)
                          .withFontWeight(FontWeight.w600)
                          .withFontColor(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPastEventCard(Map<String, dynamic> event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.black10, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.network(
              event['image'],
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100,
                  width: 100,
                  color: AppColors.primaryLight.withOpacity(0.2),
                  child: Icon(Icons.event_rounded, size: 40, color: AppColors.primary),
                );
              },
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title'],
                    style: context.appTextStyles.title
                        .withFontSize(15)
                        .withFontWeight(FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded, size: 14, color: AppColors.textHint),
                      const SizedBox(width: 6),
                      Text(
                        event['date'],
                        style: context.appTextStyles.small
                            .withFontSize(12)
                            .withFontColor(AppColors.textHint),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.people_rounded, size: 14, color: AppColors.textSecondary),
                      const SizedBox(width: 6),
                      Text(
                        '${event['attendees']} attended',
                        style: context.appTextStyles.small
                            .withFontSize(12)
                            .withFontColor(AppColors.textSecondary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.favorite_rounded, size: 14, color: AppColors.accentPink),
                      const SizedBox(width: 6),
                      Text(
                        '${event['matches']} matches made',
                        style: context.appTextStyles.small
                            .withFontSize(12)
                            .withFontWeight(FontWeight.w600)
                            .withFontColor(AppColors.accentPink),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.star_rounded, size: 14, color: AppColors.accentYellow),
                      const SizedBox(width: 4),
                      Text(
                        '${event['rating']}',
                        style: context.appTextStyles.small
                            .withFontSize(12)
                            .withFontWeight(FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleRegister(Map<String, dynamic> event) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Icon(Icons.check_circle_rounded, color: AppColors.success, size: 60),
                  const SizedBox(height: 16),
                  Text(
                    'Confirm Registration',
                    style: context.appTextStyles.heading.withFontSize(20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Register for ${event['title']}?',
                    style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event['price'],
                    style: context.appTextStyles.title
                        .withFontSize(24)
                        .withFontWeight(FontWeight.w700)
                        .withFontColor(AppColors.primary),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 50,
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
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Registered for ${event['title']}!'),
                            backgroundColor: AppColors.success,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.all(16),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        'Confirm & Pay',
                        style: context.appTextStyles.title.withFontColor(Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showEventInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.event_rounded, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'About Dating Events',
                  style: context.appTextStyles.heading.withFontSize(18),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All events are carefully curated by our team to help you meet compatible singles in a safe and fun environment.',
                style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              _buildInfoItem(
                icon: Icons.verified_rounded,
                title: 'Verified Attendees',
                description: 'All participants are verified Truly Crazy members',
              ),
              const SizedBox(height: 12),
              _buildInfoItem(
                icon: Icons.security_rounded,
                title: 'Safe Environment',
                description: 'Professional hosts and secure venues',
              ),
              const SizedBox(height: 12),
              _buildInfoItem(
                icon: Icons.people_rounded,
                title: 'Matched Groups',
                description: 'Age and interest-based grouping for better connections',
              ),
              const SizedBox(height: 12),
              _buildInfoItem(
                icon: Icons.local_activity_rounded,
                title: 'Quality Events',
                description: 'From speed dating to adventure activities',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Got it!',
                style: context.appTextStyles.body
                    .withFontWeight(FontWeight.w600)
                    .withFontColor(AppColors.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: AppColors.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.appTextStyles.body.withFontSize(14).withFontWeight(FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: context.appTextStyles.small
                    .withFontSize(12)
                    .withFontColor(AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
