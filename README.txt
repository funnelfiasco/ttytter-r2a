ttytter-r2a.pl -- a TTYtter extension

	Copyright (C) 2013 by Ben Cotton and others
	Licensed under GNU Public License v2.0. See LICENSE.txt for 
		full license.

	Project website: https://github.com/funnelfiasco/ttytter-r2a

Note: as of TTYtter version 2.2, the reply-to-all functionality has been added
mainline TTYtter. The "sandwiched" mode added by Thameera Senanayaka for
ttytter-r2a.pl version 1.1 is not currently in the mainline TTYtter.

ttytter-r2a.pl is an extension that adds "reply-to-all" functionality to 
TTYtter. The usage is identical to the built-in '/reply' command. To reply to
all users mentioned in a tweet, the syntax is:
  /replytoall <tweet_id> <reply_status>

For example:
  /replytoall f2 oh yeah? Well check out this cool @TTYtter extension I wrote!

The lazy typist can also use /replyall or /ra. Commands are case-insensitive
for the benefit of users running a DRUNKHULK-type account or who really like to
yell at others on the Internet.

By default, this extension will format the reply in the format '@screen_name
@mentioned witty_reply'. However, if you want the reply sandwiched, like
'@screen_name witty_reply @mentioned', you can use /rasw.

The list of matched user names does not include the sender of the tweet being
replyed to, nor does it include the user name that TTYtter is running under.
User matching is done by a simple regular expression ("@\w+"), so it's possible
that sometimes you'll miss a user name or add a spurious one. 

The actual posting of the reply is still handled with native TTYtter functions
(common_split_post, if you're curious), so any sending-related settings you
have configured will be honored.
