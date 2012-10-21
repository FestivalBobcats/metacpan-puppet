class metacpan {
    $perl = "perl-5.16.1"    
    include metacpan::packages
    metacpan::user { metacpan: }
    metacpan::perl {  $perl: }
    include metacpan::rrrclient
    # Load in, some of these do stuff, some just mean you
    # can use the sub class from nodes.pp
    include metacpan::ssh
    include metacpan::configs
    include metacpan::cron
    include metacpan::website
}
