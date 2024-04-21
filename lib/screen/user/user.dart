import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/enum/state_status.dart';
import 'package:frontend/controller/user_controller.dart';
import 'package:frontend/routes/name.dart';
import 'package:frontend/screen/user/bloc/user_bloc.dart';

class UserPages extends StatefulWidget {
  const UserPages({super.key});

  @override
  State<UserPages> createState() => _UserPagesState();
}

class _UserPagesState extends State<UserPages> {
  @override
  void initState() {
    super.initState();

    UserController(context: context).handleGetUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.UserDeetail);
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
          'ແກ້ໄຂຂໍ້ມູນລູກຄ້າ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.blue,
        onRefresh: () => UserController(context: context).handleGetUser(),
        child: ListView(
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
                    context.read<UserBloc>().add(SearchUser(search: value));
                  }),
            ),
            RefreshIndicator(
              color: Colors.blue,
              onRefresh: () => UserController(context: context).handleGetUser(),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state.status == StateStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }

                  if (state.userModels.isEmpty) {
                    return const Center(
                      child: Text('ບໍ່ພົບຂໍ້ມູນ'),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.userModels.length,
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
                            title: Text(state.userModels[index].name ?? ''),
                            subtitle:
                                Text(state.userModels[index].age.toString()),
                            trailing: PopupMenuButton<int>(
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 1,
                                  child: Text("ແກ້ໄຂ"),
                                ),
                                const PopupMenuItem(
                                  value: 2,
                                  child: Text("ລົບ"),
                                ),
                              ],
                              onSelected: (value) {
                                if (value == 1) {
                                  UserController(context: context)
                                      .onclickEditAdmin(
                                          userModel: state.userModels[index]);
                                } else if (value == 2) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('ລົບຂໍ້ມູນ'),
                                        content: const Text(
                                            'ທ່ານຕ້ອງການລົບຂໍ້ມູນນີ້ບໍ?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('ຍົກເລີກ'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              UserController(context: context)
                                                  .handleDeleteUser(
                                                id: state
                                                        .userModels[index].id ??
                                                    0,
                                              );
                                            },
                                            child: const Text('ຢືນຢັນ'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.black87,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
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
      child: BlocBuilder<UserBloc, UserState>(
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
