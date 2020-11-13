//
//  EmptyView.swift
//  baemin
//
//  Created by Stat.So on 2020/11/13.
//

import UIKit
import RxSwift
import RxCocoa

class EmptyView: BaseView {
  
  let title = PublishRelay<String>()
  
  let emptyLabel = UILabel()
  let titleLabel = UILabel()
  
  override func setupUI() {
    super.setupUI()
    emptyLabel.asChainable()
      .text("텅")
      .color(Color.black)
      .font(.systemFont(ofSize: 128))
      .add(to: self)
      .makeConstraints { (make) in
        make.centerX.equalToSuperview()
        make.centerY.equalToSuperview().offset(-Padding.large * 2)
      }
    
    titleLabel.asChainable()
      .textAlignment(.center)
      .numberOfLines(0)
      .color(Color.black)
      .font(Font.medium)
      .add(to: self)
      .makeConstraints { (make) in
        make.centerX.equalToSuperview()
        make.top.equalTo(emptyLabel.snp.bottom)
          .offset(Padding.medium)
      }
  }
  
  override func setupBinding() {
    super.setupBinding()
    title
      .bind(to: titleLabel.rx.text)
      .disposed(by: disposeBag)
  }
}

extension Chain where Origin: EmptyView {
  @discardableResult
  func subtitle(_ text: String) -> Chain {
    self.origin.title.accept(text)
    return self
  }
}
