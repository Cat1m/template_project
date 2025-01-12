// lib/core/widgets/error_display.dart
import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String error;
  final VoidCallback? onRetry;
  final String retryText;

  const ErrorDisplay({
    super.key,
    required this.error,
    this.onRetry,
    this.retryText = 'Thử lại',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              error,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 16),
              FilledButton.icon(
                onPressed: onRetry,
                label: Text(retryText),
                icon: const Icon(Icons.refresh),
              )
            ],
          ],
        ),
      ),
    );
  }
}
