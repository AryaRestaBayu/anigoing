part of auth;

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    return Row(
      children: [
        SizedBox(
          width: sizeWidth * 0.35,
          child: const Divider(
            color: AppColor.primary,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: sizeWidth * 0.05, right: sizeWidth * 0.05),
          child: Text(
            'or',
            style:
                TextStyle(color: AppColor.accent, fontSize: sizeWidth * 0.045),
          ),
        ),
        SizedBox(
          width: sizeWidth * 0.35,
          child: const Divider(
            color: AppColor.primary,
          ),
        ),
      ],
    );
  }
}
