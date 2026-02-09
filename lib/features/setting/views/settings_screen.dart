import 'package:flutter/material.dart';

import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ProfileHeaderCard(
              name: "Ronald Richards",
              email: "ronaldrichards@gmail.com",
              imageUrl: "https://i.pravatar.cc/150?img=3",
            ),

            const SizedBox(height: 24),
            SettingsSection(
              title: "Fitness",
              children: [
                SettingsTile(icon: Icons.flag_outlined, title: "Fitness Goals"),
                SettingsTile(icon: Icons.fitness_center, title: "Workout Plan"),
                SettingsTile(
                  icon: Icons.photo_camera_outlined,
                  title: "Progress Photos",
                ),
                SettingsTile(
                  icon: Icons.monitor_weight_outlined,
                  title: "Body Measurements",
                ),
                SettingsTile(
                  icon: Icons.alarm_outlined,
                  title: "Workout Reminders",
                ),
              ],
            ),

            const SizedBox(height: 24),

            SettingsSection(
              title: "Account",
              children: [
                SettingsTile(
                  icon: Icons.person_outline,
                  title: "Manage Profile",
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.lock_outline,
                  title: "Password & Security",
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.language,
                  title: "Language",
                  trailingText: "English",
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            SettingsSection(
              title: "Preferences",
              children: [
                SettingsTile(
                  icon: Icons.info_outline,
                  title: "About Us",
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.dark_mode_outlined,
                  title: "Theme",
                  trailingText: "Light",
                  onTap: () {},
                ),
                SettingsTile(
                  icon: Icons.calendar_today_outlined,
                  title: "Appointments",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(email, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
