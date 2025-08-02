import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:flutter_application_1/features/jobs/presentation/providers/advertisement_job_provider.dart';
import 'package:flutter_application_1/features/jobs/presentation/ui/screens/components/components.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';
import 'package:flutter_application_1/features/shared/helpers/extensions/date_time_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobDetailsScreen extends ConsumerStatefulWidget {
  const JobDetailsScreen({super.key, required this.refJob});

  final String refJob;

  @override
  ConsumerState<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends ConsumerState<JobDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(advertisementJobProviderProvider.notifier).getDetailsAdvertisementJob(widget.refJob);
    });
  }

  @override
  Widget build(BuildContext context) {
    final advertisementJobProviderProviderAsync = ref.watch(advertisementJobProviderProvider);

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const CustomText('Detalhes', fontSize: 18),
        centerTitle: true,
        backgroundColor: Color(0xFF1F2021),
        actions: [
          const Icon(Icons.access_time),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomText(DateTime.now().format()),
          ),
        ],
      ),
      body: advertisementJobProviderProviderAsync.when(
        data: (data) {
          final jobDetails = data.detailsAdvertisementJobs;
          if (jobDetails == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                JobHeader(job: jobDetails),
                const SizedBox(height: 20),
                JobTags(job: jobDetails),
                const SizedBox(height: 20),
                CustomTextWithBackground(jobDetails.description),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send, color: Colors.white),
                  label: const CustomText('Aplicar', color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
