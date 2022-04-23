# utils
Random utils for making life easier 

## seed_key

Seeds key to some server from `~/.ssh/config` file. Idea is to nickname your servers, and that nickname will be used for key that is generated and pushed to the server. Additionally, key rotation is supported using additional `clean_old_keys` that leaves the key that was last added to authorized keys for specific username@hostname.

### Usage

Make sure `~/.ssh` exists.

From the repository folder:
```
cp seed_key clean_old_keys ~/.ssh
chmod +x ~/.ssh/seed_key
```

Create entry in '~/.ssh/config' that resembles the following:

```
Host prika
    Hostname prika.my.domain.com 
    User user_that_exists_on_prika
    IdentityFile ~/.ssh/server_keys/prika <- this has to be same as in Host definition
```

Next run the script `./seed_key prika`, if everything is fine, you will need to type in password only once. After that you can `ssh prika` and things should work as expected. To rotate the key on `prika`, just run `./seed_key prika` from `~/.ssh` directory again. Action should be performed without any user input.

## get_committed_lines.sh

Reports how many lines commiter with some email commited to the repository in a given time frame. 

Usage:
1. Copy the script in the git repository where you want to run it.
2. `./get_comitted_lines.sh -a 2019-01-01 -u 2020-03-10 -m commiter.mail@some.domain`


Notice that the date is in format yyyy-mm-dd
