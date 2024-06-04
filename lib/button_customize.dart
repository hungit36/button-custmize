
import 'package:flutter/material.dart';
import 'dart:math' as math;

enum IconPosition{ left, right, center}

class ButtonCustomizeWidget extends StatefulWidget {
  const ButtonCustomizeWidget({
    super.key,
    required this.onTap,
    this.title = '',
    this.icon,
    this.iconPosition = IconPosition.left,
    this.titleWidget,
    this.isLoading = false,
    this.titleTextStyle = const TextStyle(),
    this.backgroundColor,
    this.width = 90,
    this.height = 44,
    this.loadingColor,
    this.iconSpacing = 8,
    this.boxShadow,
    this.borderRadius,
    this.backgroundImage,
    this.border,
    this.loadingWidget,
  });

  final String title;
  final Color? backgroundColor;
  final Color? loadingColor;
  final TextStyle titleTextStyle;
  final double iconSpacing;
  final double width;
  final double height;
  final Widget? icon;
  final Widget? titleWidget;
  final IconPosition iconPosition;
  final bool isLoading;
  final void Function() onTap;
  final List<BoxShadow>? boxShadow;
  final BorderRadius? borderRadius;
  final DecorationImage? backgroundImage;
  final Border? border;
  final Widget? loadingWidget;

  @override
  State<ButtonCustomizeWidget> createState() => _WidgetState();
}

class _WidgetState extends State<ButtonCustomizeWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title.isNotEmpty) {
      if (widget.icon != null) {
        return _buildWidgetHasTitleAndIcon();
      } else {
        return _buildWidgetHasOnlyTitle();
      }
    } else if (widget.titleWidget != null) {
      if (widget.icon != null) {
        return _buildWidgetHasCustomAndIcon();
      } else {
        return _buildWidgetHasOnlyCustom();
      }
    } else if (widget.icon != null) {
        return _buildWidgetHasOnlyIcon();
      } else {
        return const SizedBox();
      }
  }

  Widget _buildWidgetHasOnlyTitle() {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
        image: widget.backgroundImage,
        border: widget.border,
      ),
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(widget.backgroundColor)),
            onPressed: widget.onTap, child: Center(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Text(widget.title, style: widget.titleTextStyle,),
                    if (widget.isLoading) ... [
                      const SizedBox(width: 16,),
                      _buildLoading(),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

  Widget _buildWidgetHasTitleAndIcon() {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
        image: widget.backgroundImage,
        border: widget.border,
      ),
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(widget.backgroundColor)),
            onPressed: widget.onTap, child: Center(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    if (widget.iconPosition == IconPosition.left) ...[
                      widget.icon!,
                      SizedBox(width: widget.iconSpacing,),
                    ],
                    Text(widget.title, style: widget.titleTextStyle,),
                    if (widget.iconPosition == IconPosition.right) ...[
                      SizedBox(width: widget.iconSpacing,),
                      widget.icon!,
                    ],
                    if (widget.isLoading) ... [
                      const SizedBox(width: 16,),
                      _buildLoading(),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

  Widget _buildWidgetHasOnlyCustom() {
    return widget.loadingWidget ?? Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
        image: widget.backgroundImage,
        border: widget.border,
      ),
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(widget.backgroundColor)),
            onPressed: widget.onTap, child: Center(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    widget.titleWidget!,
                    if (widget.isLoading) ... [
                      const SizedBox(width: 16,),
                      _buildLoading(),
                    ],   
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

  Widget _buildWidgetHasCustomAndIcon() {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
        image: widget.backgroundImage,
        border: widget.border,
      ),
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(widget.backgroundColor)),
            onPressed: widget.onTap, child: Center(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    if (widget.iconPosition == IconPosition.left) ...[
                      widget.icon!,
                      SizedBox(width: widget.iconSpacing,),
                    ],
                    widget.titleWidget!,
                    if (widget.iconPosition == IconPosition.right) ...[
                      SizedBox(width: widget.iconSpacing,),
                      widget.icon!,
                    ],
                    if (widget.isLoading) ... [
                      const SizedBox(width: 16,),
                      _buildLoading(),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

  Widget _buildWidgetHasOnlyIcon() {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
        image: widget.backgroundImage,
        border: widget.border,
      ),
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(widget.backgroundColor),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            ),
            onPressed: widget.onTap, child: Center(
                child: Center(
                  child: widget.width <= widget.height * 2 || widget.iconPosition == IconPosition.center ? Stack(
                    children: [
                      Center(child: widget.icon!),
                      if (widget.isLoading) ... [
                        Center(child: _buildLoading()),
                      ],
                    ],
                  ) : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    widget.icon!,
                    if (widget.isLoading) ... [
                      const SizedBox(width: 16,),
                      _buildLoading(),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

  Widget _buildLoading() {
    return SizedBox(
      width: widget.height / 3,
      height: widget.height / 3,
      child: widget.loadingWidget != null ?
        AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: widget.loadingWidget,
        ) : CircularProgressIndicator(color: widget.loadingColor,)
    );
  }
}
