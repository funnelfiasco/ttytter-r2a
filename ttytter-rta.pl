$addaction = sub {
    my @command = split(/ /,$_,3);

    if ( ( $command[0] eq '/replyall' ) || ( $command[0] eq '/rta' ) ) {
		my $tweet_id = $command[1];
		my $tweet = &get_tweet($tweet_id);
        my $witty_reply = $command[2];
		if (!$tweet->{'id_str'}) {
            print $stdout "-- You have to wait for that tweet to exist!\n";
            return 1;
        }
		$screen_name = &descape($tweet->{'user'}->{'screen_name'});

		# Who is mentioned in the tweet?
		my $reply_tweet = $tweet->{'text'};
		my $mentioned;
		# We iterate over the string because I can't think of a better way
		print "DEBUG who am i? $whoami\n";
		while ( $reply_tweet =~ m/(@\w+)/g ) {
			# Don't add yourself to the reply list, or the person you're
			# replying to, since they'll be added anyway
			unless ( ( $1 eq "\@$whoami" ) || ( $1 eq "\@$screen_name" ) ) {
				$mentioned .= "$1 ";
			} else { print "Skipping $1 by policy!\n"; }
		}
		print "Here's the mentioned users: $mentioned\n";

		# We're replying, so we'd better act like it
		$in_reply_to = $tweet->{'id_str'};

		# Do it!
		$witty_reply = "\@$screen_name $mentioned $witty_reply";
		&common_split_post($witty_reply, $in_reply_to, undef);
		# All done!
		return 1;
    }

	# You didn't ask to reply to all. Tell TTYtter that we don't want to deal
	# with this input.
	return 0;
};

