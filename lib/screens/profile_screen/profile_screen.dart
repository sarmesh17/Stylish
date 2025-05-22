import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/models/user_info_model/user_info_model.dart';
import 'package:stylish/providers/profile_setup_provider/profile_setup_provider.dart';
import 'package:stylish/util/app_colors.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});
  // XFile? _profileImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoAsync = ref.watch(fetchUserDetailProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: AppColors.vividPink,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Refresh the provider
              ref.invalidate(profileSetupRepoProvider);
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: userInfoAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  const Text('Error loading profile'),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(profileSetupRepoProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
        data: (userInfo) {
          if (userInfo == null) {
            return Center(child: Text("No user data found."));
          }
          return UserProfileView(userInfo: userInfo);
        },
      ),
    );
  }
}

class UserProfileView extends StatefulWidget {
  final UserInfoModel userInfo; // ✅ Proper type declaration

  const UserProfileView({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile Header Section
          _buildProfileHeader(context),
          const SizedBox(height: 24),

          // Personal Information
          _buildSectionCard(
            context,
            title: 'Personal Information',
            icon: Icons.person,
            children: [
              _buildInfoRow(
                context,
                label: 'Email',
                value: widget.userInfo.email ?? 'N/A', // ✅ Handle null values
                icon: Icons.email,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                label: 'PIN Code',
                value: widget.userInfo.pinCode ?? 'N/A',
                icon: Icons.location_on,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Address Information
          _buildSectionCard(
            context,
            title: 'Address Information',
            icon: Icons.home,
            children: [
              _buildInfoRow(
                context,
                label: 'Address',
                value: widget.userInfo.address ?? 'N/A',
                icon: Icons.location_city,
                isMultiline: true,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                label: 'City',
                value: widget.userInfo.city ?? 'N/A',
                icon: Icons.location_city,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                label: 'State',
                value: widget.userInfo.state ?? 'N/A',
                icon: Icons.map,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                label: 'Country',
                value: widget.userInfo.country ?? 'N/A',
                icon: Icons.public,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Banking Information
          _buildSectionCard(
            context,
            title: 'Banking Information',
            icon: Icons.account_balance,
            children: [
              _buildInfoRow(
                context,
                label: 'Account Holder Name',
                value: widget.userInfo.accountHolderName ?? 'N/A',
                icon: Icons.person,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                label: 'Bank Account Number',
                value:
                    widget.userInfo.bankAccountNumber != null
                        ? _maskBankAccount(widget.userInfo.bankAccountNumber!)
                        : 'N/A',
                icon: Icons.account_balance_wallet,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                label: 'IFSC Code',
                value: widget.userInfo.ifscCode ?? 'N/A',
                icon: Icons.code,
              ),
            ],
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.vividPink, AppColors.vividPink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.vividPink.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipOval(
            child:
                widget.userInfo.profileImageBase64 != null &&
                        widget.userInfo.profileImageBase64!.isNotEmpty
                    ? Image.memory(
                      base64Decode(widget.userInfo.profileImageBase64!),
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    )
                    : const Icon(Icons.person, size: 80, color: Colors.white),
          ),

          const SizedBox(height: 16),
          Text(
            widget.userInfo.accountHolderName ?? 'User Name',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            widget.userInfo.email ?? 'No email provided',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          if (widget.userInfo.city != null && widget.userInfo.state != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.userInfo.city}, ${widget.userInfo.state}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: AppColors.vividPink, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    bool isMultiline = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment:
            isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _maskBankAccount(String accountNumber) {
    if (accountNumber.length <= 4) return accountNumber;
    final visiblePart = accountNumber.substring(accountNumber.length - 4);
    final maskedPart = '*' * (accountNumber.length - 4);
    return maskedPart + visiblePart;
  }
}
