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
  
  struct Metric {
    static let topBannerHeight = CGFloat(256)
  }
  
  @Injected var viewModel: DeliveryViewModel
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let refreshControl = BaeminRefresh()
  private let allEventButton = UIButton()
  private let bannerView: BaseCollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: Device.width, height: Metric.topBannerHeight)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    return view
  }()
  private let bannerCountLabel = UILabel()
  private let bannerIndexLabel = UILabel()
  private let categoryView: BaseCollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
    layout.itemSize = CGSize(width: Device.width/4, height: Device.width/4)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    return view
  }()
  private let searchBarView = DeliverySearchBarView()
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
      .isHidden(true)
      .background(color: Color.white)
      .add(to: scrollView)
      .makeConstraints { (make) in
        make.top.bottom.width.equalToSuperview()
      }
    
    bannerView.asChainable()
      .register(DeliveryBannerCell.self)
      .isPagingEnabled(true)
      .showsHorizontalScrollIndicator(false)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.trailing.top.equalToSuperview()
        make.height.equalTo(Metric.topBannerHeight)
      }
    
    allEventButton.asChainable()
      .background(color: .white)
      .alpha(0.8)
      .corner(radius: 14)
      .maskedCorners([.layerMinXMinYCorner, .layerMinXMaxYCorner])
      .font(Font.small)
      .setImage(Image.Icon.arrowRight12, for: .normal)
      .semanticContentAttribute(.forceRightToLeft)
      .contentEdgeInsets(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
      .setTitleColor(Color.black, for: .normal)
      .setTitle(Text.showAll, for: .normal)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.trailing.equalTo(bannerView)
        make.bottom.equalTo(bannerView).offset(-Padding.medium)
        make.height.equalTo(28)
      }
    
    bannerCountLabel.asChainable()
      .font(Font.small)
      .color(Color.white)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.centerY.equalTo(allEventButton)
        make.trailing.equalTo(allEventButton.snp.leading).offset(-Padding.small)
      }
    
    bannerIndexLabel.asChainable()
      .font(Font.small.bold())
      .color(Color.white)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.centerY.equalTo(allEventButton)
        make.trailing.equalTo(bannerCountLabel.snp.leading)
      }
    
    categoryView.asChainable()
      .register(DeliveryCategoryCell.self)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(bannerView.snp.bottom)
        make.height.equalTo(2*Device.width/4*2)
      }
    
    searchBarView.asChainable()
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.equalToSuperview().offset(Padding.medium)
        make.trailing.equalToSuperview().offset(-Padding.medium)
        make.height.equalTo(48)
        make.top.equalTo(categoryView.snp.bottom).offset(Padding.medium)
        make.bottom.equalToSuperview().offset(-Padding.large)
      }
  }
}

extension DeliveryViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = DeliveryViewModel.Event(
      onAppear: rx.viewWillAppear.void(),
      scrollBanner: bannerView.rx.contentOffset.asObservable(),
      tapSearch: searchBarView.touchArea.rx.tap.void(),
      tapAllEvent: allEventButton.rx.tap.void()
    )
    let state = viewModel.reduce(event: event)
    state.topBanners.asObservable()
      .do(onNext: { [weak self] _ in self?.contentView.isHidden = false })
      .bind(to: bannerView.rx.items(
              cellIdentifier: DeliveryBannerCell.reuseIdentifier)
      ) { (index, banner, cell) in
        guard let cell = cell as? DeliveryBannerCell else { return }
        cell.bannerImage.accept(banner.image)
      }.disposed(by: disposeBag)
    
    state.topBannersCount
      .drive(bannerCountLabel.rx.text)
      .disposed(by: disposeBag)
    
    state.topBannersIndex
      .drive(bannerIndexLabel.rx.text)
      .disposed(by: disposeBag)
    
    state.autoScroll
      .withLatestFrom(state.topBanners)
      .drive(onNext: { [weak self] in
        let item = self?.bannerView.indexPathsForVisibleItems.first?.item ?? -1
        let indexPath = IndexPath(item: (item + 1) % $0.count, section: 0)
        self?.bannerView.scrollToItem(at: indexPath, at: .left, animated: true)
      }).disposed(by: disposeBag)
    
    state.deliveryCategories.asObservable()
      .bind(to: categoryView.rx.items(
              cellIdentifier: DeliveryCategoryCell.reuseIdentifier)
      ) { (index, deliveryCategory, cell) in
        guard let cell = cell as? DeliveryCategoryCell else { return }
        cell.deliveryCategory.accept(deliveryCategory)
      }.disposed(by: disposeBag)
    
    state.errorMessage
      .drive(onNext: { _ in
        //do error feedback
      }).disposed(by: disposeBag)
  }
}

