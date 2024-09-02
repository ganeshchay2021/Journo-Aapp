part of 'widgets_imports.dart';
class CardWidget extends StatelessWidget {
  final int index;
  final String name;
  const CardWidget({
    super.key,
  required this.index,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.white,
      child: ListTile(
        //s.n
        leading: "${index + 1}".text.size(16).make(),
        //cart title
        title: name.text.size(16).fontWeight(FontWeight.w500).make(),
        //cart trailling icons
        trailing: SizedBox(
          width: 110,
          child: Row(
            children: [
              IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.edit, color: Colors.green,),
              ),
              10.w.widthBox,
              IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.delete, color: Colors.red,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
