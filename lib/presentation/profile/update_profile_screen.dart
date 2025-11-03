import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/extensions/textstyle_extensions.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _instagramController = TextEditingController();
  final _facebookController = TextEditingController();
  final _twitterController = TextEditingController();
  final _linkedinController = TextEditingController();

  String? _selectedCuisine;
  String? _selectedZodiac;
  String? _selectedFirstDate;
  String? _selectedSmoke;
  String? _selectedDrink;
  String? _selectedReligion;
  String? _selectedPastime;

  final List<String> _cuisines = [
    'Italian',
    'Chinese',
    'Mexican',
    'Indian',
    'Japanese',
    'Thai',
    'Mediterranean',
    'American',
    'French',
    'Korean',
  ];

  final List<String> _zodiacSigns = [
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagittarius',
    'Capricorn',
    'Aquarius',
    'Pisces',
  ];

  final List<String> _firstDateIdeas = [
    'Coffee Date',
    'Dinner',
    'Movie',
    'Walk in Park',
    'Museum',
    'Concert',
    'Mini Golf',
    'Cooking Together',
    'Wine Tasting',
    'Adventure Activity',
  ];

  final List<String> _smokeOptions = [
    'Never',
    'Occasionally',
    'Socially',
    'Regularly',
    'Trying to Quit',
  ];

  final List<String> _drinkOptions = [
    'Never',
    'Occasionally',
    'Socially',
    'Regularly',
    'Only on Special Occasions',
  ];

  final List<String> _religions = [
    'Christianity',
    'Islam',
    'Hinduism',
    'Buddhism',
    'Judaism',
    'Sikhism',
    'Atheist',
    'Agnostic',
    'Spiritual',
    'Other',
    'Prefer not to say',
  ];

  final List<String> _pastimes = [
    'Reading',
    'Sports',
    'Gaming',
    'Traveling',
    'Cooking',
    'Photography',
    'Music',
    'Art',
    'Dancing',
    'Fitness',
    'Yoga',
    'Hiking',
    'Writing',
    'Movies/TV',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _instagramController.dispose();
    _facebookController.dispose();
    _twitterController.dispose();
    _linkedinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Update Profile', style: context.appTextStyles.heading.withFontSize(20)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Email Section
              _buildSectionCard(
                title: 'Contact Information',
                icon: Icons.email_rounded,
                iconColor: AppColors.primary,
                children: [
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email Address',
                    hint: 'your.email@example.com',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),

              // Social Media Section
              _buildSectionCard(
                title: 'Social Media',
                icon: Icons.share_rounded,
                iconColor: AppColors.accentCyan,
                children: [
                  _buildTextField(
                    controller: _instagramController,
                    label: 'Instagram',
                    hint: '@username',
                    icon: Icons.camera_alt_outlined,
                    prefixText: 'instagram.com/',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: _facebookController,
                    label: 'Facebook',
                    hint: 'username',
                    icon: Icons.facebook_outlined,
                    prefixText: 'facebook.com/',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: _twitterController,
                    label: 'Twitter/X',
                    hint: '@username',
                    icon: Icons.alternate_email_outlined,
                    prefixText: 'twitter.com/',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: _linkedinController,
                    label: 'LinkedIn',
                    hint: 'username',
                    icon: Icons.work_outline,
                    prefixText: 'linkedin.com/in/',
                  ),
                ],
              ),

              // Preferences Section
              _buildSectionCard(
                title: 'Preferences & Interests',
                icon: Icons.favorite_rounded,
                iconColor: AppColors.secondary,
                children: [
                  _buildDropdown(
                    label: 'Favorite Cuisine',
                    value: _selectedCuisine,
                    items: _cuisines,
                    icon: Icons.restaurant_rounded,
                    onChanged: (value) {
                      setState(() => _selectedCuisine = value);
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    label: 'Zodiac Sign',
                    value: _selectedZodiac,
                    items: _zodiacSigns,
                    icon: Icons.stars_rounded,
                    onChanged: (value) {
                      setState(() => _selectedZodiac = value);
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    label: 'Ideal First Date',
                    value: _selectedFirstDate,
                    items: _firstDateIdeas,
                    icon: Icons.favorite_border_rounded,
                    onChanged: (value) {
                      setState(() => _selectedFirstDate = value);
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    label: 'Favorite Pastime',
                    value: _selectedPastime,
                    items: _pastimes,
                    icon: Icons.sports_esports_rounded,
                    onChanged: (value) {
                      setState(() => _selectedPastime = value);
                    },
                  ),
                ],
              ),

              // Lifestyle Section
              _buildSectionCard(
                title: 'Lifestyle',
                icon: Icons.local_activity_rounded,
                iconColor: AppColors.accentYellow,
                children: [
                  _buildDropdown(
                    label: 'Smoking',
                    value: _selectedSmoke,
                    items: _smokeOptions,
                    icon: Icons.smoke_free_rounded,
                    onChanged: (value) {
                      setState(() => _selectedSmoke = value);
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    label: 'Drinking',
                    value: _selectedDrink,
                    items: _drinkOptions,
                    icon: Icons.local_bar_rounded,
                    onChanged: (value) {
                      setState(() => _selectedDrink = value);
                    },
                  ),
                ],
              ),

              // Religious Beliefs Section
              _buildSectionCard(
                title: 'Religious Beliefs',
                icon: Icons.auto_awesome_rounded,
                iconColor: AppColors.accentLime,
                children: [
                  _buildDropdown(
                    label: 'Religion',
                    value: _selectedReligion,
                    items: _religions,
                    icon: Icons.church_rounded,
                    onChanged: (value) {
                      setState(() => _selectedReligion = value);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Save Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Save Changes',
                      style: context.appTextStyles.title
                          .withFontSize(16)
                          .withFontColor(Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.black10, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Text(title, style: context.appTextStyles.title.withFontSize(18)),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? prefixText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.appTextStyles.body.withFontWeight(FontWeight.w600).withFontSize(14),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppColors.primary),
            prefixText: prefixText,
            prefixStyle: context.appTextStyles.body.withFontColor(AppColors.textSecondary),
            filled: true,
            fillColor: AppColors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required IconData icon,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.appTextStyles.body.withFontWeight(FontWeight.w600).withFontSize(14),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: AppColors.primary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            hint: Text(
              'Select $label',
              style: context.appTextStyles.body.withFontColor(AppColors.textHint),
            ),
            isExpanded: true,
            items: items.map((String item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
            onChanged: onChanged,
            dropdownColor: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement save profile logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Profile updated successfully!'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
        ),
      );
      Navigator.pop(context);
    }
  }
}
