import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper {
  static String get bonnerUnit => "ca-app-pub-9667667164394806~2525711209";
  late RewardedAd _rewardedAd;
  late BannerAd _bannerAd;

  static initialization(){
    if(MobileAds.instance == null)
    {
      MobileAds.instance.initialize();
    }
  }

  void loadRewardedAds() {
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ads) {
          _rewardedAd = ads;
        },
        onAdFailedToLoad: (LoadAdError error) {
          // loadRewardedAds();
        },

      ),

    );
  }






  void showAds() {
    _rewardedAd.show(
      onUserEarnedReward: (RewardedAd ads, RewardItem item) {
        print('Reward Eward is ${item.amount}');
      },
    );
    _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ads) {},
      onAdFailedToShowFullScreenContent: (RewardedAd ads, AdError error) {
        ads.dispose();
      },
      onAdDismissedFullScreenContent: (RewardedAd ads) {
        ads.dispose();
      },
      onAdImpression: (
        RewardedAd ads,
      ) =>
          print('$ads Impression  occurred'),
    );
  }
}
