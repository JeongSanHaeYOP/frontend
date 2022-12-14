import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';

class SelectPerBottomSheet extends StatefulWidget {
  const SelectPerBottomSheet({Key? key}) : super(key: key);

  @override
  State<SelectPerBottomSheet> createState() => _SelectPerBottomSheetState();
}

int num = 20;

class _SelectPerBottomSheetState extends State<SelectPerBottomSheet> {
  final _valueList = [for (var i = 0; i < num; i++) i + 1];
  int _selectedValue = 1;

  final _bankList = [
    "국민",
    "기업",
    "농협",
    "새마을 금고",
    "신한",
    "우리",
    "하나",
    "카카오뱅크",
    "기타"
  ];
  String _selectedBank = "기타";

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController personTextController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.white,
      child: Wrap(
        children: <Widget>[
          Center(
              child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: const Text(
              "정보",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )),
          const Divider(thickness: 1, height: 1, color: ColorStyles.mainGrey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "인원 수 입력",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: DropdownButton(
                    elevation: 0,
                    autofocus: false,
                    focusColor: ColorStyles.subGreen,
                    dropdownColor: ColorStyles.subGrey,
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    underline: Container(
                      height: 2,
                      color: ColorStyles.mainGreen,
                    ),
                    menuMaxHeight: 200,
                    value: _selectedValue,
                    items: _valueList.map((item) {
                      return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.toString(),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  )),
            ],
          ),
          const Divider(thickness: 1, height: 1, color: ColorStyles.mainGrey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "계좌 포함",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: Switch(
                      activeColor: ColorStyles.mainGreen,
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value;
                        });
                      }))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AbsorbPointer(
                absorbing: !_isChecked,
                child: SizedBox(
                    width: 100,
                    height: 50,
                    child: DropdownButton(
                      elevation: 0,
                      autofocus: false,
                      focusColor: ColorStyles.subGreen,
                      dropdownColor: ColorStyles.subGrey,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      underline: Container(
                        height: 2,
                        color: ColorStyles.mainGreen,
                      ),
                      menuMaxHeight: 200,
                      value: _selectedBank,
                      items: _bankList.map((item) {
                        return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item.toString(),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedBank = value!;
                        });
                      },
                    )),
              ),
              AbsorbPointer(
                absorbing: !_isChecked,
                child: const SizedBox(
                  width: 200,
                  child: TextField(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
