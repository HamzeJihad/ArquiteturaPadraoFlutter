import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/shared/helpers/extensions/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/components/components.dart';
import '../../../providers/advertisement_job_provider.dart';

export './error_widget.dart';
class ErrorWidget extends ConsumerWidget {
  const ErrorWidget(this.error, {super.key});
  final dynamic error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText('Erro ao carregar as vagas', fontSize: 20, color: Colors.red),
            CustomText('$error', fontSize: 16, color: Colors.red),
            15.height,

            FilledButton(
              onPressed: () {
                ref.read(advertisementJobProviderProvider.notifier).getAdvertisementJobs();
              },
              child: CustomText('Tentar novamente', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
