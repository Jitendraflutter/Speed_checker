import 'package:flutter/foundation.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxBool isStart=false.obs;

  final internetSpeedTest = FlutterInternetSpeedTest()..enableLog();

  bool _testInProgress = false;
  RxDouble downloadRate = (0.0).obs;
  RxDouble uploadRate = (0.0).obs;
  RxString downloadProgress = '0'.obs;
  RxString uploadProgress = '0'.obs;
  int downloadCompletionTime = 0;
  int uploadCompletionTime = 0;
  bool isServerSelectionInProgress = false;

  String? _ip;
  String? _asn;
  String? _isp;

  String _unitText = 'Mbps';


  void reset() {

        _testInProgress = false;
        downloadRate = (0.0).obs;
        uploadRate = (0.0).obs;
        downloadProgress.value = '0';
        uploadProgress.value = '0';
        _unitText = 'Mbps';
        downloadCompletionTime = 0;
        uploadCompletionTime = 0;

        _ip = null;
        _asn = null;
        _isp = null;

  }


  startTesting()async{
    reset();
    await internetSpeedTest.startTesting(
        useFastApi: true,
        onStarted: () {
          _testInProgress = true;
        }, onCompleted: (TestResult download, TestResult upload) {
      if (kDebugMode) {
        print(
            'the transfer rate ${download.transferRate}, ${upload.transferRate}');
      }

        downloadRate.value = download.transferRate;
        _unitText =
        download.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';
        downloadProgress.value = '100';
        downloadCompletionTime = download.durationInMillis;


        uploadRate.value = upload.transferRate;
        _unitText =
        upload.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';
        uploadProgress.value = '100';
        uploadCompletionTime = upload.durationInMillis;
        _testInProgress = false;

    }, onProgress: (double percent, TestResult data) {
      if (kDebugMode) {
        print(
            'the transfer rate $data.transferRate, the percent $percent');
      }

        _unitText =
        data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';
        if (data.type == TestType.download) {
          downloadRate.value = data.transferRate;
          downloadProgress.value = percent.toStringAsFixed(2);
        } else {
          uploadRate.value = data.transferRate;
          uploadProgress.value = percent.toStringAsFixed(2);
        }

    }, onError: (String errorMessage, String speedTestError) {
      if (kDebugMode) {
        print(
            'the errorMessage $errorMessage, the speedTestError $speedTestError');
      }
      reset();
    }, onDefaultServerSelectionInProgress: () {

        isServerSelectionInProgress = true;

    }, onDefaultServerSelectionDone: (Client? client) {

        isServerSelectionInProgress = false;
        _ip = client?.ip;
        _asn = client?.asn;
        _isp = client?.isp;

    }, onDownloadComplete: (TestResult data) {

        downloadRate.value = data.transferRate;
        _unitText =
        data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';
        downloadCompletionTime = data.durationInMillis;

    }, onUploadComplete: (TestResult data) {

        uploadRate.value = data.transferRate;
        _unitText =
        data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';
        uploadCompletionTime = data.durationInMillis;

    }, onCancel: () {
      reset();
    });
  }


}