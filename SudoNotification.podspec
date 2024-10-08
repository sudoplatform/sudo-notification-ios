#
Pod::Spec.new do |spec|
  spec.name                  = 'SudoNotification'
  spec.version               = '3.0.0'
  spec.author                = { 'Sudo Platform Engineering' => 'sudoplatform-engineering@anonyome.com' }
  spec.homepage              = 'https://sudoplatform.com'

  spec.summary               = 'Notification SDK for the Sudo Platform by Anonyome Labs.'
  spec.license               = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  spec.source                = { :git => 'https://github.com/sudoplatform/sudo-notification-ios.git', :tag => "v#{spec.version}" }
  spec.ios.deployment_target = '15.0'
  spec.requires_arc          = true
  spec.swift_version         = '5.7'

  spec.source_files          = 'SudoNotification/**/*.swift'

  spec.dependency 'AWSAppSync', '~> 3.7.1'
  spec.dependency 'SudoUser', '~> 16.0'
  spec.dependency 'SudoLogging', '~> 1.0'
  spec.dependency 'SudoKeyManager', '~> 2.5'
  spec.dependency 'SudoApiClient', '~> 11.0'
  spec.dependency 'SudoConfigManager', '~> 3.1'
end
