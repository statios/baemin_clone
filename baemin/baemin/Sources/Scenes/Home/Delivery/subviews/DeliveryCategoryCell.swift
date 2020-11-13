//
//  DeliveryCategoryCell.swift
//  baemin
//
//  Created by Stat.So on 2020/11/13.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class DeliveryCategoryCell: BaseCollectionViewCell {
  
  let deliveryCategory = PublishRelay<DeliveryCategory>()
  
  private let categoryImageView = UIImageView()
  private let categoryTitleLabel = UILabel()
  
  override func setupUI() {
    super.setupUI()
    
    contentView.alpha = 0.1
    UIView.animate(withDuration: 0.5) {
      self.contentView.alpha = 1.0
      self.contentView.frame.origin.y -= 42
    }
    
    categoryImageView.asChainable()
      .contentMode(.scaleAspectFill)
      .clipToBounds(true)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.centerY.equalToSuperview()
          .offset(-Padding.medium)
        make.centerX.equalToSuperview()
        make.size.equalTo(42)
      }
    
    categoryTitleLabel.asChainable()
      .font(Font.small.bold())
      .color(Color.black)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.top.equalTo(categoryImageView.snp.bottom)
          .offset(Padding.small)
        make.centerX.equalToSuperview()
      }
  }
  
  override func setupBinding() {
    super.setupBinding()
    deliveryCategory.map { $0.image }
      .subscribe(onNext: { [weak self] image in
        self?.categoryImageView.image = image
      }).disposed(by: disposeBag)
    
    deliveryCategory.map { $0.title }
      .bind(to: categoryTitleLabel.rx.text)
      .disposed(by: disposeBag)
  }
}

