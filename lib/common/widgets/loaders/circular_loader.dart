import 'package:flutter/material.dart';

/// A branded circular loading indicator that matches the app's design system.
///
/// Usage:
///   TCircularLoader()                          // default size & color
///   TCircularLoader(size: 20, color: Colors.white)  // customized
///   TCircularLoader.overlay()                  // full-screen dim overlay
class TCircularLoader extends StatelessWidget {
  const TCircularLoader({
    super.key,
    this.size = 36.0,
    this.strokeWidth = 3.0,
    this.color,
  });

  /// Diameter of the spinner in logical pixels.
  final double size;

  /// Thickness of the spinning arc.
  final double strokeWidth;

  /// Spinner color — defaults to the app's primary blue.
  final Color? color;

  // ── Convenience constructor: full-screen semi-transparent overlay ──────────
  static Widget overlay({
    String? message,
    Color barrierColor = const Color(0x80000000),
  }) {
    return ColoredBox(
      color: barrierColor,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 24,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TCircularLoader(size: 44, strokeWidth: 3.5),
              if (message != null) ...[
                const SizedBox(height: 16),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4F4F4F),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColor =
        color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
        strokeCap: StrokeCap.round,
      ),
    );
  }
}