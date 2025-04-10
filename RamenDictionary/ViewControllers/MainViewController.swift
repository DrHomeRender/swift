// ViewControllers/MainViewController.swift

import UIKit

// 앱의 메인(첫 번째) 화면을 담당하는 뷰컨트롤러입니다.
class MainViewController: UIViewController {

    // 라면 목록 데이터 배열 선언
    let ramenList: [Ramen] = [
        Ramen(name: "신라면", imageName: "shin", sodium: "1760mg", company: "농심", taste: "매운맛"),
        Ramen(name: "진라면", imageName: "jin", sodium: "1680mg", company: "오뚜기", taste: "순한맛")
    ]

    // 뷰가 처음 로드될 때 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // 배경 색 설정
        title = "라면 사전 🍜"         // 상단 네비게이션 타이틀 설정

        setupUI() // UI 구성 함수 호출
    }

    // 라면 버튼들을 화면에 배치하는 함수
    func setupUI() {
        // 버튼들을 세로로 쌓을 스택뷰 생성
        let stackView = UIStackView()
        stackView.axis = .vertical        // 세로 방향
        stackView.spacing = 20            // 버튼 간 간격
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView) // 스택뷰를 메인 화면에 추가

        // 오토레이아웃 설정 (상단과 좌우 여백)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        // ramenList 배열을 순회하며 버튼 생성
        for (index, ramen) in ramenList.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(ramen.name, for: .normal)                 // 버튼 제목 = 라면 이름
            button.setImage(UIImage(named: ramen.imageName), for: .normal) // 버튼 이미지 = 라면 사진
            button.tintColor = .black
            button.contentHorizontalAlignment = .left                // 왼쪽 정렬
            button.tag = index // 어떤 라면인지 구분하기 위해 인덱스를 태그로 저장
            button.addTarget(self, action: #selector(ramenTapped(_:)), for: .touchUpInside) // 버튼 눌렀을 때 함수 연결

            stackView.addArrangedSubview(button)
        }
    }

    // 버튼을 눌렀을 때 호출되는 함수
    @objc func ramenTapped(_ sender: UIButton) {
        let ramen = ramenList[sender.tag] // 어떤 라면을 눌렀는지 tag로 확인
        let detailVC = DetailViewController(ramen: ramen) // 상세화면에 해당 라면 전달
        navigationController?.pushViewController(detailVC, animated: true) // 화면 이동
    }
}

