import '../model/podcast_model.dart';

List<PodCast> listOfPodCasts = [
  PodCast(
    name: "TED Talks Daily by TED",
    shortDescription: "Every weekday, TED Talks Daily brings you the latest talks in audio",
    posterUrl: "https://static.mytuner.mobi/media/podcasts/630/ted-talks-daily.jpg",
    episodes: [
      PodCastEpisode(
        title: "2401 - The rise of the \"trauma essay\" in college applications | Tina Yong ",
        shortDescription: "Fri, 07 Apr 2023",
        posterUrl: "",
        audioSourceUrl:
            "https://dovetail3-cdn.prxu.org/usw2/70/ff38d697-ab48-4526-856c-36fd60bd65ee/913D-R5odFG4BIWO1AwFVWACFKXY_oaN9IUYtZorlJM/TinaYong_2022X_VO_Intro.mp3?le=vJtftH5u88I5DK_irOFO-pi7rHbz-gJtzj8bvTQxhQU&exp=1681145370",
      ),
      PodCastEpisode(
        title: "2400 - What will the dream car of the future be like? | Alex Koster ",
        shortDescription: "Thu, 06 Apr 2023",
        posterUrl: "",
        audioSourceUrl:
            "https://dts.podtrac.com/redirect.mp3/download.ted.com/talks/AlexKoster_2022S.mp3?apikey=172BB350-0207&prx_url=https://chtbl.com/track/48D18/https://dovetail.prxu.org/70/50c87073-50e2-4604-8726-b30c65786788/AlexKoster_2022S_VO_Intro.mp3",
      ),
    ],
  ),
];
