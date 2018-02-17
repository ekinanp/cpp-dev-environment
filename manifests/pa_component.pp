define cpp_dev_environment::pa_component (
  String $component = $title,
  String $ref
) {
  $home_dir = "/root"

  $bash = $::operatingsystem ? {
    "Debian" => "/bin/bash",
    default  => "/usr/bin/bash"
  }

  exec { "clone the component ${component}":
    command   => "${bash} ./clone_pa_component.sh ${component} ${ref}",
    cwd       => $home_dir,
    logoutput => true,
    require   => File["${home_dir}/clone_pa_component.sh"]
  }
}
