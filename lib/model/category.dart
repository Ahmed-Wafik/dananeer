class Category {
  int id;
  String name;
  String avatarImage;
  bool isCheck = false;

  static List<Category> _list = [
    Category(name: 'Electronics', avatarImage: 'images/background.jpg', id: 1),
    Category(name: 'Helth&Beauty', avatarImage: 'images/background.jpg', id: 2),
    Category(
        name: 'Jewlery,Bags&Shoes',
        avatarImage: 'images/background.jpg',
        id: 3),
    Category(
        name: 'Home,Light & Construction',
        avatarImage: 'images/background.jpg',
        id: 4),
    Category(
        name: 'Gifts, Sports & Hobbies',
        avatarImage: 'images/background.jpg',
        id: 5),
    Category(
        name: 'Apparel, Textiles & Accessories',
        avatarImage: 'images/background.jpg',
        id: 6),
    Category(
        name: 'Machinary, Hardware & Tools',
        avatarImage: 'images/background.jpg',
        id: 7),
    Category(
        name: 'Electrical equipment & components',
        avatarImage: 'images/background.jpg',
        id: 8),
  ];

  Category({this.name, this.avatarImage, this.id, this.isCheck = false});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Image Path': avatarImage,
        'is Checked': isCheck,
      };
  factory Category.fromJSON(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
      avatarImage: json['Image Path'] as String,
      isCheck: json['is Checked'] as bool);

  static List<Category> get getAllCategories => _list;

  static List<Category> getCategoriesById(List<int> catID) {
    var result = <Map<String, dynamic>>[];
    List<Category> categoriesList = List<Category>();
    for (int ids in catID) {
      for (Category item in _list) {
        if (item.id == ids) {
          print('true');
          result.add(item.toJson());
          break;
        }
      }
    }
    print('result : ' + result.toString());
    categoriesList = List.of(result).map((f) => Category.fromJSON(f)).toList();
    return categoriesList;
  }

  List<Category> getSelectedCat() {
    var result = <Category>[];
    for (Category item in _list) {
      if (item.isCheck) {
        result.add(item);
      }
    }
    return result;
  }

  @override
  String toString() =>
      'id : $id, name : $name, AvatarImage : $avatarImage, isChecked : $isCheck';
}
