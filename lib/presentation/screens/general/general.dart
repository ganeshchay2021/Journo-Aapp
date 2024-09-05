part of 'widgets/general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int visit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main Page Section
      body: GeneralViewModel.pages[visit],
      //Navigation Bar
      bottomNavigationBar: BottomBarCreative(
        items: GeneralViewModel.items,
        backgroundColor: Colors.grey.shade200,
        color: MyColors.primaryColor.withOpacity(0.2),
        colorSelected: MyColors.primaryColor,
        indexSelected: visit,
        onTap: (index) {
          setState(() {
            visit = index;
          });
        },
      ),
    );
  }
}
