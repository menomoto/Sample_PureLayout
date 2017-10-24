import Foundation
import UIKit


if NSClassFromString("XCTestCase") != nil {
    UIApplicationMain(
        CommandLine.argc,
        UnsafeMutableRawPointer(CommandLine.unsafeArgv)
            .bindMemory(
                to: UnsafeMutablePointer<Int8>.self,
                capacity: Int(CommandLine.argc)),
        NSStringFromClass(UIApplication.self),
        NSStringFromClass(TestingAppDelegate.self)
    )
//    UIApplicationMain(
//        Process.argc,
//        Process.unsafeArgv,
//        NSStringFromClass(UIApplication),
//        NSStringFromClass(TestingAppDelegate)
//    )
} else {
    UIApplicationMain(
        CommandLine.argc,
        UnsafeMutableRawPointer(CommandLine.unsafeArgv)
            .bindMemory(
                to: UnsafeMutablePointer<Int8>.self,
                capacity: Int(CommandLine.argc)),
        NSStringFromClass(UIApplication.self),
        NSStringFromClass(AppDelegate.self)
    )
//    UIApplicationMain(
//        Process.argc,
//        Process.unsafeArgv,
//        NSStringFromClass(UIApplication),
//        NSStringFromClass(AppDelegate)
//    )
}
