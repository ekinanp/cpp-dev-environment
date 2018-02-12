# Parametrize this on the specific branch of Facter, eventually.
# For now, it will build for the 3.6.x branch
class cpp_dev_environment::facter_environment {
  contain cpp_dev_environment

  file { '/tmp/build_pa_component.sh':
    ensure => present,
    source => "puppet:///modules/cpp_dev_environment/build_pa_component.sh",
    mode   => "0777"
  }

  cpp_dev_environment::pa_component { 'leatherman':
    ref => "master"
  }

  cpp_dev_environment::pa_component { 'cpp-hocon':
    ref => "master"
  }
}
