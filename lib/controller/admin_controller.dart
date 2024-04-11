import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/enum/state_status.dart';
import 'package:frontend/common/utils/http_utils.dart';
import 'package:frontend/model/admin_model.dart';
import 'package:frontend/screen/admin/bloc/admin_bloc.dart';

class AdminController {
  final BuildContext context;
  const AdminController({required this.context});

  Future<void> handleGetAdmin() async {
    try {
      context
          .read<AdminBloc>()
          .add(const ChangeStatusEvent(status: StateStatus.loading));
      Response response = await HttpUtil().get('/user/all');
      if (response.statusCode == 200) {
        List data = response.data as List;
        List<AdminModel> adminModel =
            data.map((e) => AdminModel.fromJson(e)).toList();

        if (context.mounted) {
          context.read<AdminBloc>().add(GetAdminEvent(adminModel: adminModel));
          context
              .read<AdminBloc>()
              .add(const ChangeStatusEvent(status: StateStatus.loaded));
        }
      } else {
        debugPrint(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}   // Path: lib/controller/admin_controller.dart 
