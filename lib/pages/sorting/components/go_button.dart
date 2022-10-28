import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:algovisualizer/presentation/sorting/sorting_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class GoButton extends StatelessWidget {
  const GoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortingStore = context.read<SortingStore>();

    return SizedBox(
      width: 20.w,
      child: Observer(
        builder: (context) {
          return ElevatedButton(
            onPressed: sortingStore.isRunning
                ? null
                : () {
                    final sortingForm = context.read<SortingForm>();
                    final sortingType = sortingForm.sortingType;
                    if (sortingType != null) {
                      sortingStore.onProcessAlgorithm(sortingType);
                    }
                  },
            child: const Text('Go'),
          );
        },
      ),
    );
  }
}
