import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DropdownSpeedButton extends StatelessWidget {
  const DropdownSpeedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortingForm = context.read<SortingForm>();
    return Observer(
      warnWhenNoObservables: true,
      builder: (context) {
        return DropdownButton(
          value: sortingForm.thresHoleTime,
          hint: const Text('Speed'),
          items: const [
            DropdownMenuItem(value: 700, child: Text('Slow')),
            DropdownMenuItem(value: 400, child: Text('Medium')),
            DropdownMenuItem(value: 200, child: Text('Fast'))
          ],
          onChanged: sortingForm.isDisableActionForm
              ? null
              : (int? value) {
                  final itemValue = value;
                  if (itemValue != null) {
                    sortingForm.setThresHoleTime(itemValue);
                  }
                },
        );
      },
    );
  }
}
