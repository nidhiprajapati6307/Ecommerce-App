import 'package:flutter/material.dart';

class SimpleSwitch extends StatelessWidget {
  const SimpleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = const Color(0xFF22C55E),
    this.inactiveColor = const Color(0xFFE5E7EB),
    this.toggleColor = Colors.white,
    this.width = 60,
    this.height = 32,
    this.showOnOff = false,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  final Color activeColor;
  final Color inactiveColor;
  final Color toggleColor;

  final double width;
  final double height;

  final bool showOnOff;

  @override
  Widget build(BuildContext context) {
    final toggleSize = height - 6; // small padding inside

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: value ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(height),
        ),
        child: Stack(
          children: [
            if (showOnOff)
              Align(
                alignment: value ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    value ? "On" : "Off",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: toggleSize,
                height: toggleSize,
                decoration: BoxDecoration(
                  color: toggleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
