import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AlgoritmButton extends StatelessWidget {
  const AlgoritmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortingForm = context.read<SortingForm>();

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(width: 0.5, color: Colors.grey)),
      child: Observer(
        builder: (context) {
          return DropdownButton(
            borderRadius: BorderRadius.circular(12.0),
            value: sortingForm.sortingType,
            hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Algorithm')),
            underline: const SizedBox.shrink(),
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: SortingType.bubble,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Bubble Sort'),
                ),
              ),
              DropdownMenuItem(
                value: SortingType.selection,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Selection Sort'),
                ),
              ),
              DropdownMenuItem(
                value: SortingType.insert,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Insertion Sort'),
                ),
              ),
              DropdownMenuItem(
                value: SortingType.merge,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Merge Sort'),
                ),
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
      ),
    );
  }
}
