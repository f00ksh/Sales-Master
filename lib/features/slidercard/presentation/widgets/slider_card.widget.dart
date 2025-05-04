import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:sales_master/shared/widgets/slider.widget.dart';

class SliderCardWidget extends StatelessWidget {
  const SliderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listCard = [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: UnDraw(
          color: Theme.of(context).colorScheme.primary,
          illustration: UnDrawIllustration.trip,
          placeholder: const SizedBox.shrink(),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: UnDraw(
          color: Theme.of(context).colorScheme.primary,
          illustration: UnDrawIllustration.my_notifications,
          placeholder: const SizedBox.shrink(),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: UnDraw(
          color: Theme.of(context).colorScheme.primary,
          illustration: UnDrawIllustration.control_panel,
          placeholder: const SizedBox.shrink(),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: UnDraw(
          color: Theme.of(context).colorScheme.primary,
          illustration: UnDrawIllustration.delivery_address,
          placeholder: const SizedBox.shrink(),
        ),
      ),
    ];
    return SliderWidget(children: listCard);
  }
}
