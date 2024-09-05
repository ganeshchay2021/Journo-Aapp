part of 'widgets/add_post_imports.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        title: "Add Post".text.white.make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.check,
              color: MyColors.white,
            ),
          )
        ],
      ),
      //page body section
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            //image selection view section
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(MyAssets.addImagePlaceholder),
                ),
              ),
            ),
            //title textfield
            VxTextField(
              controller: titleController,
              suffixColor: MyColors.primaryColor,
              hint: "Title",
              fillColor: MyColors.white,
              borderColor: MyColors.primaryColor,
              borderType: VxTextFieldBorderType.roundLine,
              borderRadius: 10,
            ),
            //description textfield 
            20.h.heightBox,
            VxTextField(
              suffixColor: MyColors.primaryColor,
              maxLine: null,
              controller: slugController,
              hint: "Slug",
              fillColor: MyColors.white,
              borderColor: MyColors.primaryColor,
              borderType: VxTextFieldBorderType.roundLine,
              borderRadius: 10,
            ),
            20.h.heightBox,
            //tag selection field
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  "Tags".text.make(),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15.w,
                  )
                ],
              ),
            ),
            20.h.heightBox,
            //category selection field
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  "Tags".text.make(),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15.w,
                  )
                ],
              ),
            ),
            //Text Editing Toolbar
            QuillSimpleToolbar(
              controller: _controller,
              configurations: const QuillSimpleToolbarConfigurations(),
            ),
            SizedBox(
              height: 500.h,
              child: QuillEditor.basic(
                controller: _controller,
                configurations: const QuillEditorConfigurations(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
