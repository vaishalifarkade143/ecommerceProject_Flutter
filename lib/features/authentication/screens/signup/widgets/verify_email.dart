// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class VerifyEmailScreen extends StatefulWidget {
//   const VerifyEmailScreen({super.key});

//   @override
//   State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
// }

// class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

//   final user = FirebaseAuth.instance.currentUser;

//   @override
//   void initState() {
//     super.initState();
//     sendVerificationEmail();
//   }

//   /// Send verification email
//   Future<void> sendVerificationEmail() async {
//     await user?.sendEmailVerification();
//   }

//   /// Check verification
//   Future<void> checkEmailVerified() async {
//     await user?.reload();
//     final updatedUser = FirebaseAuth.instance.currentUser;

//     if (updatedUser!.emailVerified) {
//       Get.snackbar("Success", "Email verified successfully");

//       // Navigate to Home Screen
//       // Get.offAll(() => const NavigationMenu());

//     } else {
//       Get.snackbar("Not Verified", "Please verify your email first");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Verify Email"),
//         centerTitle: true,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(20),

//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [

//             const Icon(
//               Icons.email_outlined,
//               size: 120,
//               color: Colors.blue,
//             ),

//             const SizedBox(height: 30),

//             const Text(
//               "Verify your email address",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 10),

//             Text(
//               user?.email ?? "",
//               style: const TextStyle(fontSize: 16),
//             ),

//             const SizedBox(height: 30),

//             const Text(
//               "We have sent a verification email to your inbox. Please verify your email to continue.",
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 40),

//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: checkEmailVerified,
//                 child: const Text("I have verified"),
//               ),
//             ),

//             const SizedBox(height: 15),

//             TextButton(
//               onPressed: sendVerificationEmail,
//               child: const Text("Resend Email"),
//             )

//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:ecommerseproject/features/authentication/screens/login/login.dart';
import 'package:ecommerseproject/utils/constants/sizes.dart';
import 'package:ecommerseproject/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                Icons.email_outlined,
                size: 120,
                color: Colors.blue,
              ),

              SizedBox(height: TSizes.spaceBtwSections),

              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: TSizes.spaceBtwItems),

              Text(
                 TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
      ),
    );
  }
}