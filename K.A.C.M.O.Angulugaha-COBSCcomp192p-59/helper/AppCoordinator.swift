//
//  AppCoordinator.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

class AppCoordinator: Coordinator {
    
    fileprivate let kDashboardCoordinator   : String  = "kDashboardCoordinator"
    fileprivate let kSignUpCoordinator      : String  = "kSignUpCoordinator"
    
    var window: UIWindow
    var coordinators = [String: Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
        UIViewController.addCoordination()
    }
    
    func start() {
        goToDashboard()
    }
    
    func goToDashboard() {
        let dashboardCoordinator = DashboardCoordinator(window: window)
        coordinators[kDashboardCoordinator] = dashboardCoordinator
        dashboardCoordinator.delegate = self
        dashboardCoordinator.start()
    }
    
    func loadSignUp() {
        let signUpCoordinator = SignUpCoordinator(window: window)
        coordinators[kSignUpCoordinator] = signUpCoordinator
        signUpCoordinator.delegate = self
        signUpCoordinator.start()
    }
    
    func loadHome() -> UIViewController {
        let homeCoordinator = HomeCoordinator(window: window)
        return homeCoordinator.getViewController()
    }
    
    func loadSignIn() -> UIViewController {
        let signInCoordinator = SignInCoordinator(window: window)
        return signInCoordinator.getViewController()
    }
    
    func loadBooking() -> UIViewController {
        let bookingCoordinator = BookingCoordinator(window: window)
        return bookingCoordinator.getViewController()
    }
}

extension AppCoordinator: HandleSegueDelegate {
    func handleSegue(segue: UIStoryboardSegue) {
//        if segue.identifier == "showDashboard" {
//            let dashboardCoordinator = DashboardCoordinator(window: window)
//            coordinators[kDashboardCoordinator] = dashboardCoordinator
//            dashboardCoordinator.delegate = self
//            dashboardCoordinator.handleSegue(segue: segue)
//        }
    }
}

extension AppCoordinator: LauncherCoordinatorDelegate {
    
}

extension AppCoordinator: DashboardCoordinatorDelegate {

}

extension AppCoordinator: HomeCoordinatorDelegate {
    
}

extension AppCoordinator: SignInCoordinatorDelegate {
    
}

extension AppCoordinator: SignUpCoordinatorDelegate {
    
}

extension UIViewController {
    
    class func addCoordination() {
        DispatchQueue.once(token: "com.angulugaha.madhuoshika.test1") {
            let originalPerformSelector = #selector(UIViewController.prepare(for:sender:))
            let swizzledPerformSelector = #selector(swizzledPrepare(for:sender:))
            
            method_exchangeImplementations(class_getInstanceMethod(UIViewController.self, originalPerformSelector)!,
                                           class_getInstanceMethod(UIViewController.self, swizzledPerformSelector)!)
        }
    }
    
    @objc func swizzledPrepare(for segue: UIStoryboardSegue,sender: Any?) {
        defer {
            self.swizzledPrepare(for: segue, sender: self)
        }
        
        guard let sourceViewController = segue.source as? Coordinated else {
            return
        }
        
        sourceViewController.coordinationDelegate?.prepareForSegue(segue: segue)

    }
}

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    class func once(token: String, block:()->Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}

