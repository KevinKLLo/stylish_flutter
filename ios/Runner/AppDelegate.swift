import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let shoppingCartChannel = FlutterMethodChannel(name: "stylish_flutter/shoppingCart", binaryMessenger: controller.binaryMessenger)

    // 2. 偵測呼叫的 method
    shoppingCartChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        // This method is invoked on the UI thread.
        // Handle battery messages.
        switch call.method {
        case "tapPurchase":
            result("from iOS")
        default:
            result(FlutterMethodNotImplemented)
        }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
