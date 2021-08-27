class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
 
  file {'/opt/minecraft/server.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar',
  }
  
  java::download { 'jdk16' :
  ensure  => 'present',
  java_se => 'jdk',
  url     => 'https://download.java.net/java/GA/jdk16.0.2/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-16.0.2_linux-x64_bin.tar.gz',
  basedir => '/usr/java',
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
