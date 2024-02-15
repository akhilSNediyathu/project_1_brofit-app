import 'package:brofit/presentation/common/colo_extension.dart';
import 'package:brofit/presentation/common/common_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: Tcolo.Primarycolor1,),
      title: Text(
        title,
        style: AppTextStyles.welcomeSubtitle,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
      onTap: onTap,
    );
  }
}
