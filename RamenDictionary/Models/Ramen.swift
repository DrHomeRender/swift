// Models/Ramen.swift

import Foundation

// 하나의 라면 정보를 저장하는 구조체
struct Ramen {
    let name: String        // 라면 이름
    let imageName: String   // 이미지 파일 이름 (Assets.xcassets에 있는 이름과 같아야 함)
    let sodium: String      // 나트륨 함량 (예: "1760mg")
    let company: String     // 제조 회사명 (예: "농심")
    let taste: String       // 맛 설명 (예: "매운맛")
}

