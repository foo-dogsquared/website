{
  asciidoctor = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "11z3vnd8vh3ny1vx69bjrbck5b2g8zsbj94npyadpn7fdp8y3ldv";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.0.18";
  };
  asciidoctor-foodogsquared-extensions = {
    dependencies = [ "asciidoctor" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      path = "gems";
      target = "ruby";
      type = "path";
    };
    targets = [ ];
    version = "1.0.0";
  };
  asciidoctor-html5s = {
    dependencies = [ "asciidoctor" "thread_safe" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1zfbfcqyrsk8bnd526ang3b4j3m5pbns7x3fdxarrm8vv1qplss1";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.5.1";
  };
  asciidoctor-rouge = {
    dependencies = [ "asciidoctor" "rouge" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "197sbzs9km58pgfqdnnglhqr7anhb0m330cv1vxfc3s2qz106zjz";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.4.0";
  };
  asciidoctor-tabs = {
    dependencies = ["asciidoctor"];
    groups = ["default"];
    platforms = [];
    source = {
      fetchSubmodules = false;
      rev = "d5ee94b5253f4db75e6646f46511676af0be2cc3";
      sha256 = "1s2ds0f3v308vw4ic5dm6zh8d7dbi6lxxw6y7ajb8hmm27d0nksi";
      target = "ruby";
      type = "git";
      url = "https://github.com/asciidoctor/asciidoctor-tabs.git";
    };
    targets = [];
    version = "1.0.0.beta.3";
  };
  ast = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.4.2";
  };
  json = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0nalhin1gda4v8ybk6lq8f407cgfrj6qzn234yra4ipkmlbfmal6";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.6.3";
  };
  language_server-protocol = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0gvb1j8xsqxms9mww01rmdl78zkd72zgxaap56bhv8j45z05hp1x";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "3.17.0.3";
  };
  parallel = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "07vnk6bb54k4yc06xnwck7php50l09vvlw1ga8wdz0pia461zpzb";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.22.1";
  };
  parser = {
    dependencies = [ "ast" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cdjcasyg7w05kk82dqysq29f1qcf8y5sw8iak5flpxjbdil50qv";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "3.2.1.0";
  };
  prettier_print = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1bbw4czjr2ch6m57rgjib5a35hx3g18975vwzm2iwq13pvdj9hzk";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.2.0";
  };
  rainbow = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "3.1.1";
  };
  regexp_parser = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0d6241adx6drsfzz74nx1ld3394nm6fjpv3ammzr0g659krvgf7q";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.7.0";
  };
  rexml = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08ximcyfjy94pm1rhcx04ny1vx2sk0x4y185gzn86yfsbzwkng53";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "3.2.5";
  };
  rouge = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1dnfkrk8xx2m8r3r9m2p5xcq57viznyc09k7r3i4jbm758i57lx3";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "3.30.0";
  };
  rubocop = {
    dependencies = [ "json" "parallel" "parser" "rainbow" "regexp_parser" "rexml" "rubocop-ast" "ruby-progressbar" "unicode-display_width" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cf281n4c0k7ijn95cf8dj0scn5ypdl6vy5arxr6sp0mq91d541a";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.48.0";
  };
  rubocop-ast = {
    dependencies = [ "parser" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "16iabkwqhzqh3cd4pcrp0nqv4ks2whcz84csawi78ynfk12vd20a";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.27.0";
  };
  ruby-lsp = {
    dependencies = [ "language_server-protocol" "sorbet-runtime" "syntax_tree" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0pzy72mm26jdsiwb8h7l4phj6sjdgbfyr1cg1dx5c03pzlb4khgd";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.4.1";
  };
  ruby-progressbar = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cwvyb7j47m7wihpfaq7rc47zwwx9k4v7iqd9s1xch5nm53rrz40";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.13.0";
  };
  sorbet-runtime = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1pkc86a21pm05b4sry4159av7wywm7fz0w6ngcyrl6ld533xk327";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.5.10693";
  };
  syntax_tree = {
    dependencies = [ "prettier_print" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04mhd8y02mhmyra7vgi7a6p4q9lm8kl20fsq68qhjkbwdpbzl27h";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "6.0.1";
  };
  thread_safe = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.3.6";
  };
  unicode-display_width = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gi82k102q7bkmfi7ggn9ciypn897ylln1jk9q67kjhr39fj043a";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.4.2";
  };
}
