
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAddEdit extends StatefulWidget {
  const TextAddEdit({
    super.key,
    this.designStudioController,
    this.mapValue,
    this.index,
    this.isEdit,
  });

  final int? index;
  final Map<String, dynamic>? mapValue;
  final bool? isEdit;
  final DesignStudioController? designStudioController;

  @override
  State<TextAddEdit> createState() => _TextAddEditState();
}

class _TextAddEditState extends State<TextAddEdit> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController textFieldController = TextEditingController();
  Color pickerColor = const Color(0xFF443A49);
  Color currentColor = const Color(0xFF443A49);
  final List<String> fonts = <String>['Roboto', 'Montserrat', 'Open Sans'];
  late DesignStudioController designStudioController = DesignStudioController();

  @override
  void initState() {
    designStudioController = widget.designStudioController!;
    if (widget.isEdit!) {
      textFieldController.text = widget.mapValue!['name'] as String;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double paddingBottom = mediaQueryData.padding.bottom;
    final double insetBottom = mediaQueryData.viewInsets.bottom;
    return SingleChildScrollView(
      child: designStudioController.componentsList.isEmpty
          ? width0SizedBox
          : Container(
              padding: EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
                bottom: paddingBottom > 0 ? paddingBottom + insetBottom : 16 + insetBottom,
              ),
              child: Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Text(
                        widget.isEdit! ? 'edit_text'.tr : 'add_text'.tr,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    TextFormField(
                      controller: textFieldController,
                      maxLength: 9,
                      style: GoogleFonts.getFont(
                        designStudioController.selectedFont,
                        color: designStudioController.componentsList[widget.index!]['color'] as Color,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: 'enter_message'.tr,
                      ),
                      onChanged: (String value) {
                        designStudioController.componentsList[widget.index!]['name'] = value;
                      },
                      validator: (String? value) {
                        return value == null || value.isEmpty ? 'please_add_input'.tr : null;
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('select_font'.tr),
                        ),
                        const SizedBox(width: 8),
                        Expanded(flex: 2, child: Text('size_adjust'.tr)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButton<String>(
                            value: designStudioController.selectedFont,
                            onChanged: (String? newValue) {
                              setState(() {
                                designStudioController.selectedFont = newValue!;
                                designStudioController.componentsList[widget.index!]['font'] =
                                    designStudioController.selectedFont;
                              });
                            },
                            items: fonts.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontFamily: value), // Apply the selected font
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Slider(
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            value: designStudioController.componentsList[widget.index!]['size'] as double,
                            min: 16.0,
                            max: designStudioController.maxTextSize,
                            onChangeEnd: (double value) {
                              setState(() => designStudioController.componentsList[widget.index!]['size'] = value);
                            },
                            onChanged: (double value) {
                              setState(() {
                                designStudioController.componentsList[widget.index!]['size'] = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('rotate_text'.tr),
                    Slider(
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      value: designStudioController.componentsList[widget.index!]['rotation'] as double,
                      max: 359.0,
                      onChangeEnd: (double value) {
                        setState(() => designStudioController.componentsList[widget.index!]['rotation'] = value);
                      },
                      onChanged: (double value) {
                        setState(() {
                          designStudioController.componentsList[widget.index!]['rotation'] = value;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    Text('pick_color'.tr),
                    ColorPicker(
                      pickerColor: pickerColor,
                      onColorChanged: changeColor,
                      pickerAreaHeightPercent: 0.3,
                    ),
                    const SizedBox(height: 8),
                    if (widget.isEdit!)
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                designStudioController.componentsList.removeAt(widget.index!);
                                designStudioController.offsets.removeAt(widget.index!);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                              ),
                              child: Text('remove_'.tr),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black,
                              ),
                              child: Text('update_'.tr),
                            ),
                          ),
                        ],
                      )
                    else
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              Navigator.pop(context, true);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                          child: Text('save_text_'.tr),
                        ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }

  void changeColor(Color color) {
    setState(() {
      setState(() {
        pickerColor = color;
        designStudioController.componentsList[widget.index!]['color'] = color;
      });
    });
  }
}
