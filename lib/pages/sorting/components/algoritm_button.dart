import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AlgoritmButton extends StatelessWidget {
  const AlgoritmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortingForm = context.read<SortingForm>();

    return Observer(
      builder: (context) {
        return DropdownButton(
          value: sortingForm.sortingType,
          hint: const Text('Algorithm'),
          items: const [
            DropdownMenuItem(
              value: SortingType.bubble,
              child: Text('Bubble Sort'),
            ),
            DropdownMenuItem(
              value: SortingType.selection,
              child: Text('Selection Sort'),
            ),
            DropdownMenuItem(
              value: SortingType.insert,
              child: Text('Insertion Sort'),
            ),
          ],
          onChanged: sortingForm.isDisableActionForm
              ? null
              : (SortingType? value) {
                  final typeValue = value;
                  if (typeValue != null) sortingForm.onSetSorting(typeValue);
                },
        );
      },
    );
  }
}
