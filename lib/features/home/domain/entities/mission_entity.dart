class MissionEntity{
  final String? missionName;
  final String? launchDate;
  final String? launchTime;
  final String? launchSite;
  final String? youtube;
  final String? wikipedia;
  final String? webpage;

  const MissionEntity({
    required this.youtube,
    required this.wikipedia,
    required this.webpage,
    required this.missionName,
    required this.launchDate,
    required this.launchTime,
    required this.launchSite
  });
}