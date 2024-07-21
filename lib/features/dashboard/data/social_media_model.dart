class SocialMediaModel {
  final String socialMediaName;
  final int followers;
  final int percent;

  SocialMediaModel({
    required this.socialMediaName,
    required this.followers,
    required this.percent,
  });
}

List<SocialMediaModel> socialMediaTraffic = [
  SocialMediaModel(socialMediaName: 'Facebook', followers: 2250, percent: 60),
  SocialMediaModel(socialMediaName: 'Instagram', followers: 1501, percent: 50),
  SocialMediaModel(socialMediaName: 'Twitter', followers: 750, percent: 40),
  SocialMediaModel(socialMediaName: 'LinkedIn', followers: 540, percent: 30),
  SocialMediaModel(socialMediaName: 'Other', followers: 13851, percent: 60),
];