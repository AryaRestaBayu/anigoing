part of auth;

class CostumTextField extends StatelessWidget {
  const CostumTextField({
    Key? key,
    required this.textController,
    this.obscure,
    this.visible,
    this.ontap,
    required this.hint,
    required this.prefixIcon,
  }) : super(key: key);

  final TextEditingController textController;
  final bool? obscure;
  final bool? visible;
  final VoidCallback? ontap;
  final String hint;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;
    return Container(
      width: sizeWidth * .85,
      height: sizeHeight * .08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColor.primary)),
      padding: EdgeInsets.only(
        left: sizeWidth * .03,
        right: sizeWidth * .03,
      ),
      child: TextField(
          controller: textController,
          cursorColor: AppColor.primary,
          obscureText: obscure ?? false,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(color: AppColor.accent, fontSize: sizeWidth * .04),
            prefixIcon: Icon(
              prefixIcon,
              color: AppColor.accent,
              size: sizeWidth * .07,
            ),
            suffixIcon: visible != null
                ? GestureDetector(
                    onTap: ontap,
                    child: Icon(
                        visible == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColor.accent,
                        size: sizeWidth * .07),
                  )
                : null,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: sizeHeight * 0.025,
            ),
          )),
    );
  }
}
