import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:algovisualizer/presentation/sorting/sorting_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortingStore = context.read<SortingStore>();

    return Observer(
      builder: (context) {
        return TextButton(
          onPressed: sortingStore.isRunning
              ? null
              : () {
                  final form = context.read<SortingForm>();
                  sortingStore.setDataItems(form.totalItem);
                },
          child: const Text('Reset'),
        );
      },
    );
  }
}
