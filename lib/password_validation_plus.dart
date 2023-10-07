library password_validation_plus;

import 'package:flutter/material.dart';

class PasswordValidationPlus extends StatefulWidget{
  final TextEditingController textController;
  final int? maxLength;
  final int minLength;
  final IconData? successIcon;
  final IconData? unSuccessIcon;
  final Widget? successWidget;
  final Widget? unSuccessWidget;
  final double textSize;
  const PasswordValidationPlus({super.key, required this.textController, this.maxLength, this.minLength = 8, this.successIcon, this.unSuccessIcon, this.successWidget, this.unSuccessWidget, this.textSize = 14});

  @override
  State<PasswordValidationPlus> createState() => PasswordValidationPlusState();

}
class PasswordValidationPlusState extends State<PasswordValidationPlus>{

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp simpleReg = RegExp(r".*[a-z].*");
  RegExp capitalReg = RegExp(r".*[A-Z].*");
  RegExp symbolsReg = RegExp(r'.*[!@#\$&*~].*');
  double _strength = 0;

  @override
  void initState() {
    super.initState();
    widget.textController.addListener(calculateStrength);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.85,
      child: Column(
        children: [
          SizedBox(height: size.height*0.005),
          LinearProgressIndicator(
            value: _strength,
            backgroundColor: Colors.grey[300],
            color: _strength <= 0.2 ? Colors.red : _strength == 0.4 ? Colors.yellow : _strength == 0.6000000000000001 ? Colors.amber :_strength == 0.8 ? Colors.orange : Colors.green,
            minHeight: 5,
          ),
          SizedBox(height: size.height*0.015),
          conditionText(checkLength(), widget.maxLength != null?'Contain between ${widget.minLength}-${widget.maxLength} Characters':'Contain at least ${widget.minLength} Characters'),
          SizedBox(height: size.height*0.005),
          conditionText(capitalReg.hasMatch(widget.textController.text), "At least one CAPITAL letter"),
          SizedBox(height: size.height*0.005),
          conditionText(simpleReg.hasMatch(widget.textController.text), "At least one simple letter"),
          SizedBox(height: size.height*0.005),
          conditionText(numReg.hasMatch(widget.textController.text), "At least one number"),
          SizedBox(height: size.height*0.005),
          conditionText(symbolsReg.hasMatch(widget.textController.text), "At least one special character"),
        ],
      ),
    );
  }

  calculateStrength(){
    double total = 0;
    if(checkLength()){
      total += 0.2;
    }
    if(capitalReg.hasMatch(widget.textController.text)){
      total += 0.2;
    }
    if(simpleReg.hasMatch(widget.textController.text)){
      total += 0.2;
    }
    if(numReg.hasMatch(widget.textController.text)){
      total += 0.2;
    }
    if(symbolsReg.hasMatch(widget.textController.text)){
      total += 0.2;
    }
    setState(() {
      _strength = total;
    });
  }

  Widget conditionText(bool condition, String text){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: condition?widget.successWidget??Icon(
            widget.successIcon??Icons.check,
            color: Colors.green,
            size: 14,
          ):widget.unSuccessWidget??Icon(
            widget.unSuccessIcon??Icons.clear,
            color: Colors.red,
            size: 14,
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: condition? Colors.green: Colors.red,
              height: 1.5,
            ),
          ),
        )
      ],
    );
  }

  checkLength(){
    if(widget.maxLength != null){
      return widget.textController.text.length >= widget.minLength && widget.textController.text.length <= widget.maxLength!;
    }else{
      return widget.textController.text.length >= widget.minLength;
    }
  }

}