import UIKit
import Flutter
import TPDirect
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var flutterResult: FlutterResult?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        setupTPD()
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let shoppingCartChannel = FlutterMethodChannel(name: "stylish_flutter/shoppingCart", binaryMessenger: controller.binaryMessenger)
        
        // 2. 偵測呼叫的 method
        shoppingCartChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            self?.flutterResult = result
            // This method is invoked on the UI thread.
            // Handle battery messages.
            switch call.method {
            case "tapPurchase":
                self?.tapPay()
            default:
                result(FlutterMethodNotImplemented)
            }
        })
        
        GMSServices.provideAPIKey("AIzaSyCnFlTZ7wy0qUlFkeMpsklzAknP9-XJPzo")
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
        vc.delegate = self
        window?.rootViewController?.present(vc, animated: true)
    }
}

extension AppDelegate: TPDViewControllerDelegate {

    func getPrimeSuccess(prime: String) {
        flutterResult?(prime)
    }
    
    func getPrimeFail(errorMsg: String) {
        flutterResult?(errorMsg)
    }
}
