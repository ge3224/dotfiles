### Firefox/Librewolf

#### Hiding the tab bar: 

1. Add a folder named "chrome" to local profile: 

- `/home/ge3/.librewolf/eokwj63q.default-release/chrome`
- `/home/ge3/.mozilla/firefox/2jxbmuc5.default-release/chrome`

2. Inside the "chrome" folder create a file named `userChrome.css` and add the following: 

```
/* hides the native tabs */
#TabsToolbar {
  visibility: collapse;
}
```

3. In the browser's address bar type `about:config`, bypass the warning, and search for "userprof".
4. Enable `toolkit.legacyUserProfileCustomizations.stylesheets`
5. Restart firefox

REF:

- https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome

