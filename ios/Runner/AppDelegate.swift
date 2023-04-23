import UIKit
import Flutter
import TPDirect

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        setupTPD()
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let shoppingCartChannel = FlutterMethodChannel(name: "stylish_flutter/shoppingCart", binaryMessenger: controller.binaryMessenger)
        
        // 2. 偵測呼叫的 method
        shoppingCartChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            // This method is invoked on the UI thread.
            // Handle battery messages.
            switch call.method {
            case "tapPurchase":
                self?.tapPay()
            default:
                result(FlutterMethodNotImplemented)
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

extension AppDelegate {
    
    private func setupTPD() {
        TPDSetup.setWithAppId(12348, withAppKey: "app_pa1pQcKoY22IlnSXq5m5WP5jFKzoRG58VEXpT7wU62ud7mMbDOGzCYIlzzLF", with: .sandBox)
    }
    
    private func tapPay() {
        let vc = TPDViewController()
        window?.rootViewController?.present(vc, animated: true)
    }
}
