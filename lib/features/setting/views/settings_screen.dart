import 'package:flutter/material.dart';

import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// Profile Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person, size: 32),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Mayur Pawar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('View Profile', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// Preferences Section
          const Text(
            'Preferences',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),

          SettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            trailing: Switch(value: true, onChanged: (value) {}),
          ),

          const SizedBox(height: 24),

          /// Account Section
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),

          SettingsTile(
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),

          const SizedBox(height: 24),

          /// Logout
          SettingsTile(
            icon: Icons.logout,
            title: 'Logout',
            titleColor: Colors.red,
            iconColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
