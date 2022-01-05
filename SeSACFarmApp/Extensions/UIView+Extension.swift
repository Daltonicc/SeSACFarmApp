//
//  CALayer+Extension.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/05.
//

import Foundation
import UIKit

class BorderView: UIView {
    
}
//원하는 부분에만 border 설정.
extension UIView {
    func addSidedBorder(toEdge edge: UIRectEdge, withColor color: UIColor, inset: CGFloat, thickness: CGFloat) {
        let border = BorderView(frame: .zero)
        border.backgroundColor = color
        addSubview(border)

        border.snp.makeConstraints { make in
            switch edge {
            case .top:
                make.top.equalToSuperview()
                make.height.equalTo(thickness)
                make.left.right.equalToSuperview().inset(inset)

            case .left:
                make.left.equalToSuperview()
                make.width.equalTo(thickness)
                make.top.bottom.equalToSuperview().inset(inset)

            case .bottom:
                make.bottom.equalToSuperview()
                make.height.equalTo(thickness)
                make.left.right.equalToSuperview().inset(inset)

            case .right:
                make.right.equalToSuperview()
                make.width.equalTo(thickness)
                make.top.bottom.equalToSuperview().inset(inset)

            default:
                print("Invalid border")
            }
        }
    }

}
