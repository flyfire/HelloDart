import 'dart:async';
import 'dart:isolate';

Future<void> printDailyNewsDigest() async {
  print('printDailyNewsDigest -> ${DateTime.now()} on ${Isolate.current.debugName}');
  var newsDigest = await gatherNewsReports();
  print('printDailyNewsDigest -> ${DateTime.now()} on ${Isolate.current.debugName}');
  print(newsDigest);
}

const news = '<gathered news goes here>';
const oneSecond = Duration(seconds: 1);

Future<String> gatherNewsReports() {
  return Future.delayed(oneSecond, (){
    print('gathering news -> ${DateTime.now()} on ${Isolate.current.debugName}');
    return news;
  });
}

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2] -> ${DateTime.now()} on ${Isolate.current.debugName}');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny. -> ${DateTime.now()} on ${Isolate.current.debugName}");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0 -> ${DateTime.now()} on ${Isolate.current.debugName}');
}

/*
main() async {
  var hi = await hitest();
  print(hi);
  await printDailyNewsDigest();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}*/

Future<String> hitest() {
  return Future.delayed(oneSecond, (){
    print('hitest -> ${DateTime.now()} on ${Isolate.current.debugName}');
    return "hi test";
  });
}

main() {
  printDailyNewsDigest();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}