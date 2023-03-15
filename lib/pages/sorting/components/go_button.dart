import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../presentation/sorting/sorting_form.dart';
import '../../../presentation/sorting/sorting_store.dart';

class GoButton extends StatelessWidget {
  const GoButton({Key? key}) : super(key: key);

  void onTapActionButton(BuildContext context) {
    final sortingType = context.read<SortingForm>().sortingType;
    final isReset = context.read<SortingStore>().isDoneSorting;
    final totalItem = context.read<SortingForm>().totalItem;

    if (sortingType != null) {
      if (isReset && totalItem != null) {
        context.read<SortingStore>().onResetStore(totalItem);
        context.read<SortingStore>().executeAlgorithm(sortingType);
      } else {
        context.read<SortingStore>().executeAlgorithm(sortingType);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      child: Observer(
        builder: (context) => ElevatedButton(
          onPressed: context.read<SortingForm>().isDisableActionForm
              ? null
              : () => onTapActionButton(context),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Go'),
          ),
        ),
      ),
    );
  }
}
