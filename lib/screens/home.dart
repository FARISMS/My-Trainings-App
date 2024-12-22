import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_trainings_app/model/training_model.dart';
import 'package:my_trainings_app/utill/color.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
import '../widgets/filter_bottomsheet.dart';
import '../widgets/list_raw_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final PageController _pageController = PageController();
int _currentPage = 0;

final List<String> _images = [
  'https://images.unsplash.com/photo-1498243691581-b145c3f54a5a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://img.freepik.com/free-photo/school-classroom-blur-background-without-young-student-blurry-view-elementary-class-room-no-kid-teacher-with-chairs-tables-campus-vintage-effect-style-pictures_1253-1375.jpg',
  'https://images.unsplash.com/photo-1498243691581-b145c3f54a5a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void _goToPrevious() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _goToNext() {
    if (_currentPage < _images.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider()..loadJsonAsset(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Trainings',
            style: TextStyle(
                fontSize: 32,
                color: AppColors.background,
                fontWeight: FontWeight.w900),
          ),
          backgroundColor: AppColors.primary,
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColors.background,
              ), // Menu icon
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<HomeProvider>(builder: (context, provider, child) {
          return Stack(
            children: [
              // 30% Top section
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: AppColors.primary,
                  alignment: Alignment.topLeft, // Change as needed
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 16),
                    child: Text(
                      'Highlights',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),

              // 70% Bottom section
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  color: AppColors.background, // Change as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 120, left: 16, bottom: 20),
                        child: OutlinedButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return FilterBottomSheet();
                                });
                          },
                          icon: Icon(
                            Icons.filter_list, // Filter icon
                            color: Colors.black54, // Icon color
                          ),
                          label: Text(
                            'Filter', // Button text
                            style:
                                TextStyle(color: Colors.black54), // Text color
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black54, width: 0.5),
                            // Border style
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                            ), // Padding
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black12,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: provider.training.length,
                              // Number of items in the list
                              itemBuilder: (context, index) {
                                return ListRawWidget(
                                  training: provider.training[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Overlay Carousel in the middle of top and bottom
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2 -
                    80, // Middle of 30% and 70%
                left: MediaQuery.of(context).size.width * 0.1,
                child: SizedBox(
                  width:
                      MediaQuery.of(context).size.width * 0.8, // Carousel width
                  height: 150, // Carousel height
                  child: Positioned(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return Stack(children: [
                          Image.network(
                            _images[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                              top: 80, // Align with the carousel
                              left: MediaQuery.of(context).size.width * 0.01,
                              child: Text(
                                provider.training[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 26,
                                    color: Colors.white),
                              )),
                          Positioned(
                              top: 105, // Align with the carousel
                              left: MediaQuery.of(context).size.width * 0.01,
                              child: Text(
                                '${provider.training[index].venue} - '
                                    '${provider.training[index].startTime} - '
                                    '${provider.training[index].endTime}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.white),
                              )),
                        ]);
                      },
                    ),
                  ),
                  // Left arrow button inside the stack
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.2 -
                    28, // Align with the carousel
                left: MediaQuery.of(context).size.width * 0.01,
                child: IconButton(
                  icon:
                      Icon(Icons.arrow_back_ios, color: Colors.black, size: 30),
                  onPressed: _goToPrevious,
                ),
              ),
              // Right arrow button inside the stack
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2 -
                    28, // Align with the carousel
                right: MediaQuery.of(context).size.width * 0.01 - 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      color: Colors.black, size: 30),
                  onPressed: _goToNext,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
