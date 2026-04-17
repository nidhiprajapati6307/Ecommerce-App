import '../datasource/invitation_local_data_source.dart';
import '../model/invitation_template_model.dart';

class InvitationRepository {
  final InvitationLocalDataSource localDataSource;

  InvitationRepository({required this.localDataSource});

  Future<List<InvitationTemplateModel>> getTemplatesByCategory(String category) {
    return localDataSource.getTemplatesByCategory(category);
  }
}