// ViewControllers/DetailViewController.swift

import UIKit

// 라면 상세 정보를 보여주는 화면
class DetailViewController: UIViewController {

    let ramen: Ramen // 전달받은 라면 정보 저장

    // 생성자에서 라면 데이터를 받음
    init(ramen: Ramen) {
        self.ramen = ramen
        super.init(nibName: nil, bundle: nil)
    }

    // storyboard를 사용하지 않으므로 필수 구현
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 화면이 로드되었을 때 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = ramen.name // 화면 상단 제목을 라면 이름으로 설정

        setupUI() // UI 구성 함수 호출
    }

    // 라면 상세 정보 구성
    func setupUI() {
        // 라면 이미지뷰
        let imageView = UIImageView(image: UIImage(named: ramen.imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        // 텍스트 라벨들
        let companyLabel = UILabel()
        companyLabel.text = "회사: \(ramen.company)"

        let sodiumLabel = UILabel()
        sodiumLabel.text = "나트륨: \(ramen.sodium)"

        let tasteLabel = UILabel()
        tasteLabel.text = "맛 설명: \(ramen.taste)"

        // 수직으로 쌓을 스택뷰
        let stack = UIStackView(arrangedSubviews: [imageView, companyLabel, sodiumLabel, tasteLabel])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        // 스택뷰 화면에 추가
        view.addSubview(stack)

        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
