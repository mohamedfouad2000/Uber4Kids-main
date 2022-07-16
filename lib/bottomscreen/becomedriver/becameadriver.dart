import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/Shared/brocker.dart';
import 'package:project/Shared/companents.dart';
import 'package:project/confirmdriver/condriver.dart';
import 'package:project/cubit/home/homecubit.dart';
import 'package:project/cubit/home/homestates.dart';
import 'package:project/home/Home.dart';

class becameadriverscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        var formkey = GlobalKey<FormState>();
        return Scaffold(
          drawer: Drawer(
            child: SingleChildScrollView(
                child: Column(
              children: [header(context), MyDrawerList(context)],
            )),
          ),
          appBar: AppBar(
            title: Text("Became driver"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.drive_eta_rounded),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    //  if (homeCubit.get(context).fronturl==null)
                    Row(
                      children: [
                        Container(
                          width: 250,
                          height: 70,
                          child: TextButton(
                              onPressed: () {
                                var x = AlertDialog(
                                  title: Text(
                                    "Chosse Your Photo",
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).backgroundColor),
                                  ),
                                  content: Container(
                                    height: 140,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: Colors.teal,
                                            child: TextButton.icon(
                                                label: Text(
                                                  "Gallary",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () async {
                                                  homeCubit
                                                      .get(context)
                                                      .updatefront(context,
                                                          ImageSource.gallery);
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.storage_outlined,
                                                  color: Colors.white,
                                                ))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: Colors.teal,
                                            child: TextButton.icon(
                                                label: Text(
                                                  "camera",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  homeCubit
                                                      .get(context)
                                                      .updatefront(context,
                                                          ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.sailing,
                                                  color: Colors.white,
                                                ))),
                                      ],
                                    ),
                                  ),
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return x;
                                    });
                              },
                              child: Text(
                                "Add Front",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        if (homeCubit.get(context).fronturl != null)
                          Icon(Icons.done)
                        // if (state is frontPhotosucc) Icon(Icons.done),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // if (state is frontPhotosucc)
                    Row(
                      children: [
                        Container(
                          width: 250,
                          height: 70,
                          child: TextButton(
                              onPressed: () {
                                var x = AlertDialog(
                                  title: Text("Chosse Your Photo"),
                                  content: Container(
                                    height: 140,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: Colors.teal,
                                            child: TextButton.icon(
                                                label: Text(
                                                  "Gallary",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () async {
                                                  homeCubit
                                                      .get(context)
                                                      .updateback(context,
                                                          ImageSource.gallery);
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.storage_outlined,
                                                  color: Colors.white,
                                                ))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: Colors.teal,
                                            child: TextButton.icon(
                                                label: Text(
                                                  "camera",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  homeCubit
                                                      .get(context)
                                                      .updateback(context,
                                                          ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.sailing,
                                                  color: Colors.white,
                                                ))),
                                      ],
                                    ),
                                  ),
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return x;
                                    });
                              },
                              child: Text(
                                "Add back",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        if (homeCubit.get(context).backurl != null)
                          Icon(Icons.done)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // if (state is backPhotosucc)
                    Row(
                      children: [
                        Container(
                          width: 250,
                          height: 70,
                          child: TextButton(
                              onPressed: () {
                                var x = AlertDialog(
                                  title: Text("Chosse Your Photo"),
                                  content: Container(
                                    height: 140,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: Colors.teal,
                                            child: TextButton.icon(
                                                label: Text(
                                                  "Gallary",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () async {
                                                  homeCubit
                                                      .get(context)
                                                      .updatec_chip(context,
                                                          ImageSource.gallery);
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.storage_outlined,
                                                  color: Colors.white,
                                                ))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: Colors.teal,
                                            child: TextButton.icon(
                                                label: Text(
                                                  "camera",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  homeCubit
                                                      .get(context)
                                                      .updatec_chip(context,
                                                          ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.sailing,
                                                  color: Colors.white,
                                                ))),
                                      ],
                                    ),
                                  ),
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return x;
                                    });
                              },
                              child: Text(
                                "Add c_chip",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        if (homeCubit.get(context).c_chipurl != null)
                          Icon(Icons.done)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // if (state is c_chipPhotosucc)
                    Row(
                      children: [
                        Container(
                          width: 250,
                          height: 70,
                          child: TextButton(
                              onPressed: () {
                                var x = AlertDialog(
                                  title: Text("Chosse Your Photo"),
                                  content: Container(
                                    height: 140,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: Colors.teal,
                                            child: TextButton.icon(
                                                label: Text(
                                                  "Gallary",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () async {
                                                  homeCubit
                                                      .get(context)
                                                      .updatelicence(context,
                                                          ImageSource.gallery);
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.storage_outlined,
                                                  color: Colors.white,
                                                ))),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            height: 50,
                                            width: double.infinity,
                                            color: Colors.teal,
                                            child: TextButton.icon(
                                                label: Text(
                                                  "camera",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  homeCubit
                                                      .get(context)
                                                      .updatelicence(context,
                                                          ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.sailing,
                                                  color: Colors.white,
                                                ))),
                                      ],
                                    ),
                                  ),
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return x;
                                    });
                                //  homeCubit.get(context).updatelicence(context);
                              },
                              child: Text(
                                "Add licence",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        if (homeCubit.get(context).licenceurl != null)
                          Icon(Icons.done)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // if (state is licencePhotosucc)
                    if (homeCubit.get(context).licenceurl != null &&
                        homeCubit.get(context).fronturl != null &&
                        homeCubit.get(context).c_chipurl != null &&
                        homeCubit.get(context).backurl != null)
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                homeCubit.get(context).drivercreate();

                                if (state is adddriversucc) {
                                  Nav(context, Home());
                                  ShowToastFun(
                                      msg:
                                          "Please Wait the Admin to check Your Data",
                                      Sort: toaststate.success);

                                  //  "Please Wait the Admin to check Your Data"
                                }
                              }
                            },
                            child: Text(
                              "confirm",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
