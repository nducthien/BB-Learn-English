class ContentBoarding {
  String image;
  String title;
  String description;

  ContentBoarding({this.image, this.title, this.description});
}

List<ContentBoarding> contents = [
  ContentBoarding(
      title: 'Quality Food',
      image: 'assets/quality.svg',
      description: "when an unknown printer took a galley of type and scrambled it "
  ),
  ContentBoarding(
      title: 'Fast Delevery',
      image: 'assets/delevery.svg',
      description: "industry's standard dummy text ever since the 1500s"
  ),
  ContentBoarding(
      title: 'Reward surprises',
      image: 'assets/reward.svg',
      description: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
  ),
];
