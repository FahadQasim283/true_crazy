import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:truly_crazy/presentation/suggested_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB3E5FC),
                  Color(0xFFFFCDD2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // Make the top/middle content scrollable on small screens while
                // keeping the bottom sheet fixed.
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 60),

                        // Logo and title row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/appicon.png',
                              height: 40,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "trulycrazy",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEA4C89),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),
                        const Text(
                          "Start your love story!",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Container with Stack for image + overlay text chip
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/couple_image.png',
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height * 0.35,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: double.infinity,
                                      height: MediaQuery.of(context).size.height * 0.35,
                                      color: const Color(0xFFECEFF1),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            Icons.image_not_supported,
                                            size: 48,
                                            color: Colors.black26,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Image not available',
                                            style: TextStyle(
                                              color: Colors.black38,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // Overlay text chip
                              Positioned(
                                bottom: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Start your love Story ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "with TrulyMadly",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
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

                // Bottom sheet container (fixed)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Google button
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/google_icon.png',
                          height: 22,
                        ),
                        label: const Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4285F4),
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Truecaller button
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 22,
                        ),
                        label: const Text(
                          "Continue with Truecaller",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0075EB),
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Continue with Mobile text
                      GestureDetector(
                        onTap: () {
                          _mobileLoginBottomSheet(context);
                        },
                        child: const Text(
                          "Continue with Mobile",
                          style: TextStyle(
                            color: Color(0xFF007BFF),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Terms & Privacy Policy text
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "By continuing, you agree with our ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                            TextSpan(
                              text: "Terms",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF007BFF),
                              ),
                            ),
                            TextSpan(
                              text: " & ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF007BFF),
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future  _mobileLoginBottomSheet(BuildContext context) {
    return showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 30, 24, 40),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Mobile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // ===== Row: Country Code + Phone Number =====
                        Row(
                          children: [
                            // Country Code Dropdown
                            Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F3F6),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: '+92',
                                  items: const [
                                    DropdownMenuItem(
                                      value: '+92',
                                      child: Text('+92'),
                                    ),
                                    DropdownMenuItem(
                                      value: '+91',
                                      child: Text('+91'),
                                    ),
                                    DropdownMenuItem(
                                      value: '+1',
                                      child: Text('+1'),
                                    ),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Phone Number Field
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  filled: true,
                                  fillColor: const Color(0xFFF1F3F6),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // ===== Continue Button =====
                        ElevatedButton(
                          onPressed: () {
                            _otpBottomSheet(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Colors.blueAccent,
                            minimumSize: const Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ===== More Options Link =====
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "More Options",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ===== Terms and Privacy =====
                        Center(
                          child: Text(
                            "By continuing, you agree with our Terms & Privacy Policy",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        }
        Future  _otpBottomSheet(BuildContext context){
          return showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 36),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ===== Title Row =====
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "OTP",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Add resend logic here
                              },
                              child: const Text(
                                "Resend",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // ===== OTP Input Fields =====
                        OtpTextField(
                          numberOfFields: 4,
                          borderWidth: 1.2,
                          showFieldAsBox: true,
                          borderColor: Colors.grey.shade300,
                          focusedBorderColor: Colors.blueAccent,
                          fieldWidth: 55,
                          filled: true,
                          fillColor: const Color(0xFFF1F3F6),
                          borderRadius: BorderRadius.circular(12),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          onSubmit: (otp) {
                            debugPrint("Entered OTP: $otp");
                          },
                        ),

                        const SizedBox(height: 14),

                        // ===== Info Row =====
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "We have sent OTP to ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                            const Text(
                              "7519082385",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // Close sheet to edit
                              },
                              child: const Icon(Icons.edit, size: 16),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // ===== Submit Button =====
                        ElevatedButton(
                          onPressed: () {
                            _languageSelectionBottomSheet(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Colors.blueAccent,
                            minimumSize: const Size(double.infinity, 52),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ===== Terms & Privacy =====
                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                "By continuing, you agree with our ",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Terms",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Text(
                                " & ",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        }
        Future _languageSelectionBottomSheet(BuildContext context){
          String selectedLang = "English";
          return showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setModalState) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.fromLTRB(24, 32, 24, 40),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                            // ===== TITLE =====
                            const Text(
                              "Choose your",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Language",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 32),

                            // ===== LANGUAGE CARDS =====
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                _languageCard(
                                  code: "A",
                                  title: "English",
                                  isSelected:
                                      selectedLang == "English",
                                  onTap: () => setModalState(() =>
                                      selectedLang = "English"),
                                ),
                                _languageCard(
                                  code: "B",
                                  title: "Bahasa Indonesia",
                                  isSelected: selectedLang ==
                                      "Bahasa Indonesia",
                                  onTap: () => setModalState(() =>
                                      selectedLang =
                                          "Bahasa Indonesia"),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: _languageCard(
                                code: "क",
                                title: "हिन्दी\nHindi",
                                isSelected:
                                    selectedLang == "Hindi",
                                onTap: () => setModalState(
                                    () => selectedLang = "Hindi"),
                              ),
                            ),

                            const SizedBox(height: 40),

                            // ===== CONTINUE BUTTON =====
                            ElevatedButton(
                              onPressed: () {
                                debugPrint(
                                    "Selected Language: $selectedLang");
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SuggestedScreen()));
                              
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                minimumSize:
                                    const Size(double.infinity, 52),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
        }
         // ===== LANGUAGE CARD WIDGET =====
  Widget _languageCard({
    required String code,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F0FE) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color:
                isSelected ? Colors.blueAccent : const Color(0xFFE5E7EB),
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: isSelected
                  ? Colors.blueAccent
                  : const Color(0xFFF3F4F6),
              child: Text(
                code,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
