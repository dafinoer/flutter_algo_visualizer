import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../presentation/sorting/sorting_form.dart';
import '../../../presentation/sorting/sorting_store.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  void onResetButtonAction(BuildContext context) {
    final totalItem = context.read<SortingForm>().totalItem;
    if (totalItem != null) {
      context.read<SortingStore>().onResetStore(totalItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TextButton(
          onPressed: context.read<SortingForm>().isDisableActionForm
              ? null
              : () => onResetButtonAction(context),
          child: const Text('Reset'),
        );
      },
    );
  }
}
