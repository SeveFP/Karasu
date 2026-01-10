import 'package:flutter/material.dart';

/// Responsive container that:
/// - Centers content with a max width on large screens (better UX on huge resolutions)
/// - Enables horizontal scrolling when viewport is below minimum width (small screens)
class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  /// Maximum width for the content area (default: 1200px)
  final double maxWidth;

  /// Minimum width before horizontal scrolling is enabled (default: 320px)
  final double minWidth;

  /// Horizontal padding around the content
  final double horizontalPadding;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth = 1200,
    this.minWidth = 320,
    this.horizontalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // If screen is smaller than minWidth, enable horizontal scrolling
    if (screenWidth < minWidth) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(width: minWidth, child: _buildContent()),
      );
    }

    // Otherwise, center the content with max width constraint
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: child,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: child,
    );
  }
}

/// A scaffold body wrapper that applies responsive constraints.
/// Use this to wrap view bodies that need responsive behavior.
class ResponsiveBody extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final double minWidth;
  final double horizontalPadding;

  const ResponsiveBody({
    super.key,
    required this.child,
    this.maxWidth = 1200,
    this.minWidth = 320,
    this.horizontalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      maxWidth: maxWidth,
      minWidth: minWidth,
      horizontalPadding: horizontalPadding,
      child: child,
    );
  }
}
