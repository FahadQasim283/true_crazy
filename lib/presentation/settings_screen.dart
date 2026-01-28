import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/extensions/textstyle_extensions.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Settings State
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _matchNotifications = true;
  bool _messageNotifications = true;
  bool _showOnlineStatus = true;
  bool _showLastSeen = false;
  bool _showReadReceipts = true;
  bool _discoverabilityEnabled = true;
  String _distanceUnit = 'Kilometers';
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Settings', style: context.appTextStyles.heading.withFontSize(20)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.surface,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Account Section
          _buildSectionHeader('Account'),
          _buildSettingsCard(
            children: [
              _buildSettingsTile(
                icon: Icons.person_outline_rounded,
                title: 'Edit Profile',
                subtitle: 'Update your personal information',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to edit profile
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.verified_user_outlined,
                title: 'Verify Account',
                subtitle: 'Get verified badge',
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'PRO',
                    style: context.appTextStyles.small
                        .withFontSize(11)
                        .withFontWeight(FontWeight.w700)
                        .withFontColor(Colors.white),
                  ),
                ),
                onTap: () {
                  // TODO: Navigate to verification
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.credit_card_rounded,
                title: 'Subscription',
                subtitle: 'Manage your premium plan',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to subscription
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Notifications Section
          _buildSectionHeader('Notifications'),
          _buildSettingsCard(
            children: [
              _buildSwitchTile(
                icon: Icons.notifications_outlined,
                title: 'All Notifications',
                subtitle: 'Enable or disable all notifications',
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              if (_notificationsEnabled) ...[
                const Divider(height: 1),
                _buildSwitchTile(
                  icon: Icons.email_outlined,
                  title: 'Email Notifications',
                  value: _emailNotifications,
                  onChanged: (value) {
                    setState(() {
                      _emailNotifications = value;
                    });
                  },
                  iconColor: AppColors.accentCyan,
                ),
                const Divider(height: 1),
                _buildSwitchTile(
                  icon: Icons.phone_android_rounded,
                  title: 'Push Notifications',
                  value: _pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      _pushNotifications = value;
                    });
                  },
                  iconColor: AppColors.secondary,
                ),
                const Divider(height: 1),
                _buildSwitchTile(
                  icon: Icons.favorite_outline_rounded,
                  title: 'Match Notifications',
                  value: _matchNotifications,
                  onChanged: (value) {
                    setState(() {
                      _matchNotifications = value;
                    });
                  },
                  iconColor: AppColors.accentPink,
                ),
                const Divider(height: 1),
                _buildSwitchTile(
                  icon: Icons.message_outlined,
                  title: 'Message Notifications',
                  value: _messageNotifications,
                  onChanged: (value) {
                    setState(() {
                      _messageNotifications = value;
                    });
                  },
                  iconColor: AppColors.primary,
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),

          // Privacy Section
          _buildSectionHeader('Privacy'),
          _buildSettingsCard(
            children: [
              _buildSwitchTile(
                icon: Icons.visibility_outlined,
                title: 'Show Online Status',
                subtitle: 'Let others see when you\'re online',
                value: _showOnlineStatus,
                onChanged: (value) {
                  setState(() {
                    _showOnlineStatus = value;
                  });
                },
              ),
              const Divider(height: 1),
              _buildSwitchTile(
                icon: Icons.access_time_rounded,
                title: 'Show Last Seen',
                subtitle: 'Display your last active time',
                value: _showLastSeen,
                onChanged: (value) {
                  setState(() {
                    _showLastSeen = value;
                  });
                },
              ),
              const Divider(height: 1),
              _buildSwitchTile(
                icon: Icons.done_all_rounded,
                title: 'Read Receipts',
                subtitle: 'Let others know you\'ve read their messages',
                value: _showReadReceipts,
                onChanged: (value) {
                  setState(() {
                    _showReadReceipts = value;
                  });
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.block_rounded,
                title: 'Blocked Users',
                subtitle: 'Manage blocked accounts',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to blocked users
                },
                iconColor: AppColors.error,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Discovery Section
          _buildSectionHeader('Discovery'),
          _buildSettingsCard(
            children: [
              _buildSwitchTile(
                icon: Icons.explore_outlined,
                title: 'Show me in Discovery',
                subtitle: 'Appear in other users\' discovery feed',
                value: _discoverabilityEnabled,
                onChanged: (value) {
                  setState(() {
                    _discoverabilityEnabled = value;
                  });
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.straighten_rounded,
                title: 'Distance Unit',
                subtitle: _distanceUnit,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  _showDistanceUnitPicker();
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.location_on_outlined,
                title: 'Location',
                subtitle: 'Update your location',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to location settings
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Preferences Section
          _buildSectionHeader('Preferences'),
          _buildSettingsCard(
            children: [
              _buildSettingsTile(
                icon: Icons.language_rounded,
                title: 'Language',
                subtitle: _language,
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  _showLanguagePicker();
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.palette_outlined,
                title: 'Theme',
                subtitle: 'Light',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to theme settings
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Security Section
          _buildSectionHeader('Security'),
          _buildSettingsCard(
            children: [
              _buildSettingsTile(
                icon: Icons.lock_outline_rounded,
                title: 'Change Password',
                subtitle: 'Update your password',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to change password
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.security_rounded,
                title: 'Two-Factor Authentication',
                subtitle: 'Add an extra layer of security',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to 2FA settings
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // About Section
          _buildSectionHeader('About'),
          _buildSettingsCard(
            children: [
              _buildSettingsTile(
                icon: Icons.help_outline_rounded,
                title: 'Help & Support',
                subtitle: 'Get help with Truly Crazy',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to help
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.description_outlined,
                title: 'Terms of Service',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to terms
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  // TODO: Navigate to privacy policy
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.info_outline_rounded,
                title: 'App Version',
                subtitle: '1.0.0 (Build 1)',
                trailing: null,
                onTap: null,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Danger Zone
          _buildSectionHeader('Danger Zone'),
          _buildSettingsCard(
            children: [
              _buildSettingsTile(
                icon: Icons.person_off_outlined,
                title: 'Deactivate Account',
                subtitle: 'Temporarily disable your account',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  _showDeactivateDialog();
                },
                iconColor: AppColors.error,
                titleColor: AppColors.error,
              ),
              const Divider(height: 1),
              _buildSettingsTile(
                icon: Icons.delete_forever_rounded,
                title: 'Delete Account',
                subtitle: 'Permanently delete your account and data',
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  _showDeleteDialog();
                },
                iconColor: AppColors.error,
                titleColor: AppColors.error,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Logout Button
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.error, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              onPressed: () {
                _showLogoutDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                'Logout',
                style: context.appTextStyles.title
                    .withFontSize(15)
                    .withFontWeight(FontWeight.w600)
                    .withFontColor(AppColors.error),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title.toUpperCase(),
        style: context.appTextStyles.small
            .withFontSize(12)
            .withFontWeight(FontWeight.w700)
            .withFontColor(AppColors.textSecondary),
      ),
    );
  }

  Widget _buildSettingsCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.black10, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? iconColor,
    Color? titleColor,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.primary).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: context.appTextStyles.body
            .withFontSize(15)
            .withFontWeight(FontWeight.w600)
            .withFontColor(titleColor ?? AppColors.textPrimary),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: context.appTextStyles.small
                  .withFontSize(13)
                  .withFontColor(AppColors.textSecondary),
            )
          : null,
      trailing: trailing,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.primary).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: context.appTextStyles.body.withFontSize(15).withFontWeight(FontWeight.w600),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: context.appTextStyles.small
                  .withFontSize(13)
                  .withFontColor(AppColors.textSecondary),
            )
          : null,
      trailing: Switch(value: value, onChanged: onChanged, activeColor: AppColors.primary),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  void _showDistanceUnitPicker() {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Text('Distance Unit', style: context.appTextStyles.title.withFontSize(18)),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Kilometers'),
                  trailing: _distanceUnit == 'Kilometers'
                      ? Icon(Icons.check_rounded, color: AppColors.primary)
                      : null,
                  onTap: () {
                    setState(() {
                      _distanceUnit = 'Kilometers';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Miles'),
                  trailing: _distanceUnit == 'Miles'
                      ? Icon(Icons.check_rounded, color: AppColors.primary)
                      : null,
                  onTap: () {
                    setState(() {
                      _distanceUnit = 'Miles';
                    });
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLanguagePicker() {
    final languages = ['English', 'Hindi', 'Spanish', 'French', 'German'];
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Text('Select Language', style: context.appTextStyles.title.withFontSize(18)),
                const SizedBox(height: 16),
                ...languages.map(
                  (lang) => ListTile(
                    title: Text(lang),
                    trailing: _language == lang
                        ? Icon(Icons.check_rounded, color: AppColors.primary)
                        : null,
                    onTap: () {
                      setState(() {
                        _language = lang;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text('Logout', style: context.appTextStyles.heading.withFontSize(18)),
          content: Text(
            'Are you sure you want to logout?',
            style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Implement logout
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Logged out successfully'),
                    backgroundColor: AppColors.success,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.all(16),
                  ),
                );
              },
              child: Text(
                'Logout',
                style: context.appTextStyles.body
                    .withFontWeight(FontWeight.w600)
                    .withFontColor(AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeactivateDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text('Deactivate Account', style: context.appTextStyles.heading.withFontSize(18)),
          content: Text(
            'Your account will be temporarily disabled. You can reactivate it anytime by logging in.',
            style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Implement deactivation
              },
              child: Text(
                'Deactivate',
                style: context.appTextStyles.body
                    .withFontWeight(FontWeight.w600)
                    .withFontColor(AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.warning_rounded, color: AppColors.error),
              const SizedBox(width: 8),
              Text('Delete Account', style: context.appTextStyles.heading.withFontSize(18)),
            ],
          ),
          content: Text(
            'This action cannot be undone. All your data, matches, and messages will be permanently deleted.',
            style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Implement account deletion
              },
              child: Text(
                'Delete Forever',
                style: context.appTextStyles.body
                    .withFontWeight(FontWeight.w700)
                    .withFontColor(AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }
}
