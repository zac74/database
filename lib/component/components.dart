import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) =>  widget,
    ),
        (route) => false
);

Widget defaultFormField({

  TextEditingController? controller,
  dynamic label,
  IconData ? prefix,
  String ? initialValue,
  TextInputType ?keyboardType,
  Function? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData ?suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      onFieldSubmitted: (value) {
        onSubmit!(value);
      },
      enabled: enabled,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.center,
      initialValue:initialValue ,
      //textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
        hintText: label,
        border:UnderlineInputBorder(),
        prefixIcon: Icon(prefix,),
        suffixIcon: suffix != null ? IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,

      ),
    );
Widget defaultTextButton({
  required Function function,
  required String text,
})=>TextButton(
  onPressed :()=> function(),
  child:Text(
      text.toUpperCase()),);

Widget defaultButton({

  double r = 30.0,
  required String text,
  bool isUpper = true,
  Color back = Colors.blue,
  required Function function,
}) =>
    Container(
      width: 200,
      decoration: BoxDecoration(
        color: back,
        borderRadius: BorderRadius.circular(
          r,
        ),
      ),
      child: FlatButton(
        onPressed: ()=> function(),
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );





Widget myDivider()=> Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    width: double.infinity ,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

 /*void signOut(context){
  CacheHelper.removeData('token').then((value)
  {
    if(value){
    navigateAndFinish(context, ShopLoginScreen(),);
    }
  });
}*/
String? token = '';
void printFullText( String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}
