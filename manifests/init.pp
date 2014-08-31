class fdesetup {
  exec { 'enable-fde':
    command => 'sudo /usr/sbin/fdesetup enable -defer /tmp/fdesetup -forceatlogin 0 -norecoverykey',
    only_if => "test '${::root_encrypted}' == 'no'",
    require => Sudoers['fdesetup-enable']
  }

  sudoers { 'fdesetup-enable':
    users       => $::boxen_user,
    hosts       => 'ALL',
    commands    => [
      '(ALL) NOPASSWD: /usr/sbin/fdesetup enable',
    ],
    type        => 'user_spec',
  }
}
