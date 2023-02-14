import 'package:flutter/material.dart';
import 'package:yx_app/components/button/button_size.dart';
import 'package:yx_app/gen/colors.gen.dart';

/// ui 设计主要按钮
class PrimaryButton extends StatefulWidget {
  ///
  const PrimaryButton({
    required this.child,
    Key? key,
    this.disabled = false,
    this.block = false,
    this.onPressed,
    this.size = ButtonSize.middle,
  }) : super(key: key);

  ///
  final bool disabled;

  ///
  final bool block;

  ///
  final Widget child;

  ///
  final ButtonSize size;

  ///
  final VoidCallback? onPressed;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  double get height {
    switch (widget.size) {
      case ButtonSize.large:
        return 44;
      case ButtonSize.middle:
        return 32;
      case ButtonSize.small:
        return 28;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget current = widget.child;
    current = DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        fontSize: widget.size == ButtonSize.large
            ? 16
            : widget.size == ButtonSize.middle
                ? 14
                : 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[widget.child],
      ),
    );
    current = widget.block
        ? current
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 2),
            child: current,
          );
    current = SizedBox(
        width: widget.block ? double.infinity : null,
        height: height,
        child: current);
    current = DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        gradient: LinearGradient(
          colors: [
            ColorName.colorFD9403,
            ColorName.colorFD5B03,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: current,
    );
    if (_isPressed) {
      current = DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: Colors.black.withOpacity(0.1)),
        position: DecorationPosition.foreground,
        child: current,
      );
    }
    current = widget.disabled
        ? AnimatedOpacity(
            opacity: 0.6,
            duration: const Duration(milliseconds: 250),
            child: current)
        : current;
    return GestureDetector(
      onTap: widget.disabled ? null : widget.onPressed,
      child: current,
      onTapDown: (_) {
        if (!widget.disabled) {
          setState(() {
            _isPressed = true;
          });
        }
      },
      onTapUp: (_) {
        if (!widget.disabled) {
          setState(() {
            _isPressed = false;
          });
        }
      },
      onTapCancel: () {
        if (!widget.disabled) {
          setState(() {
            _isPressed = false;
          });
        }
      },
    );
  }
}
