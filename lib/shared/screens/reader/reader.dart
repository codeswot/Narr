import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/themes/dark_mode.dart';
import 'package:narr/shared/widgets/photo_slider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:math';

class Reader extends StatefulWidget {
  final dynamic reasearch;
  Reader(this.reasearch);
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  Random r = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reader'),
      ),
      body: Slider(widget.reasearch),
    );
  }
}

class Slider extends StatefulWidget {
  final dynamic research;
  Slider(this.research);
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  bool? isDark = false;
  late CarouselSlider carouselSlider;
  CarouselController buttonCarouselController = CarouselController();

  int? _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    var readPath = widget.research['readPath'];
    var nPages = widget.research['nPages'];
    var researchTitle = widget.research['researchTitle'];
    var authors = widget.research['authors'];
    var genre = widget.research['genre'];
    var category = widget.research['category'];
    var accessType = widget.research['accessType'];
    var year = widget.research['year'];
    return FutureBuilder<dynamic>(
      builder: (context, research) {
        String requestUrl() {
          // int ranNum = _random.nextInt(8163907) * _random.nextInt(2765309);
          String url =
              'https://app.narr.ng$readPath$_currentPage.jpg?token=${currentUser.token}&nPages=$nPages&researchTitle=$researchTitle&authors=$authors&genre=$genre&category=$category&accessType=$accessType&year=$year${_currentPage == nPages ? '&end=true' : ''}';
          return url;
        }

        // if (!research.hasData) {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // } else if (research.connectionState == ConnectionState.waiting) {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (isDark == true)
                  ? Expanded(
                      child: DarkMode(
                        child: PhotoSlider(
                          buttonCarouselController: buttonCarouselController,
                          imgList: [requestUrl()],
                          isDark: true,
                        ),
                      ),
                    )
                  : PhotoSlider(
                      buttonCarouselController: buttonCarouselController,
                      imgList: [requestUrl()],
                      isDark: false,
                    ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      value: isDark,
                      onChanged: (bool? val) {
                        setState(() {
                          isDark = val;
                        });
                      },
                    ),
                    Text('Night Mode'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: BottomAppBar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            setState(() {
                              _currentPage = 1;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.chevron_left),
                          onPressed: () {
                            setState(() {
                              if (_currentPage! < 2) {
                                _currentPage = 1;
                              } else {
                                _currentPage = (_currentPage! - 1);
                              }
                            });
                            print(_currentPage);
                          },
                        ),
                      ),
                      FloatingActionButton(
                        child: Icon(Icons.view_carousel),
                        onPressed: () {
                          void _showDialog() {
                            showDialog<int>(
                              context: context,
                              builder: (BuildContext context) {
                                return NumberPicker(
                                  value: _currentPage!,
                                  minValue: 1,
                                  maxValue: research.data['nPages'],
                                  onChanged: (int value) {},
                                );
                              },
                            ).then(
                              (value) => setState(() {
                                _currentPage = value;
                              }),
                            );
                          }

                          _showDialog.call();
                        },
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () {
                            setState(() {
                              if (_currentPage == nPages) {
                                setState(() {
                                  _currentPage = nPages;
                                });
                              } else {
                                setState(() {
                                  _currentPage = _currentPage! + 1;
                                });
                              }
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            setState(() {
                              _currentPage = nPages;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
