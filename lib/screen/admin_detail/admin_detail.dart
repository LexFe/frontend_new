import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/controller/admin_detail_controller.dart';
import 'package:frontend/model/admin_model.dart';
import 'package:frontend/screen/admin_detail/bloc/admin_detail_bloc.dart';

class AdminDetailPages extends StatefulWidget {
  const AdminDetailPages({super.key});

  @override
  State<AdminDetailPages> createState() => _AdminDetailPagesState();
}

class _AdminDetailPagesState extends State<AdminDetailPages> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AdminModel? adminModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is AdminModel) {
      adminModel = arguments;
      context
          .read<AdminDetailBloc>()
          .add(ChangeEmail(email: adminModel!.email!));
      context.read<AdminDetailBloc>().add(ChangeName(name: adminModel!.name!));
      context
          .read<AdminDetailBloc>()
          .add(ChangePhone(phone: adminModel!.phone!));
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
          'ບັນທືກຂໍ້ມູນແອັດມິນ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
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
                      ? TextEditingController(text: adminModel?.name ?? '')
                      : nameController,
                  labelText: 'ຊື່',
                  hintText: 'ຊື່',
                  onChanged: (value) {
                    context.read<AdminDetailBloc>().add(
                          ChangeName(name: value),
                        );
                  }),
              buildPhoneTextFrom(
                context: context,
                controller: phoneController.value.text.isEmpty
                    ? TextEditingController(text: adminModel?.phone ?? '')
                    : phoneController,
                labelText: 'ເບີໂທ',
                hintText: 'ເບີໂທ',
                onChanged: (value) {
                  context.read<AdminDetailBloc>().add(
                        ChangePhone(phone: value),
                      );
                },
              ),
              buildPhoneTextFrom(
                context: context,
                controller: emailController.value.text.isEmpty
                    ? TextEditingController(text: adminModel?.email ?? '')
                    : emailController,
                labelText: 'ອີເມວ',
                hintText: 'ອີເມວ',
                onChanged: (value) {
                  context.read<AdminDetailBloc>().add(
                        ChangeEmail(email: value),
                      );
                },
              ),
              buildPhoneTextFrom(
                context: context,
                controller: passwordController,
                labelText: 'ລະຫັດຜ່ານ',
                hintText: 'ລະຫັດຜ່ານ',
                onChanged: (value) {
                  context.read<AdminDetailBloc>().add(
                        ChangePassword(password: value),
                      );
                },
              ),
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
                  if (adminModel?.id != null) {
                    AdminDetailController(context: context)
                        .handleUpdateAdmin(id: adminModel!.id.toString());
                  } else {
                    AdminDetailController(context: context).handleAddAdmin();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  adminModel?.id == null ? 'ບັນທຶກ' : 'ປ່ຽນແກ້ໄຂ',
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
          child: BlocBuilder<AdminDetailBloc, AdminDetailState>(
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
