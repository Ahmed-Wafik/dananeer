class Category {
  int id ;
  String name;
  String avatarImage;
  bool isCheck = false;
  Category(this.name, this.avatarImage, this.id,{this.isCheck = false});
  @override
  String toString() =>
      'id : $id, name : $name, AvatarImage : $avatarImage, isChecked : $isCheck';
}
