import 'package:flutter/material.dart';

class ProfileOnboardingScreen extends StatefulWidget {
  const ProfileOnboardingScreen({super.key});

  @override
  State<ProfileOnboardingScreen> createState() =>
      _ProfileOnboardingScreenState();
}

class _ProfileOnboardingScreenState extends State<ProfileOnboardingScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();

  String selectedGoal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "🔥 Let’s Set Up Your Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Name
              _buildTextField("Your Name", _nameController),

              const SizedBox(height: 16),

              // Age
              _buildTextField(
                "Your Age",
                _ageController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              // Weight
              _buildTextField(
                "Your Weight (kg)",
                _weightController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),

              const Text(
                "Your Goal",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  _goalCard("Lose Fat"),
                  const SizedBox(width: 10),
                  _goalCard("Gain Muscle"),
                ],
              ),
              const SizedBox(height: 10),
              _goalCard("Maintain Fitness"),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isFormValid() ? () {} : null,
                  child: const Text("Continue", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _goalCard(String goal) {
    final isSelected = selectedGoal == goal;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGoal = goal;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            goal,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _nameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _weightController.text.isNotEmpty &&
        selectedGoal.isNotEmpty;
  }
}
