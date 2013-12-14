#!/usr/bin/perl -w

#  -------------+
#  Purpose      : Short description of script
#                 - list of features
#  Command Line :
#  Inputs       : Options:
#               :    --debug: additional outputs for script debug mode
#               : Params:
#               :    None
#               : File(s):
#               :   list of files used by script
#  Outputs      : 0 - On success
#               : 1 - Failed
#  Author       : YOUR NAME
#  Orig Date    : DD MON YYYY
#  -------------+

# Standard Libraries
use strict;
use warnings;
use File::Basename;
use Getopt::Long;
use Sys::Hostname;

# Initialize Local Vars
my $STRINGVAR='';
my $NUMVAR=0;
my $HOSTNAME=`/bin/uname -n`;
chop $HOSTNAME;
#my $WHOAMI=`/usr/bin/whoami`;
#hop $WHOAMI;
my $Script_Name = basename($0);
my ($debug);
my ($help);
my $TIMESTAMP=`date "+%Y-%m-%d-%H%M%S"`;
chop $TIMESTAMP;
my $exitStatus=0;

##############################################################################
## -------------+
## Name         : Subroutine Usage
## Purpose      : Displays Subroutine usage
## Inputs       : None
## Outputs      : None
## -------------+
##############################################################################
sub Usage {
    print <<EOM;

    $Script_Name [-d/ebug]

        -d/ebug  --> Displays additional output for script debug purposes
        -h/elp  --> Displays usage information

EOM
exit 1;
}

GetOptions ( "help" => \$help,    # -help
             "debug" => \$debug)
                || Usage();
Usage() if $help;

#
# Create and open the LOGFILE for this host
#
open LOGFILE, ">/tmp/APP_$HOSTNAME.$TIMESTAMP" or die $!;

if ($debug) {
    print "DEBUG: $TIMESTAMP\n";
}

# print HEADER
print LOGFILE "Script to verify status of $Script_Name on host $HOSTNAME.\n";
print "Script to verify status of $Script_Name on host $HOSTNAME.\n";

#
# Open the host list file to configure Gerrit Server, Ports and Links
#

open(my $LIST, 'list') or die "Could not open list file";

while(<$LIST>) {

    my @line = split(' ', $_);
    my $ITEM1=$line[0];
    my $ITEM2=$line[1];
    my $ITEM3=$line[2];
    my $ITEM4=$line[3];


    if ("$ITEM1" eq "$ITEM2") {

        my $FOUNDINITEM=1;  # set found in list to yes

        if ($debug) {
            print "DEBUG: hostname=$HOSTNAME\n";
        } # if 

    } #if
} #while

#
# Print final messages and close LOGFILE
#

if ("$exitStatus" != 1) {
    print LOGFILE "COMPLETE: $0 has completed. \n";
    print "COMPLETE: $0 has completed. \n";
} #if
else {
    print LOGFILE "COMPLETE: $0 has completed with ERRORS. \n";
    print "COMPLETE: $0 has completed with ERRORS. \n";
} #else
    print LOGFILE "The logfile on host $HOSTNAME => /tmp/GERRIT_APPVAL_$HOSTNAME.$TIMESTAMP \n";
    print "The logfile on host $HOSTNAME => /tmp/GERRIT_APPVAL_$HOSTNAME.$TIMESTAMP \n";
close LOGFILE;
close $LIST;

if ($debug) {
    print "DEBUG: The end, finito, caput!!!\n";
    print "DEBUG: $0 is complete. \n\n";
    print "DEBUG: The logfile on host $HOSTNAME => /tmp/GERRIT_APPVAL_$HOSTNAME.$TIMESTAMP \n\n";
} #if

#
# End of script
#
