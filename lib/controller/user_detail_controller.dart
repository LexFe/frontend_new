import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/utils/http_utils.dart';
import 'package:frontend/controller/user_controller.dart';
import 'package:frontend/screen/admin_detail/bloc/admin_detail_bloc.dart';
import 'package:frontend/screen/user_detail/bloc/user_detail_bloc.dart';

class UserDetailController {
  final BuildContext context;
  const UserDetailController({required this.context});

  Future<void> handleAddUser() async {
    final state = context.read<UserDetailBloc>().state;
    String name = state.name.toString();
    String age = state.age.toString();
    String pregnancies = state.pregnancies.toString();
    String glucose = state.glucose.toString();
    String bloodPressure = state.bloodPressure.toString();
    String skinThickness = state.skinThickness.toString();
    String insulin = state.insulin.toString();
    String bmi = state.bmi.toString();
    String diabetesPedigreeFunction = state.diabetesPedigreeFunction.toString();

    if (name.isEmpty ||
        age.isEmpty ||
        pregnancies.isEmpty ||
        glucose.isEmpty ||
        bloodPressure.isEmpty ||
        skinThickness.isEmpty ||
        insulin.isEmpty ||
        bmi.isEmpty ||
        diabetesPedigreeFunction.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ກະລູນາຕື່ມຂໍ້ມູນໃຫ້ຄົບກ່ອນການບັນທຶກ'),
        ),
      );
      return;
    } else {
      try {
        Response response =
            await HttpUtil().post('/predict/add-data-predict', data: {
          "name": name,
          "age": age,
          "pregnancies": pregnancies,
          "glucose": glucose,
          "bloodPressure": bloodPressure,
          "skinthickness": skinThickness,
          "insulin": insulin,
          "diabetespedigreefunction": diabetesPedigreeFunction,
          "bmi": bmi
        });
        if (response.statusCode == 200) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('ບັນທຶກສຳເລັດ'),
              ),
            );
            UserController(context: context).handleGetUser();
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

  Future<void> handleUpdateUser({required String id}) async {
    final state = context.read<UserDetailBloc>().state;
    String name = state.name.toString();
    String age = state.age.toString();
    String pregnancies = state.pregnancies.toString();
    String glucose = state.glucose.toString();
    String bloodPressure = state.bloodPressure.toString();
    String skinThickness = state.skinThickness.toString();
    String insulin = state.insulin.toString();
    String bmi = state.bmi.toString();
    String diabetesPedigreeFunction = state.diabetesPedigreeFunction.toString();
    if (name.isEmpty ||
        age.isEmpty ||
        pregnancies.isEmpty ||
        glucose.isEmpty ||
        bloodPressure.isEmpty ||
        skinThickness.isEmpty ||
        insulin.isEmpty ||
        bmi.isEmpty ||
        diabetesPedigreeFunction.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ກະລູນາຕື່ມຂໍ້ມູນໃຫ້ຄົບກ່ອນການບັນທຶກ'),
        ),
      );
      return;
    } else {
      try {
        Response response =
            await HttpUtil().put('/predict/update-data-predict', data: {
          "id": id,
          "name": name,
          "age": age,
          "pregnancies": pregnancies,
          "glucose": glucose,
          "bloodPressure": bloodPressure,
          "skinthickness": skinThickness,
          "insulin": insulin,
          "diabetespedigreefunction": diabetesPedigreeFunction,
          "bmi": bmi,
        });
        if (response.statusCode == 200) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('ແກ້ໄຂສຳເລັດ'),
              ),
            );
            UserController(context: context).handleGetUser();
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
