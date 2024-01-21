//
//  AppDelegate.swift
//  Pierpont1
//
//  Created by Andrew Drogalis on 3/27/22.
//

import UIKit
import BackgroundTasks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        registerBackgroundFetch()
        return true
    }
    
    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    // Support for background fetch
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //1
        let viewController = ViewController()
        viewController.SavePostFiles()
        completionHandler(.newData)
    }
    
    private func registerBackgroundFetch() {
      // This code registers your background fetch task.
      BGTaskScheduler.shared.register(forTaskWithIdentifier: "pierpont.BackgroundTask", using: nil) { task in
        // You must set an expiration handler that calls `task.setTaskCompleted(success: false)`
        task.expirationHandler = {
          print("Task expired")
          task.setTaskCompleted(success: false)
        }
        print("Refreshing app in background. Time remaining: \(UIApplication.shared.backgroundTimeRemaining) s")
  
        let viewController = ViewController()
            viewController.SavePostFiles()
            task.setTaskCompleted(success: true)
        
        self.submitBackgroundTasks()
      }
    }

    func submitBackgroundTasks() {
      // This code schedules your background task when the app goes to background.
      do {
        let request = BGAppRefreshTaskRequest(identifier: "pierpont.BackgroundTask")
        request.earliestBeginDate = Date().addingTimeInterval(TimeInterval(300)) // 5 min later, set to whatever you want
        try BGTaskScheduler.shared.submit(request)
        print("Submitted background task")
      } catch {
        print("Failed to submit background task: \(error)")
      }
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

