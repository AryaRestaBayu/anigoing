part of setting;

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.ontap,
  });

  final String title;
  final String subtitle;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: subtitle == ''
                ? null
                : Text(
                    subtitle,
                    style: TextStyle(color: AppColor.accent),
                  ),
          ),
        ),
        const Divider(
          color: AppColor.accent,
        ),
      ],
    );
  }
}
