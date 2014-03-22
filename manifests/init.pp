class servicemix::servicemix {
  $install_dir = "/opt"
  $software_dir = "/software"
  $pv = "4.5.3"
  $pn = "apache-servicemix"
  $p = "${pn}-${pv}"
  $archive = "${p}.tar.gz"
  $source = "http://archive.apache.org/dist/servicemix/servicemix-4/${pv}/${archive}"
  $user = 'vagrant'
  $group = 'vagrant'

  wget::fetch { 'fetch-smx':
    source       => $source,
    destination  => "${install_dir}/${archive}",
    require      => File[$install_dir];
  } ->
  exec { 'smx-untar':
    command      => "tar zxf ${software_dir}/${archive}",
    cwd          => "${install_dir}",
    creates      => "${install_dir}/${p}",
    user         => $user;
  } -> file { "${install_dir}/$pn":
    ensure       => "${install_dir}/${p}"
  }
}
