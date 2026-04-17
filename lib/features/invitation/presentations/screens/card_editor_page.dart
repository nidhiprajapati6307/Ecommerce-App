import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/model/invitation_event_data.dart';
import '../../data/model/invitation_template_model.dart';
import '../bloc/invitation_bloc.dart';
import '../widgets/preview_templets.dart';

class CardEditorPage extends StatefulWidget {
  final InvitationTemplateModel template;
  final InvitationEventData eventData;

  const CardEditorPage({
    super.key,
    required this.template,
    required this.eventData,
  });

  @override
  State<CardEditorPage> createState() => _CardEditorPageState();
}

class _CardEditorPageState extends State<CardEditorPage> {
  final GlobalKey previewKey = GlobalKey();

  Future<File?> _captureTemplateImage() async {
    try {
      final boundary =
      previewKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;

      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;

      final Uint8List pngBytes = byteData.buffer.asUint8List();
      final directory = await getTemporaryDirectory();

      final file = File(
        '${directory.path}/invitation_${DateTime.now().millisecondsSinceEpoch}.png',
      );

      await file.writeAsBytes(pngBytes);
      return file;
    } catch (_) {
      return null;
    }
  }

  Future<void> _shareTemplate(BuildContext context) async {
    final file = await _captureTemplateImage();

    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to generate template image')),
      );
      return;
    }

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Invitation Template',
      subject: 'Invitation Template',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Template"),
        centerTitle: true,
      ),
      body: BlocBuilder<InvitationBloc, InvitationState>(
        builder: (context, state) {
          final data = state.eventData;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                RepaintBoundary(
                  key: previewKey,
                  child: SizedBox(
                    height: 380,
                    child: TemplatePreviewCard(
                      template: widget.template,
                      eventData: data,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: TextEditingController(text: data.eventName),
                  decoration: const InputDecoration(
                    labelText: "Event Name",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<InvitationBloc>().add(
                      UpdateInvitationDataEvent(eventName: value),
                    );
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: TextEditingController(text: data.brideName),
                  decoration: const InputDecoration(
                    labelText: "Bride Name",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<InvitationBloc>().add(
                      UpdateInvitationDataEvent(brideName: value),
                    );
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: TextEditingController(text: data.groomName),
                  decoration: const InputDecoration(
                    labelText: "Groom Name",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<InvitationBloc>().add(
                      UpdateInvitationDataEvent(groomName: value),
                    );
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: TextEditingController(text: data.date),
                  decoration: const InputDecoration(
                    labelText: "Date",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<InvitationBloc>().add(
                      UpdateInvitationDataEvent(date: value),
                    );
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: TextEditingController(text: data.time),
                  decoration: const InputDecoration(
                    labelText: "Time",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<InvitationBloc>().add(
                      UpdateInvitationDataEvent(time: value),
                    );
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: TextEditingController(text: data.venue),
                  decoration: const InputDecoration(
                    labelText: "Venue",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    context.read<InvitationBloc>().add(
                      UpdateInvitationDataEvent(venue: value),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _shareTemplate(context),
                        icon: const Icon(Icons.send),
                        label: const Text("Send"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _shareTemplate(context),
                        icon: const Icon(Icons.share),
                        label: const Text("Share"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}