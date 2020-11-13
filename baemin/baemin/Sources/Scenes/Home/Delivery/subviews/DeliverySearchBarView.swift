//
//  DeliverySearchBarView.swift
//  baemin
//
//  Created by Stat.So on 2020/11/13.
//

import UIKit
import RxSwift
import RxCocoa

class DeliverySearchBarView: BaseView {
  
  let touchArea = UIButton()
  private let containerView = UIView()
  private let searchIcon = UIImageView()
  private let titleLabel = UILabel()
  
  override func setupUI() {
    super.setupUI()
    containerView.asChainable()
      .background(color: Color.white)
      .border(width: 2)
      .border(color: Color.black)
      .corner(radius: 24)
      .add(to: self)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
    
    searchIcon.asChainable()
      .image(Image.Icon.search24)
      .add(to: containerView)
      .makeConstraints { (make) in
        make.leading.equalToSuperview().offset(Padding.medium)
        make.centerY.equalToSuperview()
        make.size.equalTo(24)
      }
    
    titleLabel.asChainable()
      .font(Font.medium.bold())
      .color(Color.black)
      .text(Text.searchMenuStore)
      .add(to: containerView)
      .makeConstraints { (make) in
        make.leading.equalTo(searchIcon.snp.trailing).offset(Padding.small)
        make.trailing.equalToSuperview().offset(-Padding.small)
        make.centerY.equalToSuperview()
      }
    
    touchArea.asChainable()
      .add(to: self)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
  }
  override func setupBinding() {
    super.setupBinding()
  }
}
