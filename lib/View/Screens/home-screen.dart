import 'package:firstforapp/Constants/colors.dart';
import 'package:firstforapp/Constants/strings.dart';
import 'package:firstforapp/Constants/text-style.dart';
import 'package:firstforapp/Controller/AuthController/auth-controller.dart';
import 'package:firstforapp/Controller/home_controller.dart';
import 'package:firstforapp/Controller/local-storage/local-storage.dart';
import 'package:firstforapp/Model/addCredential.dart';
import 'package:firstforapp/Model/list-storage.dart';
import 'package:firstforapp/View/Screens/dail-screen.dart';
import 'package:firstforapp/View/Widgets/buttons/appBar-button.dart';
import 'package:firstforapp/View/Widgets/list-tile/add-user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import '../Widgets/drawer/drawers.dart';
import '../Widgets/list-tile/ListTile.dart';
import '../Widgets/texts/title.dart';

extension Gap on num {
  Widget get vertical => SizedBox(height: toDouble());

  Widget get horizontal => SizedBox(height: toDouble());
}

class HomeScreen extends StatelessWidget with ListStorage {
  HomeScreen({super.key});

  LocalStorage? _storage;

  final homeCtrl = Get.put(HomeController());
  final ctrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Obx(() {
            if (homeCtrl.searching) {
              return TextField(
                autofocus: true,
                onChanged: homeCtrl.searchContact,
                decoration: InputDecoration(
                    hintText: 'Search Contact',
                    suffix: IconButton(
                        onPressed: () {
                          homeCtrl.resetContacts();
                          homeCtrl.searching = false;
                        },
                        icon: const Icon(Icons.close))),
              );
            } else {
              return Titles(title: 'Contact Book');
            }
          }),
          actions: [
            Obx(
                  () =>
                  Visibility(
                    visible: !homeCtrl.searching,
                    child: AppBarButtons(
                      onPressed: () {
                        homeCtrl.contacts.clear();
                        homeCtrl.searching = true;
                      },
                      iconpath: StringConst.search,
                    ),
                  ),
            ),
            Obx(
                  () =>
                  Visibility(
                    visible: !homeCtrl.searching,
                    child: AppBarButtons(
                      onPressed: () =>
                          contactForm(
                            context,
                            onSave: (addcredetial) {
                              homeCtrl.addContacts(addcredetial);
                            },
                          ),
                      iconpath: StringConst.adduser,
                    ),
                  ),
            ),
            Obx(
                  () =>
                  Visibility(
                    visible: !homeCtrl.searching,
                    child: AppBarButtons(
                      onPressed: () => print('Jai Shree Ram'),
                      iconpath: StringConst.threeDots,
                    ),
                  ),
            ),
          ],
        ),
        drawer: Drawers(
          id: ctrl.user!.id,
          name: ctrl.user!.name,
          email: ctrl.user!.email,
          username: ctrl.user!.username,
          heading: 'User Details',
          onTap: () {
            Navigator.pushReplacementNamed(context, StringConst.defaultRoute);
            _storage!.clear();
          },
        ),
        backgroundColor: ColorConst.re_LoBack,
        body: Obx(
              () {
            return GroupedListView<AddCredetial, String>(
              shrinkWrap: true,
              sort: true,
              elements: homeCtrl.contacts.value,
              groupBy: (contact) => contact.firstName[0].toUpperCase(),
              groupSeparatorBuilder: (String groupByValue) =>
                  ListTile(
                    title: Text(groupByValue, style: textStyle.title),
                  ),
              itemBuilder: (context, contact) {
                int index = homeCtrl.contacts.indexOf(contact);
                return LisTile(
                  contact: contact,
                  imgPath: StringConst.addnumber,
                  onTap:() => Get.to(DailScreen(contactName: '${contact.firstName} ${contact.lastName}', contactNumber: contact.number)),
                  onUpdate: () {
                    ctrl.firstNameCtrl.text =
                        homeCtrl.contacts[index].firstName;
                    ctrl.lastNameCtrl.text = homeCtrl.contacts[index].lastName;
                    ctrl.addEmailCtrl.text = homeCtrl.contacts[index].email;
                    ctrl.numberCtrl.text = homeCtrl.contacts[index].number;
                    ctrl.relationCtrl.text = homeCtrl.contacts[index].relation!;
                    ctrl.workCtrl.text = homeCtrl.contacts[index].work!;
                    ctrl.addressCtrl.text = homeCtrl.contacts[index].address!;
                    ctrl.linkCtrl.text = homeCtrl.contacts[index].link!;
                    contactForm(
                      context,
                      onSave: (addcredetial) {
                        addcredetial!.id = homeCtrl.contacts[index].id;
                        homeCtrl.updateContacts(addcredetial).then(
                                (_) => homeCtrl.contacts[index] = addcredetial);
                        ctrl.firstNameCtrl.clear();
                        ctrl.lastNameCtrl.clear();
                        ctrl.numberCtrl.clear();
                        ctrl.addEmailCtrl.clear();
                        ctrl.relationCtrl.clear();
                        ctrl.workCtrl.clear();
                        ctrl.addressCtrl.clear();
                        ctrl.linkCtrl.clear();
                      },
                    );
                  },
                  onDelete: () => homeCtrl.deleteContacts(index: index),
                );
              },
            );
          },
        ));
  }

  void contactForm(BuildContext context,
      {required void Function(AddCredetial? addcredetial) onSave}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) =>
            AddUsers(
                onSave: onSave,
                FirstNameCtrl: ctrl.firstNameCtrl,
                LastNameCtrl: ctrl.lastNameCtrl,
                AddressCtrl: ctrl.addressCtrl,
                EmailCtrl: ctrl.addEmailCtrl,
                InfoCtrl: ctrl.workCtrl,
                LinkCtrl: ctrl.linkCtrl,
                NumberCtrl: ctrl.numberCtrl,
                RelationCtrl: ctrl.relationCtrl));
  }
}
