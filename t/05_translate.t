#
# $Id$

use strict;

use Test::More skip_all => "Free Google Translate service was withdrawn";
# skipping these 4 tests due to withdrawal of free Google Translate service - see https://github.com/esobchenko/rest-google/issues/1

use REST::Google::Translate;

REST::Google::Translate->http_referer('http://www.cpan.org');

use Data::Dumper;

# The official google blog
my $en_text_ok = 'hello';
my $it_text_ok = 'ciao';

my $res = REST::Google::Translate->new(
	q => $en_text_ok,
	langpair => 'en|it'
);

is($res->responseStatus, 200, "response ok");
ok(defined $res, "result");

my $it_text = $res->responseData->translatedText;

is( $it_text,  $it_text_ok, "translate ok");

$res = REST::Google::Translate->new(
	q => $it_text,
	langpair => 'it|en'
);

my $en_text = $res->responseData->translatedText;

is( $en_text,  $en_text_ok, "translate ok");

