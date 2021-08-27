class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
 
  file {'/opt/minecraft/server.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar',
  }
  
  $java_packages = [ 'java-16-openjdk' ]
  package: { $java_packages:
  ensure => '16.0.1.0.9-3'
  }
 
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  } 
  
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
