class fdesetup {
  exec { 'enable-fde':
    command => 'sudo /usr/sbin/fdesetup enable -defer /tmp/fdesetup -forceatlogin 0 -norecoverykey',
    onlyif => "test '${::root_encrypted}' == 'no'",
    user => 'root'
  }
}
