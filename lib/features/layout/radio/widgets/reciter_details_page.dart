import 'package:flutter/material.dart';
import 'package:islamic/core/theme/aap_colors.dart';
import '../../../../models/reciters_response_model.dart';
import 'moshaf_card.dart';

class ReciterDetailsPage extends StatelessWidget {
   final Reciters reciter;

  const ReciterDetailsPage({required this.reciter, super.key});

  @override
  Widget build(BuildContext context) {
    final moshafs = reciter.moshaf ?? [];

    return Scaffold(
      appBar: AppBar(
        iconTheme:  IconThemeData(
          color: AppColors.primaryColor,
        ),
        backgroundColor: Colors.black,
        title: Text(reciter.name ?? "القارئ",
          style: TextStyle(
            color: AppColors.primaryColor
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: moshafs.length,
        itemBuilder: (context, index) {
          return MoshafCard(
            reciter: reciter,
            moshafIndex: index,);
        },
      ),
    );
  }
}