class cpp_dev_environment {
 # Install the EPEL-release RPM (needed to install yaml-cpp)
 if $::operatingsystem == 'CentOS' {
   package { "epel-release-7":
     ensure   => installed,
     provider =>  'rpm',
     source   => "https://dl.fedoraproject.org/pub/epel/epel-release-latest-${operatingsystemmajrelease}.noarch.rpm",
     before   => Package["yaml-cpp-devel"]
   }
 }

 case $::operatingsystem {
   'Fedora': { 
     $reqd_packages = [ 'boost-devel', 'openssl-devel', 'yaml-cpp-devel', 'libblkid-devel', 'libcurl-devel', 'gcc-c++', 'make', 'wget', 'tar', 'cmake', 'git' ]
     $pkg_provider = 'dnf'
   }

   'CentOS': {
     $reqd_packages = [ 'boost-devel', 'openssl-devel', 'yaml-cpp-devel', 'libblkid-devel', 'libcurl-devel', 'gcc-c++', 'make', 'tar', 'cmake3', 'git', 'vim' ]
   }
 }

 # Install the base packages
 package { $reqd_packages:
   ensure   => installed,
   provider => $pkg_provider
 }

 # Create symlink for cmake => cmake3 for Centos platforms
 if $::operatingsystem == "CentOS" {
   file { "/usr/bin/cmake":
     ensure  => "link",
     target  => "/usr/bin/cmake3",
     require =>  Package["cmake3"]
   }
 }
}
