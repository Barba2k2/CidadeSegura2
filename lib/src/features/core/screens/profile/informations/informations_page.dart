import 'package:cidade_segura2/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tPrivacyPolice,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                tPrivacyPoliceMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tCollectedInfoTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tCollectedInfoMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tInformationsUsesTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tInformationsUsesMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tWhenShareTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tWhenShareMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tSecurityTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tSecurityMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tKidsTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tKidsMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tChangesPrivacyTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tChangesPrivacyMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tInfoTranferTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tInfoTranferMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tThirdServicesTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tThirdServicesMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      tPersonalInfoChangesTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tPersonalInfoChangesMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tYourRightsTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tYourRightsMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tInfoTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tInfoMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    tContactUsTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                tContactUsMain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
