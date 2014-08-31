class fdesetup {
  exec { 'enable-fde':
    command => '/usr/sbin/fdesetup enable -defer /tmp/fdesetup -forceatlogin 0 -norecoverykey',
    onlyif => "test '${::root_encrypted}' == 'no'",
    user => 'root'
  }
}
