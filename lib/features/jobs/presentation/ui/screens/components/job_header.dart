
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/entities.dart';

import '../../../../../shared/components/components.dart';

class JobHeader extends StatelessWidget {
  const JobHeader({super.key, required this.job});

  final AdvertisementJobEntity job;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xFF1F2021),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey[900],
          child: CustomText(job.jobTitle.characters.first),
        ),
        title: CustomText(job.jobTitle, fontSize: 19),
        subtitle: CustomText(job.companyName),
        trailing: CustomText(
          '${job.currency} ${(job.salaryRange / 100).toStringAsFixed(2).replaceAll('.', ',')}/m',
        ),
      ),
    );
  }
}
