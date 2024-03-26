import 'package:flutter/material.dart';
import 'package:movies/core/myTheme.dart';
import 'package:movies/features/search/view/manager/search_provider.dart';
import 'package:provider/provider.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        required this.label,
        this.keyboardType = TextInputType.text,
        required this.controller,

        this.obscureText = false});

  String label;
  TextInputType keyboardType;
  TextEditingController controller;

  bool obscureText;

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(

          prefixIconColor: MyTheme.grayColor,
          filled: true,
          fillColor: MyTheme.darkGray,
           prefixIcon: InkWell(onTap: (){
            searchProvider.changeMovie(controller.text);
            searchProvider.changeSearchingState(true);
          },child: Icon(Icons.search)),
          suffixIconColor: MyTheme.grayColor,
          hintText: label,
          hintStyle:Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: MyTheme.grayColor) ,
          //label: Text(label,
          //  style: Theme.of(context)
          //   .textTheme
          //  .bodySmall!
          // .copyWith(color: MyTheme.primaryColor.withOpacity(0.2))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide(color: MyTheme.grayColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide(color: MyTheme.grayColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide(color:Colors.red, width: 2),
          ),
        ),
        keyboardType: keyboardType,
        controller: controller,

        obscureText: obscureText,
      ),
    );
  }
}
