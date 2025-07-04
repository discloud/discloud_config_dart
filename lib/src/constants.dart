const discloudNameMaxSize = 30;

const discloudRamMin = 100;

enum DiscloudApt { canvas, ffmpeg, java, libgl, openssl, puppeteer, tools }

enum DiscloudAppType { bot, site }

enum DiscloudRamMinByType {
  bot(100),
  site(512);

  const DiscloudRamMinByType(this.value);

  final int value;
}

enum DiscloudVersion { latest, lts, current, suja }
