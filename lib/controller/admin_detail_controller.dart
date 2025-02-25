import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/utils/http_utils.dart';
import 'package:frontend/controller/admin_controller.dart';
import 'package:frontend/screen/admin_detail/bloc/admin_detail_bloc.dart';

class AdminDetailController {
  final BuildContext context;
  const AdminDetailController({required this.context});

  Future<void> handleAddAdmin() async {
    final state = context.read<AdminDetailBloc>().state;
    String name = state.name.toString();
    String phone = state.phone.toString();
    String email = state.email.toString();
    String password = state.password.toString();
    if (name.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ກະລູນາຕື່ມຂໍ້ມູນໃຫ້ຄົບກ່ອນການບັນທຶກ'),
        ),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ລະຫັດຜ່ານຕ້ອງມີຢ່າງຢ່າງ 6 ໂຕອັກສອນ'),
        ),
      );
      return;
    }

    if (email.contains('.com') == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ອີເມວບໍ່ຖືກຕ້ອງ'),
        ),
      );
      return;
    }

    if (email.contains('@') == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ອີເມວບໍ່ຖືກຕ້ອງ'),
        ),
      );
      return;
    } else {
      try {
        Response response = await HttpUtil().post('/user/create-user', data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
        });
        if (response.statusCode == 200) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('ບັນທຶກສຳເລັດ'),
              ),
            );
            AdminController(context: context).handleGetAdmin();
            Navigator.pop(context);
            context.read<AdminDetailBloc>().add(const ResetState());
          }
        } else {
          debugPrint(response.data);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data),
            ),
          );
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> handleUpdateAdmin({required String id}) async {
    print(id);
    final state = context.read<AdminDetailBloc>().state;
    String name = state.name.toString();
    String phone = state.phone.toString();
    String email = state.email.toString();
    String password = state.password.toString();
    if (name.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ກະລູນາຕື່ມຂໍ້ມູນໃຫ້ຄົບກ່ອນການບັນທຶກ'),
        ),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ລະຫັດຜ່ານຕ້ອງມີຢ່າງຢ່າງ 6 ໂຕອັກສອນ'),
        ),
      );
      return;
    }

    if (email.contains('.com') == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ອີເມວບໍ່ຖືກຕ້ອງ'),
        ),
      );
      return;
    }

    if (email.contains('@') == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ອີເມວບໍ່ຖືກຕ້ອງ'),
        ),
      );
      return;
    } else {
      try {
        Response response = await HttpUtil().put('/user/update', data: {
          "id": id,
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
        });
        if (response.statusCode == 200) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('ແກ້ໄຂສຳເລັດ'),
              ),
            );
            AdminController(context: context).handleGetAdmin();
            Navigator.pop(context);
            context.read<AdminDetailBloc>().add(const ResetState());
          }
        } else {
          debugPrint(response.data);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data),
            ),
          );
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}   // Path: lib/controller/admin_controller.dart 
