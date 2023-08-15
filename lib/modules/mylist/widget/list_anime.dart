part of mylist;

class ListAnime extends StatelessWidget {
  const ListAnime({
    super.key,
    required this.listMyList,
    required this.controller,
  });

  final List<MyList>? listMyList;
  final MyListPageController controller;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = Get.width;
    double sizeHeight = Get.height;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: listMyList!.length,
      itemBuilder: (context, index) {
        MyList myList = listMyList![index];
        return GestureDetector(
          onTap: () {
            controller.detailAnimeController.sendArgument(
              isOngoing: false.obs,
              isMyList: true.obs,
              title: myList.title,
              myList: myList,
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              bottom: sizeHeight * .02,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: SizedBox(
                    width: sizeWidth * .35,
                    height: sizeHeight * .25,
                    child: Image.network(
                      myList.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeWidth * .05,
                ),
                SizedBox(
                  width: sizeWidth * .50,
                  height: sizeHeight * .25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        myList.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: sizeWidth * 0.05,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${myList.episode.toString()} Episode',
                        style: const TextStyle(
                          color: AppColor.accent,
                        ),
                      ),
                      Text(
                        myList.type,
                        style: const TextStyle(
                          color: AppColor.accent,
                        ),
                      ),
                      Text(
                        '${myList.day}-${myList.month}-${myList.year}',
                        style: const TextStyle(
                          color: AppColor.accent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
