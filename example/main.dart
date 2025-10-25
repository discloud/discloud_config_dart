import "dart:io";

import "package:discloud_config/discloud_config.dart";
import "package:path/path.dart";

void main() async {
  // Define the directory where the discloud.config file will be created/read.
  // We use the system's temporary directory to avoid creating files in your project.
  const filename = "discloud.config";

  final tempDir =
      await Directory.systemTemp.createTemp("discloud_config_example");

  final configFilePath = joinAll([tempDir.path, filename]);

  print("Creating/Reading discloud.config at: $configFilePath");

  // 1. Create a DiscloudConfig instance
  // If the file does not exist, it will be created.
  final config = await DiscloudConfig.fromPath(configFilePath);

  // 2. Set some configuration data
  print("\nSetting configuration data...");

  await config.set(DiscloudScope.ID, "my-awesome-app-id");
  await config.set(DiscloudScope.RAM, 512);
  await config.set(DiscloudScope.AUTORESTART, true);
  await config.set(DiscloudScope.TYPE, "bot");

  // 3. Read the configuration data
  print("\nReading configuration data:");

  print("ID: ${config.data.ID}");
  print("RAM: ${config.data.RAM}");
  print("AUTORESTART: ${config.data.AUTORESTART}");
  print("TYPE: ${config.data.TYPE}");

  // 4. Modify an existing data entry
  print("\nModifying RAM to 1024...");

  await config.set(DiscloudScope.RAM, 1024);

  print("New RAM: ${config.data.RAM}");

  // 5. Delete the configuration file (optional)
  print("\nDeleting the discloud.config file...");

  await config.delete();

  print("File deleted: ${!await config.file.exists()}");

  // Clean up the temporary directory
  await tempDir.delete(recursive: true);

  print("Temporary directory ${tempDir.path} cleaned up.");
}
