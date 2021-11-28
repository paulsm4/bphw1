* Flutter/BoxPik Hello world:
  REFERENCES:
    https://levelup.gitconnected.com/login-page-ui-in-flutter-65210e7a6c90
    https://stackoverflow.com/a/56712093/421195
    https://medium.com/@anilcan/how-to-use-dynamic-home-page-in-flutter-83080da07012
    Flutter Cookbook, Simone Alessandria, Brian Kayfitz: Chap 5/pg 196

  - BoxPik:
      A/S > Nexus S API 27 > 
      - Login >
          email=***, pwd=***, [Login with EMail] >
      - Home >
        - Main:  { Trending Pools || Trending Prizes || Trending Captains }
            <= All empty...
        - Pools: NONE, Prizes: NONE, Captains: MANY, Promote users: MANY, My pools: MANY,
            Prize Wallet: "No Prize Wallet Details Found", Pools to Score: SEVERAL, About BoxPik: Version info

  - Create project:
    - cd $RKAKOS\proj; flutter create bphw1; cd bphw1; code .
    - main.dart =>
       MyApp => BPHWApp1, title => 'BoxPik Hello World #1', [Run]
    TBD:
    - Login screen > login
    - "Illegal username/password" alert, Route login => main page
    - API requests > Data screen
    - Boxpik logo; user avatar

  - Track changes, Git:
      cd C:\paul\rkakos\proj\bphw1
        <= Project automatically includes a ".gitignore"
      Git bash > git init .
      git add .; git commit -m 'BoxPik "Hello World": Initial scaffolding project (flutter create bphw1)'
        <= Initial checkin

  - Refactored => { LoginPage, SummaryPage, AuthService }
    
    