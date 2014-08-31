class fdesetup {
  exec { 'enable-fde':
    command => '/usr/bin/fdesetup enable -defer /tmp/fdesetup -forceatlogin 0 -norecoverykey',
    onlyif => "test '${::root_encrypted}' == 'no'",
    user => 'root'
  }
}
