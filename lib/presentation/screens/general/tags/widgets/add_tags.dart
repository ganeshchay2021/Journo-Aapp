part of 'tags_imports.dart';

@RoutePage()
class AddTags extends StatefulWidget {
  // final String id
  const AddTags({super.key});

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  final TextEditingController titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Tags".text.color(MyColors.white).make(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: MyColors.white,
          ),
        ),
      ),
      body: OverlayLoaderWithAppIcon(
        circularProgressColor: MyColors.primaryColor,
        isLoading: isLoading,
        appIcon: const Icon(
          FeatherIcons.loader,
          color: MyColors.secondaryColor,
        ),
        child: BlocListener<TagsBloc, CommonState>(
          listener: (context, state) {
            if (state is CommonLoadingState) {
              setState(() {
                isLoading = true;
              });
            } else {
              setState(() {
                isLoading = false;
              });
            }
            if (state is CommonErrorState) {
              VxToast.show(context,
                  msg: state.errorMsg,
                  bgColor: Colors.red,
                  textColor: Colors.white);
            }
            if (state is CommonSuccessState) {
              VxToast.show(context,
                  msg: "Add Successfully",
                  bgColor: Colors.green,
                  textColor: Colors.white);
              titleController.clear();
              Navigator.of(context).pop(true);
              context.read<TagsBloc>().add(FetchAllTagsEvent());
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.h.heightBox,
                  "Title".text.size(16).fontWeight(FontWeight.w500).make(),
                  8.h.heightBox,
                  VxTextField(
                    controller: titleController,
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixColor: MyColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    borderColor: MyColors.primaryColor,
                    borderRadius: 10,
                    borderType: VxTextFieldBorderType.roundLine,
                    hint: "Enter Title",
                    fillColor: Colors.transparent,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Title is empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  20.h.heightBox,
                  "Slug".text.size(16).fontWeight(FontWeight.w500).make(),
                  8.h.heightBox,
                  VxTextField(
                    controller: titleController,
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixColor: MyColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    borderColor: MyColors.primaryColor,
                    borderRadius: 10,
                    borderType: VxTextFieldBorderType.roundLine,
                    hint: "Enter Slug",
                    fillColor: Colors.transparent,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Slug is empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ).pSymmetric(h: 14.w),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: CustomButton(
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<TagsBloc>().add(
                    AddTagsEvent(
                      title: titleController.text,
                      slug: titleController.text
                          .toLowerCase()
                          .replaceAll(" ", "-"),
                    ),
                  );
            }
          },
          btnText: "Add",
        ).pSymmetric(h: 14.w, v: 25.h),
      ),
    );
  }
}
