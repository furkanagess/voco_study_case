import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voco_study_case/feature/controller/participant_provider.dart';

class ParticipantListPage extends StatelessWidget {
  const ParticipantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final participantProvider = Provider.of<ParticipantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Participant List'),
      ),
      body: ListView.builder(
        itemCount: participantProvider.participants.length,
        itemBuilder: (context, index) {
          final participant = participantProvider.participants[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(participant.avatar),
            ),
            title: Text('${participant.firstName} ${participant.lastName}'),
            subtitle: Text(participant.email),
          );
        },
      ),
    );
  }
}
