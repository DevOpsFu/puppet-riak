# == Class riak::repository
#
# This class selects a package repository to install
#
class riak::repository (
    $manage_repo = $::riak::manage_repo,
){

  if ($manage_repo) {
    case $::operatingsystem {
      'ubuntu': { include riak::repository::ubuntu }
      default: {
        case $::osfamily {
          'Redhat': { include riak::repository::el }
          'Debian': { include riak::repository::debian }
          default: { fail("No package repository is available for ${::osfamily}") }
        }
      }
    }
  }
}
