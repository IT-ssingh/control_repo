node default {
  file {'/root/ReadMe':
    ensure => file,
    content => 'this is a readme',
  }
}
