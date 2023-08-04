part of setting;

class SettingPage extends GetView<SettingPageController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;

    return GetBuilder<TranslationsController>(builder: (translation) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.only(
                top: sizeHeight * 0.02,
                left: sizeWidth * 0.05,
                right: sizeWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeHeight * 0.05,
                  child: Text(
                    AppTranslation.setting.tr,
                    style: TextStyle(color: AppColor.primary, fontSize: 22),
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    CustomListTile(
                      ontap: () {
                        translation.changeLocale();
                      },
                      title: 'language'.tr,
                      subtitle: AppTranslation().currentLocale ==
                              AppTranslation().enLocale
                          ? 'English'
                          : 'Indonesia',
                    ),
                    CustomListTile(
                      ontap: () {},
                      title: 'notification'.tr,
                      subtitle: 'notifConfig'.tr,
                    ),
                    CustomListTile(
                      ontap: () {
                        controller.authController.signOutGoogle();
                      },
                      title: 'logout'.tr,
                      subtitle: '',
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
