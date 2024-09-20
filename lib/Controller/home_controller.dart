

import 'package:firstforapp/Controller/AuthController/auth-controller.dart';
import 'package:firstforapp/Controller/Database/database-controller.dart';
import 'package:firstforapp/Model/addCredential.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<AddCredetial> contacts = <AddCredetial>[].obs;
  final RxList<AddCredetial> _dupContacts = <AddCredetial>[].obs;
  final authCtrl = Get.find<AuthController>();
  final RxBool _searching = false.obs;

  bool get searching => _searching.value;

  set searching(bool value) {
    _searching.value = value;
  }

  @override
  void onInit() {
    viewContact();
    super.onInit();
  }

  Future<void> addContacts(AddCredetial? addCredetial) async {
    if (addCredetial != null) {
      DatabaseController contactDatabase =
      await DatabaseController.createDatabase();
      contactDatabase.addContact(
          addCredetial: addCredetial, userId: authCtrl.user!.id);
      contacts.add(addCredetial);
      _dupContacts.add(addCredetial);
    }
  }

  Future<void> viewContact() async {
    DatabaseController contactDatabase =
    await DatabaseController.createDatabase();
    var contactsJson = await contactDatabase.viewContacts(authCtrl.user!.id!);
    contacts.value = contactsJson
        .map((contact) => AddCredetial.fromJson(contact.toMap()))
        .toList();
    _dupContacts.addAll(contacts);
  }

  Future<void> updateContacts(AddCredetial addCredetial) async {
    DatabaseController contactDatabase =
    await DatabaseController.createDatabase();
    contactDatabase.updateContacts(addCredetial);
  }

  Future<void> deleteContacts({required int index}) async {
    DatabaseController contactDatabase =
    await DatabaseController.createDatabase();
    contactDatabase.deleteContacts(contacts[index].id).then((_) {
      contacts.removeAt(index);
      _dupContacts.removeAt(index);
    });
  }

  void searchContact(String value) {
    contacts.clear();
    if (value.isNotEmpty) {
      contacts.addAll(_dupContacts.where(
            (contact) {
          return contact.firstName.toLowerCase().contains(value.toLowerCase()) ||
          contact.lastName.toLowerCase().contains(value.toLowerCase()) ||
          contact.number.contains(value);
        },
      ));
    }
  }

  void resetContacts() {
    contacts.addAll(_dupContacts);
  }
}
