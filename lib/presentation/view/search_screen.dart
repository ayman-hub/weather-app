import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'city_weather_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  // Set<String>? _tags;
  List<String>? citiesNames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: 50.h,
          left: 15.w,
          right: 15.w,
        ),
        child: Form(
          key: formKey,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print(controller.text.split(','));
                    List<String>? newlist = controller.text.split(',');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CityWeather(tags: newlist)));
                  }
                  // context.read<CityWeatherBloc>().cityName =
                  // _tags!;
                },
                child: Container(
                  width: 90.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white.withOpacity(0.5)),
                  child: Icon(Icons.search),
                ),
              ),
              Spacer(),
              Container(
                height: 70.h,
                width: 350.w,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.5),
                    hintText: 'Enter at least 3 city names and maximum 7',
                    filled: true,
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    citiesNames = value.split(',');
                    print(citiesNames);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  // initialTags: _tags?.toList(),
                  // onTag: (String tag) {
                  //   _tags?.add(tag);
                  // },
                  // onDelete: (String tag) {
                  //   _tags?.remove(tag);
                  // },
                  // validator: (String tag) {
                  //   if (tag.length > 7) {
                  //     return 'hey that is too much';
                  //   } else if (tag.length < 3) {
                  //     return 'enter at least 3 cities names';
                  //   } else if (_tags!.contains(tag)) {
                  //     return 'you\'ve already entered that';
                  //   }
                  //   return null;
                  // },
                  // tagsStyler: TagsStyler(
                  //   showHashtag: true,
                  //   tagMargin: EdgeInsets.only(right: 4.0.w),
                  //   tagCancelIcon: const Icon(
                  //     Icons.cancel,
                  //     size: 15.0,
                  //     color: Colors.black,
                  //   ),
                  //   tagCancelIconPadding: EdgeInsets.only(left: 4.w, top: 2.h),
                  //   tagPadding: EdgeInsets.only(
                  //     top: 2.h,
                  //     bottom: 4.h,
                  //     left: 8.w,
                  //     right: 4.w,
                  //   ),
                  //   tagDecoration: BoxDecoration(
                  //     color: Colors.white,
                  //     border: Border.all(
                  //       color: Colors.grey.shade300,
                  //     ),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(20.r),
                  //     ),
                  //   ),
                  // ),
                  // textFieldStyler: TextFieldStyler(
                  //   readOnly: false,
                  //   hintText: 'write at least 3 cities names and maximum 7',
                  //   isDense: false,
                  //   textFieldFocusedBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.black, width: 3.w),
                  //   ),
                  //   textFieldBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.black, width: 3.w),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
