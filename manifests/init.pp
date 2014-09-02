class fdesetup(
  $tmpfile = '/tmp/fdesetup'
) {
  exec { 'enable-fde':
    command => "fdesetup enable -defer ${tmpfile} -user ${::boxen_user} -forceatlogin 0 -norecoverykey",
    path => '/usr/bin:/bin',
    onlyif => [
      "test '${::root_encrypted}' == 'no'",
      'test -z "$(fdesetup status | grep Deferred)"'
    ],
    user => 'root'
  }
}
