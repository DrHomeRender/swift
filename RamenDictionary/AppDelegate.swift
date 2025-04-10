import UIKit

// 앱의 시작 지점. UIApplicationDelegate 프로토콜을 따르는 클래스
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // 앱이 실행되었을 때 호출됨 (가장 첫 실행 함수)
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // 앱이 정상적으로 시작되었음을 알림 (true 반환)
        return true
    }

    // 앱이 새로운 Scene (화면)을 만들 때 호출됨
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        // 기본 Scene 구성 객체를 반환
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // 사용 중이던 Scene이 종료될 때 호출됨
    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
        // 필요시 자원 정리 가능 (지금은 사용 안 함)
    }
}
