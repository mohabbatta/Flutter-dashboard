import 'package:ultimate_task/features/dashboard/data/social_media_model.dart';

import 'channel_model.dart';

class DataViewerModel {
  final String name;
  final int visitors;
  final int percent;

  DataViewerModel({
    required this.name,
    required this.visitors,
    required this.percent,
  });
}

List<DataViewerModel> mapChannelModelToDataViewerModel(List<ChannelModel> channelModels) {
  return channelModels.map<DataViewerModel>((channelModel) {
    return DataViewerModel(
      name: channelModel.channelName,
      visitors: channelModel.visitors,
      percent: channelModel.percent,
    );
  }).toList();
}
List<DataViewerModel> mapSocialTrafficToDataViewerModel(List<SocialMediaModel> channelModels) {
  return channelModels.map<DataViewerModel>((socialMediaModel) {
    return DataViewerModel(
      name: socialMediaModel.socialMediaName,
      visitors: socialMediaModel.followers,
      percent: socialMediaModel.percent,
    );
  }).toList();
}