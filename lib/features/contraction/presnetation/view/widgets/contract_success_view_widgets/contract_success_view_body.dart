import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/constants/methods.dart';
import '../../../../../../core/theming/my_colors.dart';

class ContractSuccessViewBody extends StatefulWidget {
  const ContractSuccessViewBody({super.key});

  @override
  State<ContractSuccessViewBody> createState() =>
      _ContractSuccessViewBodyState();
}

class _ContractSuccessViewBodyState extends State<ContractSuccessViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.check_mark_circled,
                color: MyColors.kPrimaryColor,
                size: 150,
              ),
              Text(
                'تم تسجيل التعاقد بنجاح',
                style: MyTextStyles.font20Weight700
                    .copyWith(color: MyColors.kPrimaryColor),
              ),
              const VerticalSpacer(13),
              Text(
                "رقم العقد 8258745HIJH",
                style: MyTextStyles.font16Weight600
                    .copyWith(color: MyColors.kPrimaryColor),
              ),
              const VerticalSpacer(15),
              Text(
                ' قيمة العقد ‏9,800.00 ريال',
                style: MyTextStyles.font20Weight700
                    .copyWith(color: MyColors.kPrimaryColor),
              ),
              const VerticalSpacer(16),
               WalletBalanceCard(),
              const VerticalSpacer(37),
              SizedBox(
                child: CustomButton(
                  textStyle: MyTextStyles.font18Weight500
                      .copyWith(color: Colors.white),
                  text: 'ادفع ‏9,800.00 لتفعيل التعاقد',
                  backGroundColor: MyColors.kPrimaryColor,
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const VerticalSpacer(16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'ملاحظة: لديك ساعة واحدة فقط للدفع\n',
                      style: MyTextStyles.font16Weight700.copyWith(
                        color: MyColors.kGreenColor,
                      ),
                    ),
                    TextSpan(
                        text: 'عملية إلغاء العقد تتم بشكل تلقائي,',
                        style: MyTextStyles.font16Weight700
                            .copyWith(color: MyColors.kPrimaryColor))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletBalanceCard extends StatelessWidget {
   TextEditingController walletController= TextEditingController();
   WalletBalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 55.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: getWidth(context) * 0.35,
            child: Text(
              'لديك رصيد محفظة\n60 ريال يمكنك استخدامها',
              style: MyTextStyles.font12Weight500,
            ),
          ),
          const HorizontalSpacer(16),
          Pinput(
            length: 1,
            mainAxisAlignment: MainAxisAlignment.center,
            controller: walletController,
            onChanged: (v){
              walletController.text=v;
            },
            defaultPinTheme: PinTheme(
              width: 50.w,
              height: 32.h,
              textStyle: MyTextStyles.font12Weight500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 66.w,
            child: CustomButton(
              textStyle:
                  MyTextStyles.font12Weight500.copyWith(color: Colors.white),
              text: 'استبدال',
              backGroundColor: MyColors.kPrimaryColor,
              onPressed: () {},
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
