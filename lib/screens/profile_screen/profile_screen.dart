import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/providers/auth_provider/auth_provider.dart';
import 'package:stylish/util/app_colors.dart';
import 'package:stylish/util/app_fonts.dart';
import 'package:stylish/util/app_routes.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _nameController = TextEditingController();
  bool _isNameSet = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(authStateChangeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
      body: userAsync.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('No user is logged in.'));
          }

          final email = user.email ?? 'No Email';
          final photoUrl = user.photoURL;

          // Only set once
          if (!_isNameSet) {
            _nameController.text = user.displayName ?? 'No Name';
            _isNameSet = true;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        photoUrl != null
                            ? NetworkImage(photoUrl)
                            : const AssetImage('assets/images/user_profile.png')
                                as ImageProvider,
                  ),
                ),
                const SizedBox(height: 20),

                // Show current name from text controller
                Text(
                  _nameController.text.trim().isNotEmpty
                      ? _nameController.text.trim()
                      : 'No Name',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const SizedBox(height: 10),
                Text(email, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),

                // TextField to update display name
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Update Display Name',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Refresh UI to show updated name
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: AppColors.vividPink,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Save Name",
                    style: TextStyle(
                      fontFamily: AppFonts.montserrat_regular,
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    ref.read(authRepoProvider).signOut();
                    context.go(AppRoutes.loginScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: AppColors.vividPink,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontFamily: AppFonts.montserrat_regular,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
