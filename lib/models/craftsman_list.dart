import '/models/Craftsman_model.dart';
import 'Craftsman_model.dart';

enum GetItem {
  all,
  byBestOfMonth,
  byLatest,
  byFeatured,
}

class CraftsmanListInMemory {
  late List<Craftsman> craftsmanList;

  CraftsmanListInMemory() {
    craftsmanList = [
      Craftsman(
        name: "أراس أحمد نورس",
        number: "0750 2368 678",
        image: "assets/images/pic.png",
        job: "جامجي",
        album: [
          "assets/images/pic20.JPG",
          "assets/images/pic21.JPG",
          "assets/images/pic22.JPG",
          "assets/images/pic20.JPG",
          "assets/images/pic21.JPG",
          "assets/images/pic22.JPG",
        ],
      ),
      Craftsman(
        name: "مالك جوان سعيد",
        number: "0750 1111 839",
        image: "assets/images/64.JPG",
        job: "كهربجي",
        album: [
          "assets/images/pic30.JPG",
          "assets/images/pic31.JPG",
          "assets/images/pic32.JPG",
          "assets/images/pic30.JPG",
          "assets/images/pic31.JPG",
          "assets/images/pic32.JPG",
        ],
      ),
      Craftsman(
        name: "نزار بابير رومان",
        number: "0750 2222 839",
        image: "assets/images/pic4.jpg",
        job: "لحمجي",
        album: [
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
        ],
      ),
      Craftsman(
        name: "هاجال عابد شيخموس",
        number: "0750 8888 839",
        image: "assets/images/pic20.JPG",
        job: "نجارجي",
        album: [
          "assets/images/60.JPG",
          "assets/images/61.JPG",
          "assets/images/62.JPG",
          "assets/images/60.JPG",
          "assets/images/64.JPG",
          "assets/images/62.JPG",
        ],
      ),
      Craftsman(
        name: "هاوراس جوان ياسين",
        number: "0750 2368 999",
        image: "assets/images/pic5.jpg",
        job: "حلاقجي",
        album: [
          "assets/images/pic30.JPG",
          "assets/images/pic31.JPG",
          "assets/images/pic32.JPG",
          "assets/images/pic30.JPG",
          "assets/images/pic31.JPG",
          "assets/images/pic32.JPG",
        ],
      ),
      Craftsman(
        name: "رومان احمد محمد",
        number: "0750 7878 839",
        image: "assets/images/pic7.png",
        job: "معلم صحية",
        album: [
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
        ],
      ),
      Craftsman(
        name: "علي حسين عثمان",
        number: "0750 0000 839",
        image: "assets/images/pic8.webp",
        job: "ميكانيكي",
        album: [
          "assets/images/60.JPG",
          "assets/images/61.JPG",
          "assets/images/62.JPG",
          "assets/images/60.JPG",
          "assets/images/64.JPG",
          "assets/images/62.JPG",
        ],
      ),
      Craftsman(
        name: "هانا محمد عثمان",
        number: "0750 7777 010",
        image: "assets/images/pic9.JPG",
        job: "حداد",
        album: [
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
        ],
      ),
      Craftsman(
        name: "هانا ياسين شاكر",
        number: "0750 2323 232",
        image: "assets/images/pic10.JPG",
        job: "مزارع",
        album: [
          "assets/images/60.JPG",
          "assets/images/61.JPG",
          "assets/images/62.JPG",
          "assets/images/60.JPG",
          "assets/images/64.JPG",
          "assets/images/62.JPG",
        ],
      ),
    ];
  }

  List<Craftsman> getItems(GetItem get) {
    List<Craftsman> records;
    switch (get) {
      case GetItem.all:
        records = getItemAll();
        break;
      case GetItem.byBestOfMonth:
        records = getItemByBestOfMonth();
        break;
      case GetItem.byLatest:
        records = getItemByLatest();
        break;
      case GetItem.byFeatured:
        records = getItemByFeatured();
        break;
      default:
        records = [];
    }
    return records;
  }

  List<Craftsman> getItemAll() {
    return craftsmanList;
  }

  List<Craftsman> getItemByBestOfMonth() {
    List<Craftsman> records = [
      Craftsman(
        name: "هاوراس جوان ياسين",
        number: "0750 2368 999",
        image: "assets/images/pic5.jpg",
        job: "حلاقجي",
        album: [
          "assets/images/pic30.JPG",
          "assets/images/pic31.JPG",
          "assets/images/pic32.JPG",
          "assets/images/pic30.JPG",
          "assets/images/pic31.JPG",
          "assets/images/pic32.JPG",
        ],
      ),
      Craftsman(
        name: "رومان احمد محمد",
        number: "0750 7878 839",
        image: "assets/images/pic7.png",
        job: "معلم صحية",
        album: [
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
        ],
      ),
      Craftsman(
        name: "علي حسين عثمان",
        number: "0750 0000 839",
        image: "assets/images/pic8.webp",
        job: "ميكانيكي",
        album: [
          "assets/images/60.JPG",
          "assets/images/61.JPG",
          "assets/images/62.JPG",
          "assets/images/60.JPG",
          "assets/images/64.JPG",
          "assets/images/62.JPG",
        ],
      ),
      Craftsman(
        name: "هانا محمد عثمان",
        number: "0750 7777 010",
        image: "assets/images/pic9.JPG",
        job: "حداد",
        album: [
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
          "assets/images/40.JPG",
          "assets/images/41.JPG",
          "assets/images/42.JPG",
        ],
      ),
      Craftsman(
        name: "هانا ياسين شاكر",
        number: "0750 2323 232",
        image: "assets/images/pic10.JPG",
        job: "مزارع",
        album: [
          "assets/images/60.JPG",
          "assets/images/61.JPG",
          "assets/images/62.JPG",
          "assets/images/60.JPG",
          "assets/images/64.JPG",
          "assets/images/62.JPG",
        ],
      ),
    ];

    return records;
  }

  List<Craftsman> getItemByLatest() {
    List<Craftsman> records = [];
    //
    // statments for sepicific list
    //

    return records = craftsmanList;
  }

  List<Craftsman> getItemByFeatured() {
    List<Craftsman> records = [];
    //
    // statments for sepicific list
    //

    return records = craftsmanList;
  }
}
