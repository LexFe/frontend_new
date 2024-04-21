import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/controller/user_detail_controller.dart';
import 'package:frontend/screen/user_detail/bloc/user_detail_bloc.dart';

import '../../model/user_model.dart';

class UserDetailPages extends StatefulWidget {
  const UserDetailPages({super.key});

  @override
  State<UserDetailPages> createState() => _UserDetailPagesState();
}

class _UserDetailPagesState extends State<UserDetailPages> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController pregnanciesController = TextEditingController();
  final TextEditingController glucoseController = TextEditingController();
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController skinThicknessController = TextEditingController();
  final TextEditingController insulinController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController diabetesPedigreeFunctionController =
      TextEditingController();
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is UserModel) {
      userModel = arguments;
      context.read<UserDetailBloc>().add(ChangeName(name: userModel!.name!));
      context.read<UserDetailBloc>().add(ChangeAge(age: userModel!.age!));
      context
          .read<UserDetailBloc>()
          .add(ChangePregnancies(pregnancies: userModel!.pregnancies!));
      context
          .read<UserDetailBloc>()
          .add(ChangeGlucose(glucose: userModel!.glucose!));
      context
          .read<UserDetailBloc>()
          .add(ChangeBloodPressure(bloodPressure: userModel!.bloodPressure!));
      context
          .read<UserDetailBloc>()
          .add(ChangeSkinThickness(skinThickness: userModel!.skinthickness!));
      context
          .read<UserDetailBloc>()
          .add(ChangeInsulin(insulin: userModel!.insulin!));
      context.read<UserDetailBloc>().add(ChangeBmi(bmi: userModel!.bmi!));
      context.read<UserDetailBloc>().add(ChangeDiabetesPedigreeFunction(
          diabetesPedigreeFunction: userModel!.diabetespedigreefunction!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        surfaceTintColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'ບັນທືກຂໍ້ມູນລູກຄ້າ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(
            height: 10,
          ),
          GridView.count(
            padding: const EdgeInsets.all(15),
            physics: const BouncingScrollPhysics(),
            mainAxisSpacing: 15,
            shrinkWrap: true,
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            childAspectRatio: 1.8,
            children: [
              buildPhoneTextFrom(
                  context: context,
                  controller: nameController.value.text.isEmpty
                      ? TextEditingController(text: userModel?.name)
                      : nameController,
                  labelText: 'ຊື່',
                  hintText: 'ຊື່',
                  onChanged: (value) {
                    context.read<UserDetailBloc>().add(
                          ChangeName(name: value),
                        );
                  }),
              buildPhoneTextFrom(
                context: context,
                controller: ageController.value.text.isEmpty
                    ? TextEditingController(text: userModel?.age.toString())
                    : ageController,
                labelText: 'ອາຍຸ',
                hintText: 'ອາຍຸ',
                onChanged: (value) {
                  context.read<UserDetailBloc>().add(
                        ChangeAge(age: int.tryParse(value) ?? 0),
                      );
                },
              ),
              buildPhoneTextFrom(
                context: context,
                controller: pregnanciesController.value.text.isEmpty
                    ? TextEditingController(
                        text: userModel?.pregnancies.toString())
                    : pregnanciesController,
                labelText: 'pregnancies',
                hintText: 'pregnancies',
                onChanged: (value) {
                  context.read<UserDetailBloc>().add(
                        ChangePregnancies(
                            pregnancies: int.tryParse(value) ?? 0),
                      );
                },
              ),

              buildPhoneTextFrom(
                context: context,
                controller: glucoseController.value.text.isEmpty
                    ? TextEditingController(text: userModel?.glucose.toString())
                    : glucoseController,
                labelText: 'glucose',
                hintText: 'glucose',
                onChanged: (value) {
                  context.read<UserDetailBloc>().add(
                        ChangeGlucose(glucose: int.tryParse(value) ?? 0),
                      );
                },
              ),

              buildPhoneTextFrom(
                context: context,
                controller: bloodPressureController.value.text.isEmpty
                    ? TextEditingController(
                        text: userModel?.bloodPressure.toString())
                    : bloodPressureController,
                labelText: 'bloodPressure',
                hintText: 'bloodPressure',
                onChanged: (value) {
                  context.read<UserDetailBloc>().add(
                        ChangeBloodPressure(
                            bloodPressure: int.tryParse(value) ?? 0),
                      );
                },
              ),

              buildPhoneTextFrom(
                context: context,
                controller: skinThicknessController.value.text.isEmpty
                    ? TextEditingController(
                        text: userModel?.skinthickness.toString())
                    : skinThicknessController,
                labelText: 'skinThickness',
                hintText: 'skinThickness',
                onChanged: (value) {
                  context.read<UserDetailBloc>().add(
                        ChangeSkinThickness(
                            skinThickness: int.tryParse(value) ?? 0),
                      );
                },
              ),

              buildPhoneTextFrom(
                context: context,
                controller: insulinController.value.text.isEmpty
                    ? TextEditingController(text: userModel?.insulin.toString())
                    : insulinController,
                labelText: 'insulin',
                hintText: 'insulin',
                onChanged: (value) {
                  context.read<UserDetailBloc>().add(
                        ChangeInsulin(insulin: int.tryParse(value) ?? 0),
                      );
                },
              ),

              buildPhoneTextFrom(
                context: context,
                controller: bmiController.value.text.isEmpty
                    ? TextEditingController(text: userModel?.bmi.toString())
                    : bmiController,
                labelText: 'bmi',
                hintText: 'bmi',
                onChanged: (value) {
                  context.read<UserDetailBloc>().add(
                        ChangeBmi(bmi: double.tryParse(value) ?? 0),
                      );
                },
              ),

              buildPhoneTextFrom(
                context: context,
                controller: diabetesPedigreeFunctionController
                        .value.text.isEmpty
                    ? TextEditingController(
                        text: userModel?.diabetespedigreefunction.toString())
                    : diabetesPedigreeFunctionController,
                labelText: 'diabetes',
                hintText: 'diabetes',
                onChanged: (value) {
                  context.read<UserDetailBloc>().add(
                        ChangeDiabetesPedigreeFunction(
                            diabetesPedigreeFunction:
                                double.tryParse(value) ?? 0),
                      );
                },
              ),

              // buildPhoneTextFrom(
              //   context: context,
              //   controller: passwordController,
              //   labelText: 'ລະຫັດຜ່ານ',
              //   hintText: 'ລະຫັດຜ່ານ',
              //   onChanged: (value) {
              //     context.read<AdminDetailBloc>().add(
              //           ChangePassword(password: value),
              //         );
              //   },
              // ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  if (userModel?.id != null) {
                    UserDetailController(context: context)
                        .handleUpdateUser(id: userModel!.id.toString());
                  } else {
                    UserDetailController(context: context).handleAddUser();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  userModel?.id == null ? 'ບັນທຶກ' : 'ແກ້ໄຂ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPhoneTextFrom({
    required BuildContext context,
    required String hintText,
    required String labelText,
    required Function(String) onChanged,
    required TextEditingController? controller,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 60,
          child: BlocBuilder<UserDetailBloc, UserDetailState>(
            builder: (context, state) {
              return TextFormField(
                // controller: TextEditingController.fromValue(
                //   TextEditingValue(
                //     text: state.age.toString(),
                //     selection: TextSelection.collapsed(
                //       offset: state.age.toString().isEmpty
                //           ? 0
                //           : state.age.toString().length,
                //     ),
                //   ),
                // ),

                controller: controller,

                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                maxLines: 1,
                cursorColor: Colors.grey,
                onChanged: onChanged,
                decoration: InputDecoration(
                  prefixIconColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.focused)
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
