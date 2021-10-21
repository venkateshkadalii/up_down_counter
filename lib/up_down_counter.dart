library up_down_counter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpDownCounter extends StatefulWidget {
  final int? minCountValue;
  final int? maxCountValue;
  final Color borderColor;
  final double borderRadius;
  final double buttonsElevation;
  final Color leftButtonColor;
  final Color rightButtonColor;
  final double buttonsRadius;
  final double buttonMinWidth;
  final double buttonMinHeight;
  final double textFontSize;
  final Function currentValue;

  const UpDownCounter({
    Key? key,
    this.minCountValue,
    this.maxCountValue,
    required this.borderColor,
    required this.borderRadius,
    required this.buttonsElevation,
    required this.leftButtonColor,
    required this.rightButtonColor,
    required this.buttonsRadius,
    required this.buttonMinWidth,
    required this.buttonMinHeight,
    required this.textFontSize,
    required this.currentValue,
  }) : super(key: key);

  @override
  _UpDownCounterState createState() => _UpDownCounterState();
}

class _UpDownCounterState extends State<UpDownCounter> {
  int _currentCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawMaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            constraints: BoxConstraints(
                minWidth: widget.buttonMinWidth,
                minHeight: widget.buttonMinHeight),
            onPressed: () {
              setState(() {
                if (widget.minCountValue != _currentCount) {
                  _currentCount--;
                  widget.currentValue(_currentCount);
                }
              });
            },
            elevation: widget.buttonsElevation,
            fillColor: widget.leftButtonColor,
            child: const Icon(
              Icons.remove,
              color: Colors.black,
              size: 24.0,
            ),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.buttonsRadius))),
          ),
          Text(
            '$_currentCount',
            style: TextStyle(
                fontSize: widget.textFontSize, fontWeight: FontWeight.bold),
          ),
          RawMaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            constraints: BoxConstraints(
                minWidth: widget.buttonMinWidth,
                minHeight: widget.buttonMinHeight),
            onPressed: () {
              setState(() {
                if (widget.maxCountValue != _currentCount) {
                  _currentCount++;
                  widget.currentValue(_currentCount);
                }
              });
            },
            elevation: widget.buttonsElevation,
            fillColor: widget.rightButtonColor,
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 24.0,
            ),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.buttonsRadius))),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createIncrementDicrementButton(Icons.remove, () => _dicrement()),
          Text(_currentCount.toString()),
          _createIncrementDicrementButton(Icons.add, () => _increment()),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
      //_counterCallback(_currentCount);
      //_increaseCallback();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 0) {
        _currentCount--;
        //_counterCallback(_currentCount);
        //_decreaseCallback();
      }
    });
  }

  Widget _createIncrementDicrementButton(IconData icon, Function onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 32.0, minHeight: 32.0),
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.blueAccent,
      child: Icon(
        icon,
        color: Colors.black,
        size: 12.0,
      ),
      shape: const BeveledRectangleBorder(),
    );
  }
}
