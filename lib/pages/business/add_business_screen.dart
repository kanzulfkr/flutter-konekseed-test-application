import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/widget/custom_app_bar.dart';
import '../../common/widget/text_title_form_field.dart';
import '../../provider/user_provider.dart';
import 'widgets/button_store_bloc.dart';
import 'widgets/custom_text_field_store_business.dart';

class AddBusinessScreen extends StatefulWidget {
  const AddBusinessScreen({super.key});

  @override
  State<AddBusinessScreen> createState() => _AddBusinessScreenState();
}

class _AddBusinessScreenState extends State<AddBusinessScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController;
    userIdController;
    logoController;
    sectorController;
    statusController;
    super.dispose();
  }

  @override
  void initState() {
    final x = Provider.of<UserProvider>(context, listen: false);
    final userId = x.getUserName.toString();
    userIdController = TextEditingController(text: userId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Your Business'),
      backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
      body: Hero(
        tag: 'hero',
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                const TitleFormField(title: 'Name'),
                CTextFieldStoreBusiness(
                  controller: nameController,
                  hintText: 'Input Business Name',
                  icon: const Icon(Icons.person_2_outlined),
                  isProduct: false,
                  readOnly: false,
                  numberOnly: false,
                ),
                const TitleFormField(title: 'Owner'),
                CTextFieldStoreBusiness(
                  controller: userIdController,
                  hintText: 'John Doe',
                  icon: const Icon(Icons.file_copy_outlined),
                  isProduct: false,
                  readOnly: true,
                  numberOnly: false,
                ),
                const TitleFormField(title: 'Logo'),
                CTextFieldStoreBusiness(
                  controller: logoController,
                  hintText: 'Input URL Logo',
                  icon: const Icon(Icons.note_alt_outlined),
                  isProduct: false,
                  readOnly: false,
                  numberOnly: false,
                ),
                const TitleFormField(title: 'Sector'),
                CTextFieldStoreBusiness(
                  controller: sectorController,
                  hintText: 'Input Business Sector',
                  icon: const Icon(Icons.note_alt_outlined),
                  isProduct: false,
                  readOnly: false,
                  numberOnly: true,
                ),
                const TitleFormField(title: 'Status'),
                CTextFieldStoreBusiness(
                  controller: statusController,
                  hintText: 'Input Business Status',
                  icon: const Icon(Icons.note_alt_outlined),
                  isProduct: false,
                  readOnly: false,
                  numberOnly: false,
                ),
                const SizedBox(height: 20),
                ButtonStoreBusiness(
                  formKey: _formKey,
                  nameController: nameController,
                  userIdController: userIdController,
                  logoController: logoController,
                  sectorController: sectorController,
                  statusController: statusController,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
