//
//  TopBannerCollectionViewCell.swift
//  baemin
//
//  Created by Stat.So on 2020/11/12.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class DeliveryTopBannerCell: BaseCollectionViewCell {
  
  let bannerImage = PublishRelay<String>()
  
  private let bannerImageView = UIImageView()
  
  override func setupUI() {
    super.setupUI()
    bannerImageView.asChainable()
      .contentMode(.scaleAspectFill)
      .clipToBounds(true)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
    
  }
  
  override func setupBinding() {
    super.setupBinding()
    bannerImage
      .subscribe(onNext: { [weak self] url in
        self?.bannerImageView.kf.setImage(with: URL(string: url))
      }).disposed(by: disposeBag)
  }
}
