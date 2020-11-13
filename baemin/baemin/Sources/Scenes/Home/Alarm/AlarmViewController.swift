//
//  AlarmViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift
import Resolver

class AlarmViewController: BaseViewController {
  @Injected var viewModel: AlarmViewModel
  @Injected var navigator: HomeNavigator
  
  private let backButton = UIButton()
  private let emptyView = EmptyView()
}

extension AlarmViewController {
  override func setupUI() {
    super.setupUI()
    self.asChainable()
      .title(Text.alarmCenter)
    
    view.asChainable()
      .background(color: Color.wildSand)
    
    emptyView.asChainable()
      .isHidden(true)
      .subtitle("새로운 소식이 없어요.\n오늘의 소식이 생기면 알려드릴게요!")
      .add(to: view)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
    
    backButton.asChainable()
      .setImage(Image.Icon.back24, for: .normal)
      .addBarButtonItem(self, position: .left)
  }
}

extension AlarmViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = AlarmViewModel.Event(
      onAppear: rx.viewWillAppear.void(),
      tapBack: backButton.rx.tap.void()
    )
    let state = viewModel.reduce(event: event)
    
    state.alarms
      .drive(onNext: { _ in
        //TODO show list in view
      }).disposed(by: disposeBag)
    
//    state.isEmpty
//      .drive(alarmsView.rx.isHidden)
//      .disposed(by: disposeBag)
    
    state.isEmpty.map { !$0 }
      .drive(emptyView.rx.isHidden)
      .disposed(by: disposeBag)
    
    state.popToHome
      .drive(onNext: { [weak self] in
        self?.navigationController?.popViewController(animated: true)
      }).disposed(by: disposeBag)
    
    state.errorMessage
      .drive(onNext: { _ in
        //TODO ui feedback
      }).disposed(by: disposeBag)
  }
}

