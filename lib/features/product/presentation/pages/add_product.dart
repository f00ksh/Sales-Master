import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sales_master/features/product/data/models/product.model.dart';
import 'package:sales_master/features/product/presentation/providers/product.provider.dart';
import 'package:sales_master/features/product/presentation/viewmodels/allProduct.viewmodel.dart';
import 'package:sales_master/helpers/utils.dart';
import 'package:sales_master/shared/widgets/text_field.dart';

class AddNewProductPage extends ConsumerStatefulWidget {
  const AddNewProductPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AddNewProductPage> createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends ConsumerState<AddNewProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController publicPriceController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  final TextEditingController unitTypeController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode priceFocus = FocusNode();
  final FocusNode publicPriceFocus = FocusNode();
  final FocusNode countFocus = FocusNode();
  final FocusNode unitTypeFocus = FocusNode();
  bool isSelctImage = false;
  String imagePath = '';
  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    publicPriceController.dispose();
    countController.dispose();
    unitTypeController.dispose();
    nameFocus.dispose();
    priceFocus.dispose();
    publicPriceFocus.dispose();
    countFocus.dispose();
    unitTypeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: Utils.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Select Image Source'),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FloatingActionButton.extended(
                                  elevation: 0,
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    imagePath = await ref.read(
                                        pickImageProvider(ImageSource.camera)
                                            .future);
                                    if (imagePath.isNotEmpty) {
                                      setState(() {
                                        isSelctImage = true;
                                      });
                                    }
                                  },
                                  label: const Text('camera'),
                                  icon: const Icon(Icons.camera),
                                ),
                                SizedBox(width: 10.w),
                                FloatingActionButton.extended(
                                  elevation: 0,
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    imagePath = await ref.read(
                                        pickImageProvider(ImageSource.gallery)
                                            .future);
                                    if (imagePath.isNotEmpty) {
                                      setState(() {
                                        isSelctImage = true;
                                      });
                                    }
                                  },
                                  label: const Text('Gallery'),
                                  icon: const Icon(Icons.image),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: 160.h,
                      width: 200.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: isSelctImage
                            ? Image.file(
                                File(imagePath),
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: secondary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 60,
                                ),
                              ),
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  focusNode: nameFocus,
                  labelText: 'name',
                  nameController: nameController,
                  onSubmitted: (p0) {
                    FocusScope.of(context).requestFocus(priceFocus);
                  },
                ),
                CustomTextField(
                  focusNode: priceFocus,
                  labelText: 'price',
                  nameController: priceController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (p0) {
                    FocusScope.of(context).requestFocus(publicPriceFocus);
                  },
                ),
                CustomTextField(
                  focusNode: publicPriceFocus,
                  labelText: 'public price',
                  nameController: publicPriceController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (p0) {
                    FocusScope.of(context).requestFocus(countFocus);
                  },
                ),
                CustomTextField(
                  focusNode: countFocus,
                  labelText: 'count',
                  nameController: countController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (p0) {
                    FocusScope.of(context).requestFocus(unitTypeFocus);
                  },
                ),
                CustomTextField(
                  focusNode: unitTypeFocus,
                  labelText: 'unit type',
                  nameController: unitTypeController,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (Utils.formKey.currentState!.validate()) {
            if (imagePath.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select an image.'),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              final product = Product()
                ..name = nameController.text
                ..price = double.parse(priceController.text)
                ..publicPrice = double.parse(publicPriceController.text)
                ..count = int.parse(countController.text)
                ..unitType = unitTypeController.text
                ..imagePath = imagePath;

              ref
                  .read(allProductViewModelProvider.notifier)
                  .addNewProduct(product);
              Navigator.pop(context);
            }
          }
        },
        label: const Text('save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
