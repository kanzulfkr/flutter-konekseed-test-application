import 'package:flutter/material.dart';
import 'package:flutter_konekseed/pages/targets/widgets/button_update_targets.dart';
import 'package:provider/provider.dart';
import '../../common/widget/custom_app_bar.dart';
import '../../provider/target_provider.dart';
import 'widgets/custom_text_field_store_targets.dart';
import '../../common/widget/text_title_form_field.dart';

class EditTargetsScreen extends StatefulWidget {
  const EditTargetsScreen({super.key});

  @override
  State<EditTargetsScreen> createState() => _EditTargetsScreenState();
}

class _EditTargetsScreenState extends State<EditTargetsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController;
    productController;
    categoryController;
    weightController;
    statusController;
    startDateController;
    endDateController;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final x = Provider.of<TargetProvider>(context, listen: false);
    Future.microtask(() => x.getSearchProduct());
    nameController = x.nameController;
    productController = x.productNameController;
    categoryController = x.categoryController;
    weightController = x.weightController;
    statusController = x.statusController;
    startDateController = x.startDateController;
    endDateController = x.endDateController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Targets'),
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
                CTextFieldStoreTargets(
                  controller: nameController,
                  hintText: 'Input Targets Name',
                  icon: const Icon(Icons.person_2_outlined),
                  readOnly: false,
                  numberOnly: false,
                  isProduct: false,
                  isCategory: false,
                  isStatus: false,
                ),
                const TitleFormField(title: 'Product'),
                CTextFieldStoreTargets(
                  controller: productController,
                  hintText: 'Choose Product',
                  icon: const Icon(Icons.file_copy_outlined),
                  readOnly: true,
                  numberOnly: false,
                  isProduct: true,
                  isCategory: false,
                  isStatus: false,
                ),
                const TitleFormField(title: 'Category'),
                CTextFieldStoreTargets(
                  controller: categoryController,
                  hintText: 'Choose Category',
                  icon: const Icon(Icons.note_alt_outlined),
                  readOnly: true,
                  numberOnly: false,
                  isProduct: false,
                  isCategory: true,
                  isStatus: false,
                ),
                const TitleFormField(title: 'Weight'),
                CTextFieldStoreTargets(
                  controller: weightController,
                  hintText: 'Input Targets Weight',
                  icon: const Icon(Icons.note_alt_outlined),
                  readOnly: false,
                  numberOnly: true,
                  isProduct: false,
                  isCategory: false,
                  isStatus: false,
                ),
                const TitleFormField(title: 'Status'),
                CTextFieldStoreTargets(
                  controller: statusController,
                  hintText: 'Input Targets Status',
                  icon: const Icon(Icons.note_alt_outlined),
                  readOnly: true,
                  numberOnly: false,
                  isProduct: false,
                  isCategory: false,
                  isStatus: true,
                ),
                const TitleFormField(title: 'Start Date'),
                CTextFieldStoreTargets(
                  controller: startDateController,
                  hintText: 'Input Start Date',
                  icon: const Icon(Icons.note_alt_outlined),
                  readOnly: false,
                  numberOnly: false,
                  isProduct: false,
                  isCategory: false,
                  isStatus: false,
                ),
                const TitleFormField(title: 'End Date'),
                CTextFieldStoreTargets(
                  controller: endDateController,
                  hintText: 'Input End Date',
                  icon: const Icon(Icons.note_alt_outlined),
                  readOnly: false,
                  numberOnly: false,
                  isProduct: false,
                  isCategory: false,
                  isStatus: false,
                ),
                const SizedBox(height: 20),
                ButtonUpdateTargets(
                  formKey: _formKey,
                  nameController: nameController,
                  productController: productController,
                  categoryController: categoryController,
                  weightController: weightController,
                  statusController: statusController,
                  startDateController: startDateController,
                  endDateController: endDateController,
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
