== Terminal Commands ==

I had to sterilize the words.orig.txt file in order to make it useful. I ran:

```
grep -x '^[a-z]\{5,7\}' words.orig.txt > words_filtered.txt
```

Get lowercase lines of length 5-7

Now I need to remove words that will be jumble duplicates but that will be easier to do in ruby.

# Changes 1/6/24

* Only redeploying in order to upgrade heroku stack.
