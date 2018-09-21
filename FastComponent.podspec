Pod::Spec.new do |s|
  s.name             = 'FastComponent'
  s.version          = '0.1.0'
  s.summary          = '一个快速开发iOSApp的组件库.'

  s.description      = <<-DESC
一个快速开发iOSApp的组件库. 多种框架集成
                       DESC

  s.homepage         = 'https://github.com/Rdxer/FastComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rdxer' => 'rdxer@foxmail.com' }
  s.source           = { :git => 'https://github.com/Rdxer/FastComponent.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'



  s.subspec 'Base' do |ss|
    ss.source_files = 'Base/**/*.swift'
    ss.dependency 'Then'
    ss.dependency 'Localize-Swift'
#    ss.dependency 'XXLogger'

    ss.resources    = 'FastComponent.bundle'
  end

  s.subspec 'ConfigEx' do |ss|
    ss.source_files = 'ConfigEx/**/*.swift'
    # ss.dependency 'Material'
    ss.dependency 'FastComponent/Base'
    ss.dependency 'FastComponent/UIKitEx'
    ss.dependency 'Then'
  end

  s.subspec 'UIKitEx' do |ss|
    ss.source_files = 'UIKitEx/**/*.swift'
    # ss.dependency 'Material'
    ss.dependency 'FastComponent/Base'
    ss.dependency 'Then'
  end

  s.subspec 'FoundationEx' do |ss|
    ss.source_files = 'FoundationEx/**/*.swift'
    ss.dependency 'SwiftyJSON'
    ss.dependency 'AsyncSwift'
    ss.dependency 'FastComponent/Base'
  end

  s.subspec 'UICustomEx' do |ss|
    ss.source_files = 'UICustomEx/**/*.swift'
    ss.dependency 'FastComponent/UIKitEx'
    #ss.dependency 'Eureka'

    ss.dependency 'FastComponent/Base'
  end

  s.subspec 'Component' do |ss|
    ss.source_files = 'Component/**/*.swift'
    ss.dependency 'FastComponent/UIKitEx'

    ss.dependency 'FastComponent/Base'
  end

  s.subspec 'SafariServicesEx' do |ss|
    ss.source_files = 'SafariServicesEx/**/*.swift'
    ss.dependency 'FastComponent/UIKitEx'

    ss.dependency 'FastComponent/Base'
    ss.dependency 'FastComponent/SnapKitEx'
    
    ss.frameworks = 'SafariServices'
  end

  s.subspec 'MaterialEx' do |ss|
    ss.source_files = 'MaterialEx/**/*.swift'
    ss.dependency 'Material'
    ss.dependency 'FastComponent/UIKitEx'
    ss.dependency 'FastComponent/ConfigEx'
    ss.dependency 'FastComponent/Base'
  end

  s.subspec 'PullToRefreshEx' do |ss|
    ss.source_files = 'PullToRefreshEx/**/*.swift'
    ss.dependency 'DGElasticPullToRefresh'
    ss.dependency 'FastComponent/UIKitEx'
    ss.dependency 'FastComponent/ConfigEx'
    ss.dependency 'FastComponent/Base'
  end

s.subspec 'MoyaEx' do |ss|
    ss.source_files = 'MoyaEx/**/*.swift'
    ss.dependency 'FastComponent/Base'
    ss.dependency 'HandyJSON'
    ss.dependency 'SwiftyUserDefaults'
    ss.dependency 'RxSwift'
    ss.dependency 'Result'
    ss.dependency 'Moya'
    ss.dependency 'Moya/RxSwift'
end

  s.subspec 'MoyaRESTfulEx' do |ss|
    ss.source_files = 'MoyaRESTfulEx/**/*.swift'
    ss.dependency 'FastComponent/Base'
    ss.dependency 'HandyJSON'
    ss.dependency 'SwiftyUserDefaults'
    ss.dependency 'RxSwift'
    ss.dependency 'Result'
    ss.dependency 'Moya/RxSwift'
  end

  s.subspec 'RxSwiftEx' do |ss|
    ss.source_files = 'RxSwiftEx/**/*.swift'
    ss.dependency 'FastComponent/Base'
    ss.dependency 'RxSwift'
  end

  s.subspec 'KingfisherEx' do |ss|
    ss.source_files = 'KingfisherEx/**/*.swift'
    ss.dependency 'Kingfisher'
  end

  s.subspec 'SnapKitEx' do |ss|
    ss.source_files = 'SnapKitEx/**/*.swift'
    ss.dependency 'SnapKit'
  end
  
  s.subspec 'DeviceEx' do |ss|
    ss.source_files = 'DeviceEx/**/*.swift'
    ss.dependency 'Device' #, :git => 'https://github.com/Rdxer/Device.git'
  end
  
  
  s.subspec 'GRDBEx' do |ss|
      ss.source_files = 'GRDBEx/**/*.swift'
      ss.dependency 'FastComponent/Base'
      ss.dependency 'GRDB.swift'
  end
  
  s.subspec 'DeviceUniqueIdentifierEx' do |ss|
      ss.source_files = 'DeviceUniqueIdentifierEx/**/*.swift'
      ss.dependency 'FastComponent/Base'
      ss.dependency 'SAMKeychain'
  end

end
