import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/jobs/domain/entities/advertisement_job_entity.dart';
import 'package:flutter_application_1/features/jobs/presentation/ui/screens/components/components.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';
import 'package:flutter_application_1/features/shared/helpers/extensions/date_time_extension.dart';


class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key, required this.job});

  final AdvertisementJobEntity job;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText('Detalhes'),
        centerTitle: true,
        backgroundColor: Color(0xFF1F2021),
        actions: [
          const Icon(Icons.access_time),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomText(
              DateTime.now().format(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            JobHeader(job: job),
            const SizedBox(height: 20),
            JobTags(job: job),
            const SizedBox(height: 20),
            CustomTextWithBackground(job.description),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send, color: Colors.white,),
              label: const CustomText('Aplicar', color: Colors.white,),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
