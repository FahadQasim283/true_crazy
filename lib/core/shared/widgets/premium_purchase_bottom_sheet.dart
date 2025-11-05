import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../extensions/textstyle_extensions.dart';

/// Model class for premium plan data
class PremiumPlan {
  final String duration;
  final int weeks;
  final double originalPrice;
  final double? discountedPrice;
  final int? discountPercentage;
  final bool isPopular;

  PremiumPlan({
    required this.duration,
    required this.weeks,
    required this.originalPrice,
    this.discountedPrice,
    this.discountPercentage,
    this.isPopular = false,
  });

  double get finalPrice => discountedPrice ?? originalPrice;
  bool get hasDiscount => discountedPrice != null && discountPercentage != null;
}

/// Reusable Premium Purchase Bottom Sheet
class PremiumPurchaseBottomSheet extends StatefulWidget {
  final List<PremiumPlan> plans;
  final Duration? offerDuration;
  final String? title;
  final String? subtitle;
  final Function(PremiumPlan plan)? onPurchase;

  const PremiumPurchaseBottomSheet({
    super.key,
    required this.plans,
    this.offerDuration,
    this.title,
    this.subtitle,
    this.onPurchase,
  });

  @override
  State<PremiumPurchaseBottomSheet> createState() => _PremiumPurchaseBottomSheetState();

  /// Static method to show the bottom sheet
  static Future<void> show(
    BuildContext context, {
    required List<PremiumPlan> plans,
    Duration? offerDuration,
    String? title,
    String? subtitle,
    Function(PremiumPlan plan)? onPurchase,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PremiumPurchaseBottomSheet(
        plans: plans,
        offerDuration: offerDuration,
        title: title,
        subtitle: subtitle,
        onPurchase: onPurchase,
      ),
    );
  }
}

class _PremiumPurchaseBottomSheetState extends State<PremiumPurchaseBottomSheet> {
  Timer? _timer;
  Duration? _remainingTime;

  @override
  void initState() {
    super.initState();
    if (widget.offerDuration != null) {
      _remainingTime = widget.offerDuration;
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime != null && _remainingTime!.inSeconds > 0) {
        setState(() {
          _remainingTime = Duration(seconds: _remainingTime!.inSeconds - 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final hasDiscount = widget.plans.any((plan) => plan.hasDiscount);

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
            // Handle bar
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),

            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Icon
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.workspace_premium_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    widget.title ?? 'Upgrade to Premium',
                    style: context.appTextStyles.heading
                        .withFontSize(22)
                        .withFontWeight(FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    widget.subtitle ?? 'Unlock all features and find your perfect match faster',
                    style: context.appTextStyles.body
                        .withFontColor(AppColors.textSecondary)
                        .withFontSize(14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Timer Section (if discount available)
            if (hasDiscount && _remainingTime != null) ...[
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.secondary.withOpacity(0.1),
                      AppColors.accentYellow.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondary.withOpacity(0.3), width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_fire_department_rounded, color: AppColors.secondary, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Limited Offer Ends in ',
                      style: context.appTextStyles.body
                          .withFontSize(13)
                          .withFontWeight(FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        _formatDuration(_remainingTime!),
                        style: context.appTextStyles.body
                            .withFontSize(13)
                            .withFontWeight(FontWeight.w700)
                            .withFontColor(Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Plans List
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(children: widget.plans.map((plan) => _buildPlanCard(plan)).toList()),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(PremiumPlan plan) {
    final isPopular = plan.isPopular;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPopular ? AppColors.primary : AppColors.divider,
          width: isPopular ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isPopular ? AppColors.primary.withOpacity(0.15) : AppColors.black10,
            blurRadius: isPopular ? 12 : 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Popular Badge
          if (isPopular)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(14),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  'POPULAR',
                  style: context.appTextStyles.small
                      .withFontSize(10)
                      .withFontWeight(FontWeight.w700)
                      .withFontColor(Colors.white),
                ),
              ),
            ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Duration Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plan.duration,
                            style: context.appTextStyles.title
                                .withFontSize(16)
                                .withFontWeight(FontWeight.w700),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${plan.weeks} ${plan.weeks == 1 ? 'Week' : 'Weeks'} Access',
                            style: context.appTextStyles.small
                                .withFontColor(AppColors.textSecondary)
                                .withFontSize(12),
                          ),
                        ],
                      ),
                    ),

                    // Price Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Discount Badge
                        if (plan.hasDiscount)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.error,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '${plan.discountPercentage}% OFF',
                              style: context.appTextStyles.small
                                  .withFontSize(11)
                                  .withFontWeight(FontWeight.w700)
                                  .withFontColor(Colors.white),
                            ),
                          ),
                        const SizedBox(height: 4),

                        // Discounted Price
                        Row(
                          children: [
                            if (plan.hasDiscount) ...[
                              Text(
                                '₹${plan.originalPrice.toInt()}',
                                style: context.appTextStyles.body
                                    .withFontSize(14)
                                    .withFontColor(AppColors.textHint)
                                    .copyWith(decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(width: 8),
                            ],
                            Text(
                              '₹${plan.finalPrice.toInt()}',
                              style: context.appTextStyles.title
                                  .withFontSize(20)
                                  .withFontWeight(FontWeight.w700)
                                  .withFontColor(AppColors.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Buy Button
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: isPopular ? AppColors.primaryGradient : null,
                    color: isPopular ? null : AppColors.primary,
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
                      if (widget.onPurchase != null) {
                        widget.onPurchase!(plan);
                      }
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Buy Now',
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
}

/// Helper method to create default premium plans
class PremiumPlanHelper {
  static List<PremiumPlan> getDefaultPlans({bool includeDiscount = false}) {
    if (includeDiscount) {
      return [
        PremiumPlan(
          duration: '1 Week',
          weeks: 1,
          originalPrice: 1399,
          discountedPrice: 839,
          discountPercentage: 40,
        ),
        PremiumPlan(
          duration: '6 Weeks',
          weeks: 6,
          originalPrice: 1599,
          discountedPrice: 959,
          discountPercentage: 40,
          isPopular: true,
        ),
        PremiumPlan(
          duration: '20 Weeks',
          weeks: 20,
          originalPrice: 1799,
          discountedPrice: 1079,
          discountPercentage: 40,
        ),
      ];
    } else {
      return [
        PremiumPlan(duration: '1 Week', weeks: 1, originalPrice: 1399),
        PremiumPlan(duration: '6 Weeks', weeks: 6, originalPrice: 1599, isPopular: true),
        PremiumPlan(duration: '20 Weeks', weeks: 20, originalPrice: 1799),
      ];
    }
  }
}
