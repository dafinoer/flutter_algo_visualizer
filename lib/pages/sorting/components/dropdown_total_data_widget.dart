import 'package:algovisualizer/presentation/sorting/sorting_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DropdownTotalDataWidget extends StatelessWidget {
  const DropdownTotalDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortingForm = Provider.of<SortingForm>(context, listen: false);
    return Observer(
      builder: (context) {
        return DropdownButton(
          value: sortingForm.totalItem,
          hint: const Text('How many data'),
          items: const [
            DropdownMenuItem(value: 10, child: Text('10')),
            DropdownMenuItem(value: 20, child: Text('20')),
            DropdownMenuItem(value: 30, child: Text('30')),
            DropdownMenuItem(value: 40, child: Text('40')),
            DropdownMenuItem(value: 50, child: Text('50')),
          ],
          onChanged: sortingForm.isDisableActionForm
              ? null
              : (int? value) {
                  final itemValue = value;
                  if (itemValue != null) sortingForm.setTotalItem(itemValue);
                },
        );
      },
    );
  }
}
