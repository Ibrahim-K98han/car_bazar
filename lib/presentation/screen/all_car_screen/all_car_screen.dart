import 'dart:async';

import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_form.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/fetch_error_text.dart';
import '../home/components/popular_card.dart';
import 'components/condition_selector.dart';
import 'components/purpose_selector.dart';

class AllCarScreen extends StatefulWidget {
  const AllCarScreen({super.key, this.visibleLeading = true});

  final bool visibleLeading;

  @override
  State<AllCarScreen> createState() => _AllCarScreenState();
}

class _AllCarScreenState extends State<AllCarScreen> {
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    debugPrint('scrolling-called');
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0.0) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ffff',
        visibleLeading: widget.visibleLeading,
      ),
      body: LoadedData(controller: _scrollController),
    );
  }
}

class LoadedData extends StatefulWidget {
  const LoadedData({super.key, required this.controller});

  final ScrollController controller;

  @override
  State<LoadedData> createState() => _LoadedDataState();
}

class _LoadedDataState extends State<LoadedData> {
  Timer? _debounce;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: '');

    _searchController.addListener(() {
      setState(() {}); // Rebuild to show/hide the suffix icon dynamically
    });
  }

  @override
  void dispose() {
    _debounce?.cancel(); // Cancel debounce timer
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // Cancel any existing debounce timer
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    // Set up a new debounce timer with 1 second delay
    _debounce = Timer(const Duration(seconds: 1), () {
      if (query.isNotEmpty) {
        // API call logic after user stops typing
      } else {
        // If the query is empty, reset the displayed list to initial data
      }
    });
  }

  void _clearSearch() {
    _searchController.clear(); // Clear input text

    // carsCubit.getAllCarsList(); // Refresh cars list
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double childAspectRatio = size.width / (size.height / 1.46);

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000012),
            blurRadius: 30,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: CustomScrollView(
        controller: widget.controller,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: Utils.symmetric(),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      // initialValue: carsCubit.state.search,
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: borderColor,
                            width: 1,
                          ),
                        ),
                        suffixIcon:
                            _searchController.text.isNotEmpty
                                ? GestureDetector(
                                  onTap: _clearSearch,
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  ),
                                )
                                : null,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: borderColor,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: borderColor,
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Utils.horizontalSpace(12.0),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: size.height * 0.8,
                            padding: Utils.symmetric(v: 20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: 'hh',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const CustomImage(
                                          path: KImages.closeBox,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Utils.verticalSpace(16.0),
                                  CustomText(text: 'Location'),
                                  CustomText(text: 'City'),
                                  CustomText(text: 'Brand'),
                                  CustomText(text: 'Clear'),

                                  Utils.verticalSpace(10.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: PrimaryButton(
                                          text: 'Filter',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      Utils.horizontalSpace(20.0),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const CustomText(
                                            text: "Clear",
                                            fontSize: 16.0,
                                            color: Color(0xFFFF3838),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: Utils.all(value: 12.0),
                        child: const CustomImage(path: KImages.filterIcon),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: Utils.verticalSpace(14.0)),
          SliverPadding(
            padding: Utils.symmetric(h: 20.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: childAspectRatio,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                // return PopularCarCard();
                return CustomText(text: 'All Cars');
              }, childCount: 5),
            ),
          ),
          SliverToBoxAdapter(child: Utils.verticalSpace(14.0)),
        ],
      ),
    );
  }
}
