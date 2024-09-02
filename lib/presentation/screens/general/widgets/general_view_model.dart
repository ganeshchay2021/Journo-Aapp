part of 'general_imports.dart';

class GeneralViewModel {
  static const List<TabItem> items = [
    TabItem(
      icon: FeatherIcons.home,
    ),
    TabItem(
      icon: FeatherIcons.tag,
    ),
    TabItem(
      icon: FeatherIcons.plus,
    ),
    TabItem(
      icon: FeatherIcons.hash,
    ),
    TabItem(
      icon: FeatherIcons.user,
    ),
  ];
  static List<Widget> pages = [
    const Home(),
    const Category(),
    const AddPost(),
    const Tags(),
    const Profile()
  ];
}
