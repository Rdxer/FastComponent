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
    ss.dependency 'Then'
    ss.dependency 'Localize-Swift'
    ss.dependency 'XXLogger'
  end

  s.subspec 'UIKitEx' do |ss|
    ss.source_files = 'UIKitEx/**/*.swift'
    ss.dependency 'Material'
    # ss.dependency 'FastComponent/Base'
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
    ss.dependency 'Eureka'

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
    ss.frameworks = 'SafariServices'
  end




end
