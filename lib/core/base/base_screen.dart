import 'package:flutter/material.dart';
import 'package:template_project/core/base/base_view_model.dart';
import 'package:provider/provider.dart';
import 'package:template_project/core/widgets/error_display.dart';
import 'package:template_project/core/widgets/loading_indicator.dart';

abstract class BaseScreen<T extends BaseViewModel> extends StatelessWidget {
  // Thêm key parameter vào constructor
  const BaseScreen({super.key});

  // Method này sẽ được override bởi các màn hình con
  Widget buildContent(BuildContext context, T viewModel);

  // Optional method để handle retry logic
  Future<void> onRetry(BuildContext context, T viewModel) async {}

  @override
  Widget build(BuildContext context) {
    // Sử dụng Consumer từ package provider
    return Consumer<T>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const LoadingIndicator();
        }
        if (viewModel.error != null) {
          return ErrorDisplay(
            error: viewModel.error!,
            onRetry:
                viewModel.canRetry ? () => onRetry(context, viewModel) : null,
          );
        }
        return buildContent(context, viewModel);
      },
    );
  }
}
