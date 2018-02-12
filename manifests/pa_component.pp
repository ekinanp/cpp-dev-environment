define cpp_dev_environment::pa_component (
  String $component = $title,
  String $ref
) {
  $work_dir = "/tmp"

  exec { "build the component ${component}":
    command   => "/usr/bin/bash ./build_pa_component.sh ${component} ${ref}",
    cwd       => $work_dir,
    logoutput => true,
    require   => File["${work_dir}/build_pa_component.sh"]
  }
}
