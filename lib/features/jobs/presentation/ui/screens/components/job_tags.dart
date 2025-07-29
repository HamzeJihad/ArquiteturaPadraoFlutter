import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';

import '../../../../../shared/components/components.dart';

class JobTags extends StatelessWidget {
  const JobTags({super.key, required this.job});

  final AdvertisementJobEntity job;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1F2021),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: CustomText(job.location)),
              Expanded(child: CustomText(job.level)),
              Expanded(child: CustomText(job.contractType)),
              Icon(buildContactWidget(job.contactType), color: Theme.of(context).colorScheme.onPrimary, size: 16,),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: job.tags.map((tag) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomTextWithBackground(tag),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  IconData buildContactWidget(String contactType) {
    switch (contactType) {
      case 'link':
        return Icons.link;
      case 'email':
        return Icons.email;
      case 'phone':
        return Icons.phone;
      default:
        return Icons.phone;
    }
  }
}
