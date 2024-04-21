import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/enum/state_status.dart';
import 'package:frontend/common/utils/http_utils.dart';
import 'package:frontend/model/admin_model.dart';
import 'package:frontend/model/user_model.dart';
import 'package:frontend/routes/name.dart';
import 'package:frontend/screen/user/bloc/user_bloc.dart';

class UserController {
  final BuildContext context;
  const UserController({required this.context});

  Future<void> handleGetUser() async {
    try {
      context
          .read<UserBloc>()
          .add(const ChangeStatusEvent(status: StateStatus.loading));
      Response response = await HttpUtil().get('/predict/add-get-predict');
      if (response.statusCode == 200) {
        List data = response.data as List;
        List<UserModel> userModel =
            data.map((e) => UserModel.fromJson(e)).toList();

        if (context.mounted) {
          context.read<UserBloc>().add(GetUser(userModels: userModel));

          context
              .read<UserBloc>()
              .add(const ChangeStatusEvent(status: StateStatus.loaded));
        }
      } else {
        debugPrint(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> onclickEditAdmin({required AdminModel adminModel}) async {
    Navigator.pushNamed(context, AppRoutes.AdminDetail, arguments: adminModel);
  }

  Future<void> handleDeleteUser({required int id}) async {
  try {
    print(id);
    // Make sure HttpUtil().delete method returns a Response object
    Response response = await HttpUtil().delete('/predict/delete-data-predict?id=$id');

    if (response.statusCode == 200) {
      // Assuming the API returns a JSON response
      Map<String, dynamic> responseData = response.data; // Parse the response data

      // Handle responseData based on expected structure
      // For example, check if responseData contains success message or other data

      handleGetUser(); // Consider what this function does

      Navigator.pop(context); // Close the current screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ສຳເລັດການລົບຂໍ້ມູນ'),
        ),
      );
    } else {
      // Handle other status codes (e.g., show error message)
      debugPrint('Error: ${response.statusCode} - ${response.data}');
    }
  } catch (e) {
    debugPrint('Error: $e'); // Log any unexpected errors
  }
}

}   // Path: lib/controller/admin_controller.dart 
