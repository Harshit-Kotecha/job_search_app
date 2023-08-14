import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.title,
    required this.imgPath,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(subtitle),
        leading: SvgPicture.asset(
          imgPath,
          width: 32,
        ),
        horizontalTitleGap: 16,
      ),
    );
  }
}
