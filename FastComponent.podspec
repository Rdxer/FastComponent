Pod::Spec.new do |s|
  s.name             = 'FastComponent'
  s.version          = '0.1.0'
  s.summary          = '一个快速开发iOSApp的组件库.'

  s.description      = <<-DESC
一个快速开发iOSApp的组件库.多种框架集成
                       DESC

  s.homepage         = 'https://github.com/Rdxer/FastComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rdxer' => 'rdxer@foxmail.com' }
  s.source           = { :git => 'https://github.com/Rdxer/FastComponent.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'FastComponent/Classes/**/*'

end
