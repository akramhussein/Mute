Pod::Spec.new do |s|
  s.name             = 'Mute'
  s.version          = '0.3.0'
  s.summary          = 'Detect if silent/mute switch is enabled/disabled'
  s.description      = <<-DESC
There is no native iOS API to detect if the mute switch is enabled/disabled on a device.

The general principle to check if the device is muted is to play a short sound and detect the length it took to play.
From this length we can determine if it was muted or not.

This library is a Swift variant of https://github.com/moshegottlieb/SoundSwitch.
                       DESC

  s.homepage         = 'https://github.com/akramhussein/Mute'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Akram Hussein' => 'akramhussein@gmail.com' }
  s.source           = { :git => 'https://github.com/akramhussein/Mute.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ahussein'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Mute/Classes/**/*'

  s.resource_bundles = {
    'Mute' => ['Mute/Assets/*.caf']
  }
  s.frameworks = 'Foundation', 'AudioToolbox'
end
