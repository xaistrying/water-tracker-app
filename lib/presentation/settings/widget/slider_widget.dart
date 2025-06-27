// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    this.min = 0,
    required this.max,
    this.unit = '',
    this.divisions,
    this.onChanged,
  });

  final double min;
  final double max;
  final String unit;
  final int? divisions;
  final Function(double)? onChanged;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.min;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppDimens.padding4,
      children: [
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 8.0,
            inactiveTickMarkColor: Colors.transparent,
            activeTickMarkColor: Colors.transparent,
            thumbColor: AppColor.getBlueCyanColor(context),
            inactiveTrackColor: AppColor.getSliderTrackColor(context),
            activeTrackColor: AppColor.getBlueCyanColor(context),
            overlayColor: AppColor.getBlueCyanColor(
              context,
            ).withValues(alpha: 0.2),
          ),
          child: Slider(
            value: _currentSliderValue,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            padding: EdgeInsets.only(
              top: AppDimens.padding8,
              left: AppDimens.padding4,
              right: AppDimens.padding4,
            ),
            onChanged:
                widget.onChanged ??
                (value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.min.toStringAsFixed(0)} ${widget.unit}',
              style: TextStyle(color: AppColor.getGreyColorForText(context)),
            ),
            Text(
              '${_currentSliderValue.toStringAsFixed(0)} ${widget.unit}',
              style: TextStyle(color: AppColor.getGreyColorForText(context)),
            ),
            Text(
              '${widget.max.toStringAsFixed(0)} ${widget.unit}',
              style: TextStyle(color: AppColor.getGreyColorForText(context)),
            ),
          ],
        ),
      ],
    );
  }
}
