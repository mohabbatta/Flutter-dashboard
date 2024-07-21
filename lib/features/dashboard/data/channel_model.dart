class ChannelModel {
  final String channelName;
  final int visitors;
  final int percent;

  ChannelModel({
    required this.channelName,
    required this.visitors,
    required this.percent,
  });
}


List<ChannelModel> channelTraffic = [
  ChannelModel(channelName: 'Direct', visitors: 1250, percent: 60),
  ChannelModel(channelName: 'Organic Search	', visitors: 1501, percent: 50),
  ChannelModel(channelName: 'Refferal', visitors: 750, percent: 40),
  ChannelModel(channelName: 'Social', visitors: 540, percent: 30),
  ChannelModel(channelName: 'Other', visitors: 13851, percent: 60),
];