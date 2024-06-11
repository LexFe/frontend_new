import 'package:flutter/material.dart';

class RecommentPages extends StatelessWidget {
  const RecommentPages({super.key});

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
          'ແນະນຳ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
       body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
              children: const [
                TextSpan(
                  text: 'ວິທີການປ້ອງກັນໂລກເບົາຫວານ\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: 'ໂລກເບົາຫວານປະເພດ 2 ສ່ວນຫຼາຍສາມາດປ້ອງກັນໄດ້ໂດຍການປ່ຽນແປງວິຖີຊີວິດ ດັ່ງນີ້:\n\n',
                ),
                TextSpan(
                  text: 'ການກິນກິນອາຫານ:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: '- ເລືອກກິນອາຫານທີ່ມີໄຍອາຫານສູງເຊັ່ນ: ຜັກ,ໜາກໄມ້ທີ່ນ້ຳຕານຕ່ຳ , ເຂົ້າກຳເປັນຕົ້ນ\n'
                      '- ກິນອານຫານທີ່ໂປຕີນແລະໄຂ່ມັນຕ່ຳ ເຊັ່ນ: ປາ, ໄກ່, ຖົ່ວ\n'
                      '- ຈຳກັດການບໍລິໂພກໄຂມັນອີ່ມຕົວແລະໄຂມັນທານສ໌\n'
                      '- ຫຼຸດການກິນນໍ້າຕານ, ເກືອ\n'
                      '- ດື່ມນໍ້າສະອາດໃຫ້ພຽງພໍ\n\n',
                ),
                TextSpan(
                  text: 'ການອອກກໍາລັງກາຍ:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: '- ອອກກໍາລັງກາຍຢ່າງສະໜຳສະເໜີ 30 ນາທີ 5 ມື້ຕໍ່ອາທິດ\n'
                      '- ເລືອກກິດຈະກຳທີ່ມັກ ເຊັ່ນ: ຢ່າງ, ແລ່ນ, ລອຍນໍ້າ, ຂີ່ລົດຖີບ\n\n',
                ),
                TextSpan(
                  text: 'ການຄວບຄຸມນ້ຳໜັກ:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: '- ຮັກສານ້ຳໜັກໂຕໃຫ້ຢູ່ໃນເກນມາດຕະຖານ\n'
                      '- ຫຼຸດນ້ຳໜັກຖ້ານ້ຳໜັກເກີນ\n\n',
                ),
                TextSpan(
                  text: 'ການຈັດການຄວາມກົດດັນ:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: '- ຫາວິທີຜ່ອນຄາຍຄວາມກົດດັນ ເຊັ່ນ: ໂຍຄະ, ນັ່ງສະມາທິ, ຟັງດົນຕີ\n\n',
                ),
                TextSpan(
                  text: 'ການງົດສູບຢາ:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: '- ການສູບຢາເພີ່ມຄວາມສ່ຽງຕໍ່ການເປັນໂລກເບົາຫວານ\n'
                      '- ຄວນເລີກສູບຢາຢ່າງເດັດຂາດ\n\n',
                ),
                TextSpan(
                  text: 'ການກວດສຸກພາບ:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: '- ກວດສຸກພາບຢ່າງສະໜຳສະເໜີໃນທຸກປີ\n'
                      '- ກວດວັດລະດັບນໍ້າຕານໃນເລືອດ\n'
                      '- ກວດວັດຄວາມດັນເລືອດ\n'
                      '- ກວດເລືອດໄຂມັນ\n\n',
                ),
                TextSpan(
                  text: 'ກຸ່ມຄົນທີ່ມີຄວາມສ່ຽງ:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: '- ຄົນທີ່ມີປະຫວັດຄອບຄົວເປັນໂລກເບົາຫວານ\n'
                      '- ຄົນທີ່ມີນ້ຳໜັກເກີນຫຼືອ່ວນ\n'
                      '- ຄົນທີ່ມີຄວາມດັນເລືອດສູງ\n'
                      '- ຄົນທີ່ມີຄວາມໄຂມັນ HDL ຕ່ຳ\n'
                ),
              ],
            ),
          ),
        ),
    );
  }
}
