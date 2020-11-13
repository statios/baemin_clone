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
    static let topBannerHeight = CGFloat(196)
  }
  
  @Injected var viewModel: DeliveryViewModel
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let refreshControl = BaeminRefresh()
  private let allEventsButton = UIButton()
  private let topBannerView: BaseCollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: Device.width, height: Metric.topBannerHeight)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    return view
  }()
  private let topBannerCountLabel = UILabel()
  private let topBannerIndexLabel = UILabel()
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
        make.height.equalTo(Metric.topBannerHeight)
      }
    
    allEventsButton.asChainable()
      .background(color: .white)
      .alpha(0.8)
      .isHidden(true)
      .corner(radius: 12)
      .maskedCorners([.layerMinXMinYCorner, .layerMinXMaxYCorner])
      .font(Font.small)
      .setImage(Image.Icon.back24, for: .normal)
      .semanticContentAttribute(.forceRightToLeft)
      .contentEdgeInsets(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
      .setTitleColor(Color.black, for: .normal)
      .setTitle(Text.showAll, for: .normal)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.trailing.equalTo(topBannerView)
        make.bottom.equalTo(topBannerView).offset(-Padding.medium)
        make.height.equalTo(24)
      }
    
    topBannerCountLabel.asChainable()
      .font(Font.small)
      .color(Color.white)
      .isHidden(true)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.centerY.equalTo(allEventsButton)
        make.trailing.equalTo(allEventsButton.snp.leading).offset(-Padding.extraSmall)
      }
    
    topBannerIndexLabel.asChainable()
      .font(Font.small.bold())
      .color(Color.white)
      .isHidden(true)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.centerY.equalTo(allEventsButton)
        make.trailing.equalTo(topBannerCountLabel.snp.leading)
      }
  }
}

extension DeliveryViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = DeliveryViewModel.Event(
      onAppear: rx.viewWillAppear.void(),
      didScrollTopBanner: topBannerView.rx.contentOffset.asObservable()
    )
    let state = viewModel.reduce(event: event)
    state.topBanners.asObservable()
      .do(onNext: { [weak self] _ in
        self?.allEventsButton.isHidden = false
        self?.topBannerCountLabel.isHidden = false
        self?.topBannerIndexLabel.isHidden = false
      })
      .bind(to: topBannerView.rx.items(
              cellIdentifier: DeliveryTopBannerCell.reuseIdentifier)
      ) { (index, banner, cell) in
        guard let cell = cell as? DeliveryTopBannerCell else { return }
        cell.bannerImage.accept(banner.image)
      }.disposed(by: disposeBag)
    
    state.topBannersCount
      .drive(topBannerCountLabel.rx.text)
      .disposed(by: disposeBag)
    
    state.topBannersIndex
      .drive(topBannerIndexLabel.rx.text)
      .disposed(by: disposeBag)
    
    state.autoScroll
      .withLatestFrom(state.topBanners)
      .drive(onNext: { [weak self] in
        let item = self?.topBannerView.indexPathsForVisibleItems.first?.item ?? -1
        let indexPath = IndexPath(item: (item + 1) % $0.count, section: 0)
        self?.topBannerView.scrollToItem(at: indexPath, at: .left, animated: true)
      }).disposed(by: disposeBag)
    
    state.errorMessage
      .drive(onNext: { _ in
        //do error feedback
      }).disposed(by: disposeBag)
  }
}

