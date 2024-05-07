
import 'package:get/get.dart';

mixin PreferredSizeWidget on Widget {
  Size get preferredSize => Size.fromHeight(AppDimensions.screenHeight * 0.14);
}

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String labelText;
  final int cartCount;
  final int cartLength;
  final bool isBackPress;
  final Color backgroundColor;

  final bool showActiveCart;
  final void Function()? okayTap;
  CustomAppBar({
    Key? key,
    this.labelText = "",
    this.cartCount = 0,
    this.cartLength = 0,
    this.isBackPress = false,
    this.showActiveCart = false,
    this.backgroundColor = Colors.white,
    this.okayTap,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            widget.isBackPress == true
                                ? InkWell(
                                    onTap: () async {},
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: AppColors.black,
                                      size: 24.0,
                                    ),
                                  )
                                : height0SizedBox,
                            widget.isBackPress == true
                                ? width10SizedBox
                                : height0SizedBox,
                          ],
                        ),
                        height4SizedBox,
                        Text(
                          widget.labelText,
                          style: const TextStyle(
                              fontSize: 22,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: true,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              
                          
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ],
          )),
    );
  }
}
