part of home;

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.style,
    required this.ongoing,
  });

  final bool ongoing;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ongoing == true
                ? AppTranslation.ongoing.tr
                : AppTranslation.upcoming.tr,
            style: style,
          ),
          GestureDetector(
            onTap: () {
              ongoing == true
                  ? Get.toNamed(AppRoutes.seeAllPage, arguments: {
                      'ongoing': true,
                    })
                  : Get.toNamed(AppRoutes.seeAllPage, arguments: {
                      'ongoing': false,
                    });
            },
            child: Text(
              AppTranslation.seeAll.tr,
              style: const TextStyle(color: AppColor.primary),
            ),
          ),
        ],
      ),
    );
  }
}
