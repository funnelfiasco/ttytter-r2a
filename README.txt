ttytter-r2a.pl -- a TTYtter extension

	Copyright (C) 2011 by Ben Cotton
	Licensed under GNU Public License v2.0. See LICENSE.txt for 
		full license.

	Project website: https://github.com/funnelfiasco/ttytter-r2a

ttytter-r2a.pl is an extension that adds "reply-to-all" functionality to 
TTYtter. The usage is identical to the built-in '/reply' command. To reply to
all users mentioned in a tweet, the syntax is:
  /replytoall <tweet_id> <reply_status>

For example:
  /replytoall f2 oh yeah? Well check out this cool @TTYtter extension I wrote!

The lazy typist can also use /replyall or /ra. Commands are case-insensitive
for the benefit of users running a DRUNKHULK-type account or who really like to
yell at others on the Internet.

The list of matched user names does not include the sender of the tweet being
replyed to, nor does it include the user name that TTYtter is running under.
User matching is done by a simple regular expression ("@\w+"), so it's possible
that sometimes you'll miss a user name or add a spurious one. 

The actual posting of the reply is still handled with native TTYtter functions
(common_split_post, if you're curious), so any sending-related settings you
have configured will be honored.
