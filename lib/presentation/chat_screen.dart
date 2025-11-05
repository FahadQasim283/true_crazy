import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/extensions/textstyle_extensions.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Mock data for users to chat with
  final List<Map<String, dynamic>> _users = [
    {
      'name': 'Sarah',
      'age': 25,
      'location': 'New York',
      'image': 'https://picsum.photos/200/200?random=1',
      'isOnline': true,
      'lastSeen': '2 min ago',
      'isPlusUser': true,
    },
    {
      'name': 'Emma',
      'age': 23,
      'location': 'Los Angeles',
      'image': 'https://picsum.photos/200/200?random=2',
      'isOnline': false,
      'lastSeen': '1 hour ago',
      'isPlusUser': false,
    },
    {
      'name': 'Jessica',
      'age': 26,
      'location': 'Chicago',
      'image': 'https://picsum.photos/200/200?random=3',
      'isOnline': true,
      'lastSeen': '5 min ago',
      'isPlusUser': true,
    },
  ];

  // Set to false to show the plus plan message
  final bool _hasPlusPlan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Chat', style: context.appTextStyles.heading.withFontSize(20)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.surface,
        actions: [
          // Call Button
          IconButton(
            onPressed: _handleCall,
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.call_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: _hasPlusPlan ? _buildUsersList() : _buildPlusPlanPrompt(),
    );
  }

  Widget _buildUsersList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Plus Plan Box
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upgrade to Plus',
                        style: context.appTextStyles.title
                            .withFontSize(16)
                            .withFontColor(Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Chat with unlimited matches and get priority responses',
                        style: context.appTextStyles.small.withFontColor(
                          Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _showPlusPlanBottomSheet,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text('Upgrade'),
                ),
              ],
            ),
          ),

          // Users List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return _buildUserTile(user);
            },
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildPlusPlanPrompt() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          // Title
          Text(
            'Start Chatting Today!',
            style: context.appTextStyles.heading.withFontSize(24),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Connect with amazing people and find your perfect match. Upgrade to Plus to unlock unlimited chats and premium features.',
              style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 40),

          // Plus Plan Box
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.star_rounded, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Truly Crazy Plus',
                            style: context.appTextStyles.title
                                .withFontSize(18)
                                .withFontColor(Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Unlimited chats • Priority matching • Advanced filters • No ads',
                            style: context.appTextStyles.small.withFontColor(
                              Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _showPlusPlanBottomSheet,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Get Plus Plan - ₹299/month',
                      style: context.appTextStyles.title.withFontColor(AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Features List
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: AppColors.black10, blurRadius: 8, offset: const Offset(0, 2)),
              ],
            ),
            child: Column(
              children: [
                _buildFeatureItem(
                  icon: Icons.chat_rounded,
                  title: 'Unlimited Chats',
                  description: 'Chat with as many matches as you want',
                  iconColor: AppColors.primary,
                ),
                const SizedBox(height: 16),
                _buildFeatureItem(
                  icon: Icons.visibility_rounded,
                  title: 'See Who Likes You',
                  description: 'View profiles of people who liked you',
                  iconColor: AppColors.secondary,
                ),
                const SizedBox(height: 16),
                _buildFeatureItem(
                  icon: Icons.filter_list_rounded,
                  title: 'Advanced Filters',
                  description: 'Find matches based on specific preferences',
                  iconColor: AppColors.accentCyan,
                ),
                const SizedBox(height: 16),
                _buildFeatureItem(
                  icon: Icons.priority_high_rounded,
                  title: 'Priority Matching',
                  description: 'Get matched faster with premium algorithm',
                  iconColor: AppColors.accentYellow,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildUserTile(Map<String, dynamic> user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.black10, blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: user['isPlusUser'] ? AppColors.primary : AppColors.divider,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  user['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.primaryLight.withOpacity(0.2),
                      child: Icon(Icons.person, color: AppColors.primary, size: 30),
                    );
                  },
                ),
              ),
            ),
            if (user['isOnline'])
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.online,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.surface, width: 2),
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          children: [
            Text(
              user['name'],
              style: context.appTextStyles.title.withFontSize(16).withFontWeight(FontWeight.w600),
            ),
            const SizedBox(width: 8),
            Text(
              '${user['age']}',
              style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
            ),
            if (user['isPlusUser']) ...[
              const SizedBox(width: 8),
              Icon(Icons.verified_rounded, color: AppColors.primary, size: 16),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user['location'],
              style: context.appTextStyles.small.withFontColor(AppColors.textSecondary),
            ),
            const SizedBox(height: 2),
            Text(
              user['isOnline'] ? 'Online now' : 'Last seen ${user['lastSeen']}',
              style: context.appTextStyles.small.withFontColor(
                user['isOnline'] ? AppColors.online : AppColors.textHint,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () => _startChat(user),
          icon: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 20),
          ),
        ),
        onTap: () => _startChat(user),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.appTextStyles.title.withFontSize(16).withFontWeight(FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: context.appTextStyles.small.withFontColor(AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _handleCall() {
    // TODO: Implement call functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Call feature coming soon!'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _startChat(Map<String, dynamic> user) {
    // TODO: Navigate to chat conversation screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Starting chat with ${user['name']}...'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showPlusPlanBottomSheet() {
    // TODO: Implement plus plan bottom sheet
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Plus plan bottom sheet will be implemented later'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(16),
      ),
    );
  }
}
