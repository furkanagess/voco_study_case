import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voco_study_case/feature/controller/participant_provider.dart';
import 'package:voco_study_case/product/constants/app_colors.dart';
import 'package:voco_study_case/product/constants/app_strings.dart';
import 'package:voco_study_case/product/extension/context_extension.dart';
import 'package:voco_study_case/product/widgets/app_scaffold.dart';
import 'package:voco_study_case/product/widgets/logout_button.dart';

class ParticipantListPage extends StatelessWidget {
  const ParticipantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final participantController = Provider.of<ParticipantController>(context);

    return AppScaffold(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            AppStrings.participantList,
          ),
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: ParticipantList(
                    participantController: participantController),
              ),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ParticipantList extends StatelessWidget {
  const ParticipantList({
    super.key,
    required this.participantController,
  });

  final ParticipantController participantController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: participantController.participants.length,
      itemBuilder: (context, index) {
        final participant = participantController.participants[index];
        return Card(
          elevation: 5,
          color: AppColors.darkWhite,
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(participant.avatar),
            ),
            title: Text(
              '${participant.firstName} ${participant.lastName}',
              style: context.textTheme.titleSmall?.copyWith(
                color: AppColors.background,
              ),
            ),
            subtitle: Text(
              participant.email,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: AppColors.background),
            ),
          ),
        );
      },
    );
  }
}
