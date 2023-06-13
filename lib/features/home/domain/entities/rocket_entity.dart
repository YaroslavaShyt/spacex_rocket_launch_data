class RocketEntity{
  final String? id;
  final bool? active;
  final int? stages;
  final int? boosters;
  final int? cost_per_launch;
  final int? success_rate_pct;
  final String? first_flight;
  final String? country;
  final String? company;
  final Map<String, dynamic>? height;
  final Map<String, dynamic>? diameter;
  final Map<String, dynamic>? mass;
  final List<dynamic>? payload_weights;
  final Map<String, dynamic>? first_stage;
  final Map<String, dynamic>? thrust_vacuum;
  final Map<String, dynamic>? second_stage;
  final Map<String, dynamic>? payloads;
  final Map<String, dynamic>? engines;
  final int? engine_loss_max;
  final String? propellant_1;
  final String? propellant_2;
  final Map<String, dynamic>? thrust_sea_level;
  final Map<String, dynamic>? thrust_to_weight;
  final Map<String, dynamic>? landing_legs;
  final List<dynamic>? flickr_images;
  final String? wikipedia;
  final String? description;
  final String? rocket_id;
  final String? rocket_name;
  final String? rocket_type;

  const RocketEntity({required this.height,
    required this.country,
    required this.id,
    required this.active,
    required this.boosters,
    required this.company,
    required this.cost_per_launch,
    required this.description,
    required this.diameter,
    required this.engine_loss_max,
    required this.engines,
    required this.first_flight,
    required this.first_stage,
    required this.flickr_images,
    required this.landing_legs,
    required this.mass,
    required this.payload_weights,
    required this.payloads,
    required this.propellant_1,
    required this.propellant_2,
    required this.rocket_id,
    required this.rocket_name,
    required this.rocket_type,
    required this.second_stage,
    required this.stages,
    required this.success_rate_pct,
    required this.thrust_sea_level,
    required this.thrust_to_weight,
    required this.thrust_vacuum,
    required this.wikipedia
  });
}