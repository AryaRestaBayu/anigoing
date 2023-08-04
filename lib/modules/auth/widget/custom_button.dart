part of auth;

class CustomButton {
  static ElevatedButton signInWithGoogle(Future onTap) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;
    return ElevatedButton(
      onPressed: () {
        onTap;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: AppColor.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: Size(sizeWidth * .80, sizeHeight * .08),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/google.png',
            width: sizeWidth * 0.15,
            height: sizeHeight * 0.05,
          ),
          Text(
            AppTranslation.google.tr,
            style:
                TextStyle(color: AppColor.accent, fontSize: sizeWidth * 0.03),
          ),
          SizedBox(
            width: sizeWidth * 0.08,
          )
        ],
      ),
    );
  }

  static ElevatedButton signInwithEmail({
    required void ontap,
    required String text,
  }) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;
    return ElevatedButton(
      onPressed: () {
        ontap;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: Size(sizeWidth * .80, sizeHeight * .08),
      ),
      child: Text(
        text.tr,
        style: TextStyle(color: Colors.black, fontSize: sizeWidth * .04),
      ),
    );
  }
}
