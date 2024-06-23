#
Pod::Spec.new do |spec|
  spec.name                  = 'SudoNotification'
  spec.version               = '2.1.1'
  spec.author                = { 'Sudo Platform Engineering' => 'sudoplatform-engineering@anonyome.com' }
  spec.homepage              = 'https://sudoplatform.com'

  spec.summary               = 'Notification SDK for the Sudo Platform by Anonyome Labs.'
  spec.license               = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  spec.source                = { :git => 'git@gitlab.tools.anonyome.com:platform/notifications/sudo-notification-ios.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = '15.0'
  spec.requires_arc          = true
  spec.swift_version         = '5.7'

  spec.source_files          = 'SudoNotification/**/*.swift'

  spec.dependency 'AWSAppSync', '~> 3.6.1'
  spec.dependency 'SudoUser', '~> 15.1'
  spec.dependency 'SudoLogging', '~> 1.0'
  spec.dependency 'SudoKeyManager', '~> 2.5'
  spec.dependency 'SudoApiClient', '~> 10.2'
  spec.dependency 'SudoConfigManager', '~> 3.0', '>= 3.0.2'
end
