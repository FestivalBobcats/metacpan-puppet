node bm-n2 {
    $perlbin = "/usr/local/perlbrew/perls/perl-5.16.2/bin"
    $apiworkers = 10
    $wwwworkers = 7

    include metacpan::munin
    include metacpan
    include metacpan::rrrclient
    include metacpan::exim
    include metacpan::user::admins
    include metacpan::cron::api
    include metacpan::cron::clean_up_source
    include metacpan::web::vmbox

    # Only need this on live really atm
    # probably going to be replaced by Mo's JS version
    include metacpan::web::explorer

    elasticsearch { "0.20.2": memory  => 18000 }
}
