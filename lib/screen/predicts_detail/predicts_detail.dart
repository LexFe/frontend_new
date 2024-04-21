import 'package:flutter/material.dart';
import 'package:frontend/model/predicts_model.dart';

class PredictDetailPages extends StatefulWidget {
  const PredictDetailPages({super.key});

  @override
  State<PredictDetailPages> createState() => _PredictDetailPagesState();
}

class _PredictDetailPagesState extends State<PredictDetailPages> {
  late final PredictsModel predictsModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    predictsModel = ModalRoute.of(context)!.settings.arguments as PredictsModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        surfaceTintColor: Colors.blue,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          'ລາຍລະອຽດ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ຊື່: ${predictsModel.name}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'ອາຍຸ: ${predictsModel.age}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'ຈຳນວນຖືພາ: ${predictsModel.pregnancies}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'ຄ່ານ້ຳຕານ: ${predictsModel.glucose}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'ຄວາມ​ດັນ​ເລືອດ: ${predictsModel.bloodPressure}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'ຄວາມໜາຂອງຜິວໜັງ: ${predictsModel.skinthickness}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'ຄ່າອີນຊູລິນ: ${predictsModel.insulin}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'ຄວາມສ່ຽງຈາກກຳມະພັນ: ${predictsModel.diabetespedigreefunction}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'bmi: ${predictsModel.bmi}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
