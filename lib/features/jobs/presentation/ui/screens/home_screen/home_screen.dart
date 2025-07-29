import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/jobs/presentation/providers/advertisement_job_provider.dart';
import 'package:flutter_application_1/features/shared/components/components.dart';
import 'package:flutter_application_1/features/shared/helpers/extensions/date_time_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(advertisementJobProviderProvider.notifier).getAdvertisementJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final advertisementJobProviderProviderAsync = ref.watch(advertisementJobProviderProvider);
    return Scaffold(
      appBar: AppBar(title: CustomText('Vagas', fontSize: 25)),
      body: advertisementJobProviderProviderAsync.when(
        data: (data) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final job = data.advertisementJobs![index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey[900],
                          child: CustomText(job.jobTitle.substring(0, 1).toUpperCase()),
                        ),
                        title: CustomText(job.jobTitle, fontSize: 20, fontWeight: FontWeight.bold),
                        subtitle: CustomText(job.companyName),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: CustomTextWithBackground(job.level)),
                          Flexible(child: CustomTextWithBackground(job.location)),
                          Flexible(
                            child: CustomTextWithBackground(
                              '${job.currency} ${(job.salaryRange / 100).toStringAsFixed(2).replaceAll('.', ',')}/m',
                            ),
                          ),
                        ],
                      ),

                      ListTile(
                        leading: Icon(Icons.access_time, color: Colors.white),

                        title: CustomText(DateTime.now().format()),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: data.advertisementJobs?.length ?? 0,
          );
        },
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
