//
//  DeliveryViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit
import RxSwift
import Resolver

class DeliveryViewController: BaseViewController {
  @Injected var viewModel: DeliveryViewModel
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let refreshControl = BaeminRefresh()
  private let topBannerView: BaseCollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: Device.width, height: 128)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    return view
  }()
}

extension DeliveryViewController {
  override func setupUI() {
    super.setupUI()
    scrollView.asChainable()
      .background(color: Color.gallery)
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
          .offset(BasePageViewController.Metric.pageBarHeight)
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      }
    
    refreshControl.asChainable()
      .add(to: scrollView)
      .set(target: scrollView)
    
    contentView.asChainable()
      .background(color: Color.white)
      .add(to: scrollView)
      .makeConstraints { (make) in
        make.top.bottom.width.equalToSuperview()
        make.height.equalTo(2500)
      }
    
    topBannerView.asChainable()
      .register(DeliveryTopBannerCell.self)
      .isPagingEnabled(true)
      .showsHorizontalScrollIndicator(false)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.trailing.top.equalToSuperview()
        make.height.equalTo(128)
      }
  }
}

extension DeliveryViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = DeliveryViewModel.Event(
      onAppear: rx.viewWillAppear.void()
    )
    let state = viewModel.reduce(event: event)
    state.topBanners.asObservable()
      .bind(to: topBannerView.rx.items(
              cellIdentifier: DeliveryTopBannerCell.reuseIdentifier)
      ) { (index, banner, cell) in
        guard let cell = cell as? DeliveryTopBannerCell else { return }
        cell.bannerImage.accept(banner.image)
      }.disposed(by: disposeBag)
    
    state.errorMessage
      .drive(onNext: { _ in
        //do error feedback
      }).disposed(by: disposeBag)
  }
}

