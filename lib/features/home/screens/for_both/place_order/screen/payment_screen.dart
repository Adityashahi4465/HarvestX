import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harvestx/core/common/background.dart';
import 'package:harvestx/core/common/green_button.dart';
import 'package:harvestx/core/common/loder.dart';
import 'package:harvestx/features/home/screens/costumer/profile.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constants/firebase_constents.dart';
import '../../../../../../core/providers/cart_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = 1;
  CollectionReference users =
      FirebaseFirestore.instance.collection(FirebaseConstants.usersCollection);

  @override
  Widget build(BuildContext context) {
    double totalPrice = context.watch<Cart>().totalPrice;
    double totalPaid = context.watch<Cart>().totalPrice + 10.0;
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Some error Occurred');
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Data does not exist");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Material(
            color: Colors.white,
            child: LoadingDialogWidget(
              message: 'Loading',
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Material(
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Text('Payment',
                      style: GoogleFonts.acme(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  leading: BackButton(
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                body: Stack(
                  children: [
                    BackgroundImage(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 60),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Total',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '${totalPaid.toStringAsFixed(2)} USD',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const YellowDivider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Total Order',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                      Text(
                                        '${totalPrice.toStringAsFixed(2)} USD',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sipping Coast',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                      Text(
                                        '10.00 USD',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      value: 1,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value!;
                                        });
                                      },
                                      title: const Text('Cash On Delivery'),
                                      subtitle: const Text('Pay Cash At Home'),
                                    ),
                                    RadioListTile(
                                      value: 2,
                                      groupValue: selectedValue,
                                      onChanged: (int? value) {
                                        setState(() {
                                          selectedValue = value!;
                                        });
                                      },
                                      title: const Text(
                                          'Pay via visa/ Master Card'),
                                      subtitle: const Row(children: [
                                        Icon(Icons.payment, color: Colors.blue),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15.0,
                                          ),
                                          child: Icon(
                                            FontAwesomeIcons.ccMastercard,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.ccVisa,
                                          color: Colors.blue,
                                        ),
                                      ]),
                                    ),
                                    RadioListTile(
                                      value: 3,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value!;
                                        });
                                      },
                                      title: const Text('Pay via PayPal'),
                                      subtitle: const Row(
                                        children: [
                                          Icon(FontAwesomeIcons.paypal),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(FontAwesomeIcons.ccPaypal),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                bottomSheet: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GreenButton(
                    label: 'Confirm ${totalPrice.toStringAsFixed(2)} USD',
                    width: 1,
                    onPressed: () {
                      
                      if (selectedValue == 1) {
                      } else if (selectedValue == 2) {
                        print('visa');
                      }
                      print("paypal");
                    },
                  ),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: LoadingDialogWidget(),
        );
      },
    );
  }
}
