import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:quick_msg/controller/data_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Consumer<DataController>(
          builder: (context, controller, child) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon.png",
                        color: Colors.white,
                        scale: 7,
                      ),
                      SizedBox(height: height * 0.1),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                controller.phoneNumber = number.phoneNumber!;
                              },
                              initialValue: PhoneNumber(isoCode: 'MA'),
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.DIALOG,
                              ),
                              maxLength: 10,
                              inputDecoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 15, left: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 16),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 94,
                            top: 8,
                            bottom: 8,
                            child: Container(
                              height: height * 0.2,
                              width: 1,
                              color: Colors.white.withOpacity(1),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.3),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.phoneNumber == '') {
                              Fluttertoast.showToast(
                                  msg: "The Number field is empty !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              controller.openChatWhatssap();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.whatsapp),
                              Text('Start Chat')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
