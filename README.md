# Flutter/BoxPik Hello world#

### REFERENCES:
- Flutter Cookbook, Simone Alessandria, Brian Kayfitz
- https://levelup.gitconnected.com/login-page-ui-in-flutter-65210e7a6c90
- https://stackoverflow.com/a/56712093/421195
- https://medium.com/@anilcan/how-to-use-dynamic-home-page-in-flutter-83080da07012
- https://www.section.io/engineering-education/flutter-folder-organization/



### BoxPik (Java/Android): 
```
  A/S > Nexus S API 27 > 
  - Login >
      email=***, pwd=***, [Login with EMail] >
  - Home >
    - Main:  { Trending Pools || Trending Prizes || Trending Captains }
        <= All empty...
    - Info:
        Pools: NONE, 
        Prizes: NONE, 
        Captains: MANY, 
        Promote users: MANY,
        My pools: MANY,
        Prize Wallet: "No Prize Wallet Details Found", 
        Pools to Score: SEVERAL, 
        About BoxPik: Version info
```

### Create project:
```  
  cd $PROJ; flutter create bphw1; cd bphw1; code .
  main.dart =>
    MyApp => BPHWApp1, title => 'BoxPik Hello World #1', [Run]
```
  TBD:
  - Login screen > login
  - "Illegal username/password" alert, Route login => main page
  - API requests > Data screen
  - Boxpik logo; user avatar

### Track changes, Git:
```
  cd $PROJ\bphw1
    <= Project automatically includes a ".gitignore"
  Git bash (local)> 
    git init .
    git add .
    git commit -m 'BoxPik "Hello World"...'
    <= Initial checkin
  Create "bphw1" repo on GitHub
    git remote add origin git@github.com:paulsm4/bphw1.git
    git push --set-upstream origin master
```
### Project structure:
```
+---\
|    .gitignore
|    .metadata
|    .packages
|    pubspec.yaml
|    README.md
+---.dart_tool
|   \---flutter_build
+---.idea
+---android
+---assets
|   \---images
|           boxpik_splash_image.png
+---build
+---ios
+---lib
|   |   main.dart
|   |   globals.dart
|   +---screens
|   |       login_page.dart
|   |       summary_page.dart
|   \---services
|           boxpik_service.dart
+---test
\---web
```
    