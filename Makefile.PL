#!/usr/bin/env perl

use inc::Module::Install;

name 'OpenData';
license 'perl';
version_from 'lib/OpenData.pm';

requires 'Moose';
requires 'MooseX::Traits';

requires 'namespace::autoclean';
requires 'Text::CSV';
requires 'Scalar::Util';
requires 'List::MoreUtils';
requires 'LWP::Curl';
requires 'HTML::TreeBuilder::XPath';
requires 'DBI';
requires 'DBD::SQLite';
requires 'MongoDB';
requires 'WWW::Mechanize';
requires 'aliased';
requires 'version' => 0.86;
requires 'DataFlow' => '0.91.04';

recommends 'Text::CSV_XS' => '0.50';

test_requires 'Test::More';
test_requires 'Test::Pod' => '1.41';
test_requires 'Test::Pod::Coverage' => '1.08';
test_requires 'Pod::Coverage::TrustPod';
test_requires 'Test::UseAllModules';

tests 't/*.t t/*/*t t/*/*/*t t/*/*/*/*t';

auto_install;
WriteAll;

