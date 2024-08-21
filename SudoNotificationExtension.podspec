#
Pod::Spec.new do |spec|
  spec.name                  = 'SudoNotificationExtension'
  spec.version               = '3.0.0'
  spec.author                = { 'Sudo Platform Engineering' => 'sudoplatform-engineering@anonyome.com' }
  spec.homepage              = 'https://sudoplatform.com'

  spec.summary               = 'Notification Extension SDK for the Sudo Platform by Anonyome Labs.'
  spec.license               = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  spec.source                = { :git => 'https://github.com/sudoplatform/sudo-notification-ios.git', :tag => "v#{spec.version}" }
  spec.ios.deployment_target = '15.0'
  spec.requires_arc          = true
  spec.swift_version         = '5.7'

  spec.source_files          = 'SudoNotificationExtension/**/*.swift'

  spec.dependency 'SudoLogging', '~> 1.0'
end
