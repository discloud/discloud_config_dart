const discloudAptValues = {
  "canvas",
  "ffmpeg",
  "java",
  "libgl",
  "openssl",
  "puppeteer",
  "tools",
};

const discloudNameMaxSize = 30;

const discloudTypeValues = {"bot", "site"};

const discloudVersionValues = {"latest", "lts", "current", "suja"};

enum DiscloudRamMinByType {
  bot(100),
  site(512);

  const DiscloudRamMinByType(this.value);

  final int value;
}
