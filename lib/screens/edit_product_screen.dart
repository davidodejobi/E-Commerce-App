import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '../constant.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _imageFocusNode = FocusNode();

  @override
  void dispose() {
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _imageFocusNode.addListener(() {
      _updateImageUrl();
    });
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Column(
            children: [
              const PopCustomAppBar(
                title: Text('Your Products'),
                leading: SizedBox(),
              ),
              Form(
                child: Expanded(
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Title',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Product Title',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade800,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            cursorColor: Colors.black,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (_) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a title.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Price',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Product Price',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade800,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a title.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Description',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Product Description',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade800,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            cursorColor: Colors.black,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a title.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Image Url',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: _imageUrlController.text.isEmpty
                                    ? const Center(
                                        child: Text(
                                          'Enter Image Url',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    : Image.network(
                                        _imageUrlController.text,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _imageUrlController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Product Image Url',
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  focusNode: _imageFocusNode,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.url,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    setState(() {});
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please provide a title.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
