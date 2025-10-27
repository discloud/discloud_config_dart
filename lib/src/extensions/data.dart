import "package:discloud_config/discloud_config.dart";

extension DiscloudConfigDataExtension on DiscloudConfigData {
  int get minRAM => DiscloudRamMinByType.values.byName(appTYPE.name).value;

  Iterable<String> get nonNullAPT => APT ?? const Iterable.empty();

  DiscloudAppType get appTYPE => DiscloudAppType.values.firstWhere(
    (e) => e.name == TYPE,
    orElse: () => DiscloudAppType.bot,
  );
}
