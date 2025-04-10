import UIKit

// 앱의 화면(Scene)을 관리하는 클래스
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?  // 앱의 실제 화면(창)을 담을 변수

    // 새로운 Scene이 연결될 때 호출됨 (앱의 첫 화면을 구성하는 곳!)
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // scene이 UIWindowScene 타입인지 확인
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // UIWindow 인스턴스 생성 (창 생성)
        let window = UIWindow(windowScene: windowScene)

        // UINavigationController 안에 첫 화면으로 MainViewController 지정
        let navController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navController

        // 생성한 창을 현재 scene에 연결
        self.window = window
        window.makeKeyAndVisible() // 앱 화면을 실제로 보여줌
    }

    // 아래 함수들은 생명주기 관련이며, 지금은 필요 없음 (비워둬도 됨)
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
