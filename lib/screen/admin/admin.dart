import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/enum/state_status.dart';
import 'package:frontend/controller/admin_controller.dart';
import 'package:frontend/routes/name.dart';
import 'package:frontend/screen/admin/bloc/admin_bloc.dart';

class AdminPages extends StatefulWidget {
  const AdminPages({super.key});

  @override
  State<AdminPages> createState() => _AdminPagesState();
}

class _AdminPagesState extends State<AdminPages> {
  @override
  void initState() {
    super.initState();
    AdminController(context: context).handleGetAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.AdminDetail);
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        surfaceTintColor: Colors.blue,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          'ແກ້ໄຂຂໍ້ມູນແອັດມີນ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        // physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: buildPhoneTextFrom(
                context: context,
                labelText: 'ຊື່',
                hintText: 'ຄົ້ນຫາ',
                onChanged: (value) {
                  context
                      .read<AdminBloc>()
                      .add(SearchAdminEvent(search: value));
                }),
          ),
          RefreshIndicator(
            color: Colors.blue,
            onRefresh: () => AdminController(context: context).handleGetAdmin(),
            child: BlocBuilder<AdminBloc, AdminState>(
              builder: (context, state) {
                if (state.status == StateStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }

                if (state.adminModel.isEmpty) {
                  return const Center(
                    child: Text('ບໍ່ພົບຂໍ້ມູນ'),
                  );
                }

                return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    // physics: const BouncingScrollPhysics(),
                    itemCount: state.adminModel.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Card(
                          elevation: 2,
                          color: Colors.white,
                          child: ListTile(
                            leading: const Icon(
                              Icons.account_circle_rounded,
                              color: Colors.blue,
                              size: 40,
                            ),
                            title: Text(state.adminModel[index].name ?? ''),
                            subtitle: Text(state.adminModel[index].phone ?? ''),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black26,
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    });
              },
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
  }) {
    return SizedBox(
      height: 60,
      child: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.text,
            maxLines: 1,
            cursorColor: Colors.grey,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
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
    );
  }
}
