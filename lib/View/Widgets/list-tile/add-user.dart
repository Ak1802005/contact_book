import 'package:firstforapp/Model/addCredential.dart';
import 'package:firstforapp/Model/list-storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/strings.dart';
import '../../../Controller/AuthController/auth-controller.dart';
import '../../../Model/credential.dart';
import '../buttons/custom-btn2.dart';
import '../inputs/IconInput.dart';
import '../texts/title.dart';

extension Gap on num {
  Widget get vertical => SizedBox(height: toDouble());

  Widget get horizontal => SizedBox(height: toDouble());
}

class AddUsers extends StatelessWidget with ListStorage {
  AddUsers(
      {super.key, required this.onSave, required this.FirstNameCtrl, required this.LastNameCtrl, required this.AddressCtrl, required this.EmailCtrl, required this.InfoCtrl, required this.LinkCtrl, required this.NumberCtrl, required this.RelationCtrl});

  final void Function(AddCredetial? addcredetial) onSave;
  final TextEditingController FirstNameCtrl;
  final TextEditingController LastNameCtrl;
  final TextEditingController NumberCtrl;
  final TextEditingController EmailCtrl;
  final TextEditingController RelationCtrl;
  final TextEditingController InfoCtrl;
  final TextEditingController AddressCtrl;
  final TextEditingController LinkCtrl;


  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<AuthController>();
    var keyboardHeight = MediaQuery
        .of(context)
        .viewInsets
        .bottom;

    return SingleChildScrollView(
      primary: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15 + keyboardHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Titles(title: 'Add Contact')),
            Gap(30).vertical,
            IconInput(
                icons: StringConst.nameUser,
                labelText: 'First name',
                controller: FirstNameCtrl),
            Gap(10).vertical,
            IconInput(
                icons: StringConst.nameUser,
                labelText: 'Last name',
                controller: LastNameCtrl),
            Gap(10).vertical,
            IconInput(
                icons: StringConst.addnumber,
                labelText: 'Phone number',
                controller: NumberCtrl),
            Gap(10).vertical,
            IconInput(
                icons: StringConst.addEmail,
                labelText: 'E-mail',
                controller: EmailCtrl),
            Gap(10).vertical,
            IconInput(
                icons: StringConst.addrelation,
                labelText: 'Relational info',
                controller: RelationCtrl),
            Gap(10).vertical,
            IconInput(
                icons: StringConst.addinfo,
                labelText: 'Work info',
                controller: InfoCtrl),
            Gap(10).vertical,
            IconInput(
                icons: StringConst.addlocation,
                labelText: 'Address',
                controller: AddressCtrl),
            Gap(10).vertical,
            IconInput(
                icons: StringConst.addlinks,
                labelText: 'Links',
                controller: LinkCtrl),
            Gap(10).vertical,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                    text: 'Cancel', onPressed: () => print('Do not Saved')),
                CustomButton(
                  text: 'Save',
                  onPressed: () {
                    AddCredetial contact = AddCredetial(
                        firstName: FirstNameCtrl.text.trim(),
                        lastName: LastNameCtrl.text.trim(),
                        number: NumberCtrl.text.trim(),
                        email: EmailCtrl.text.trim(),
                        address: AddressCtrl.text.trim(),
                        link: LinkCtrl.text.trim(),
                        relation: RelationCtrl.text.trim(),
                        work: InfoCtrl.text.trim());
                    onSave(contact);
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
