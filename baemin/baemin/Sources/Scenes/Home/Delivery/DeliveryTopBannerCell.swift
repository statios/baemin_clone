//
//  TopBannerCollectionViewCell.swift
//  baemin
//
//  Created by Stat.So on 2020/11/12.
//

import UIKit
import RxSwift
import RxCocoa

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
      .subscribe(onNext: { url in
        let imageURL = URL(string: url)
        var imageData = try! Data.init(contentsOf: imageURL!)
        var bgImage = UIImage(data: imageData)
        self.bannerImageView.image = bgImage
      }).disposed(by: disposeBag)
  }
}
