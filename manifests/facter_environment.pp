# Parametrize this on the specific branch of Facter, eventually.
# For now, it will build for the 3.6.x branch
class cpp_dev_environment::facter_environment {
  contain cpp_dev_environment

  $home_dir = "/root" 

  file { "${home_dir}/clone_pa_component.sh":
    ensure => present,
    source => "puppet:///modules/cpp_dev_environment/clone_pa_component.sh",
    mode   => "0777"
  }

  cpp_dev_environment::pa_component { 'leatherman':
    ref => "FACT-1772"
  }

  cpp_dev_environment::pa_component { 'cpp-hocon':
    ref => "refs/tags/0.1.5"
  }
}
