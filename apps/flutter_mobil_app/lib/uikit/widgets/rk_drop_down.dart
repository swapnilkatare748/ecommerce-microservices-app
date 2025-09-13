import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:flutter/material.dart';

class RKDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final Widget? suffixIcon;

  const RKDropdown({
    super.key,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.borderColor = AppColors.dropDownBorderColor,
    this.borderRadius = 6,
    this.borderWidth = 1.0,
    this.suffixIcon,
  });

  @override
  RKDropdownState createState() => RKDropdownState();
}

class RKDropdownState extends State<RKDropdown> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  bool _isDropdownVisible = false;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.selectedValue ?? '';

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showOverlay();
      } else {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _showOverlay() {
    _removeOverlay(); // Ensure no duplicate overlays
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownVisible = true;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownVisible = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              // 1. Fullscreen transparent background to detect outside taps
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    _removeOverlay(); // dismiss dropdown
                  },
                  behavior: HitTestBehavior.translucent, // important!
                  child: Container(),
                ),
              ),
              // 2. Dropdown content
              Positioned(
                left: offset.dx,
                width: size.width,
                top: offset.dy + size.height - 4,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(widget.borderRadius),
                        bottomRight: Radius.circular(widget.borderRadius),
                      ),
                      border: Border.all(
                        color: widget.borderColor,
                        width: widget.borderWidth,
                      ),
                      color: AppColors.background,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                    child: Scrollbar(
                      thickness: 4,
                      interactive: true,
                      trackVisibility: true,
                      thumbVisibility: true,
                      radius: Radius.circular(12),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          final item = widget.items[index];
                          return ListTile(
                            title: Text(
                              item,
                              style:
                                  widget.textStyle ??
                                  RKTextStyle.paragraph2.style,
                            ),
                            onTap: () {
                              _controller.text = item;
                              widget.onChanged?.call(item);
                              _removeOverlay();
                            },
                          );
                        },
                        separatorBuilder:
                            (context, index) => Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                              height: 1,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
      ),
      padding: EdgeInsets.only(top: 4),
      child: TextField(
        controller: _controller,
        readOnly: true, //prevent keyboard and editing
        onTap: _toggleDropdown,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          hintText: widget.hintText ?? "Select an option",
          hintStyle:
              widget.hintStyle ??
              RKTextStyle.paragraph2.copyWith(color: AppColors.textThree).style,
          border: InputBorder.none,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppIcon(
              '$kAssetsIcons/ic_down_arrow_text_field.svg',
              size: 8,
            ),
          ),
        ),
      ),
    );
  }

  void _toggleDropdown() {
    setState(() {
      if (_isDropdownVisible) {
        _removeOverlay();
      } else {
        _showOverlay();
        _focusNode.requestFocus();
      }
    });
  }
}
