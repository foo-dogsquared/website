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
  asciidoctor-bibtex = {
    dependencies = [ "asciidoctor" "bibtex-ruby" "citeproc-ruby" "csl-styles" "latex-decode" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fx80bpykixvnlscyz2c4dnjr1063r5ar7j1zn2977vsr8fi8ial";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.8.0";
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
  asciidoctor-tabs = {
    dependencies = [ "asciidoctor" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      fetchSubmodules = false;
      rev = "d5ee94b5253f4db75e6646f46511676af0be2cc3";
      sha256 = "1s2ds0f3v308vw4ic5dm6zh8d7dbi6lxxw6y7ajb8hmm27d0nksi";
      target = "ruby";
      type = "git";
      url = "https://github.com/asciidoctor/asciidoctor-tabs.git";
    };
    targets = [ ];
    version = "1.0.0.beta.3";
  };
  ast = {
    groups = [ "default" "lint" ];
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
  bibtex-ruby = {
    dependencies = [ "latex-decode" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0adh2x935r69nm8qmns5fjsjw034xlyaqddzza2jr2npvf41g34r";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "5.1.6";
  };
  citeproc = {
    dependencies = [ "namae" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "13vl5sjmksk5a8kjcqnjxh7kn9gn1n4f9p1rvqfgsfhs54p0m6l2";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.0.10";
  };
  citeproc-ruby = {
    dependencies = [ "citeproc" "csl" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0a8ahyhhmdinl4kcyv51r74ipnclmfyz4zjv366dns8v49n5vkk3";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.1.14";
  };
  concurrent-ruby = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0krcwb6mn0iklajwngwsg850nk8k9b35dhmc2qkbdqvmifdi2y9q";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.2.2";
  };
  csl = {
    dependencies = [ "namae" "rexml" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0n8iqmzvvqy2b1wfr4c7yj28x4z3zgm36628y8ybl49dgnmjycrk";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.6.0";
  };
  csl-styles = {
    dependencies = [ "csl" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0l29qlk7i74088fpba5iqhhgiqkj7glcmc42nbmvgqysx577nag8";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.0.1.11";
  };
  ffi = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      fetchSubmodules = false;
      rev = "98cce6a671e333fcb6b6eeeb821885f03d0e2fa5";
      sha256 = "19bv7fjbqp71aar38jn9brhslqqalsj92ck2ras5c1izvhx8jk2l";
      target = "ruby";
      type = "git";
      url = "https://github.com/ffi/ffi.git";
    };
    targets = [ ];
    version = "1.15.5";
  };
  json = {
    groups = [ "default" "lint" ];
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
  latex-decode = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1y5xn3zwghpqr6lvs4s0mn5knms8zw3zk7jb58zkkiagb386nq72";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.4.0";
  };
  namae = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1j3nl1klkx3gymrdxfc1hlq4a8qlvhhl9aj5v1v08b9fz27sky0l";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.1.1";
  };
  open-uri-cached = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "03v0if3jlvbclnd6jgjk94fbhf0h2fq1wxr0mbx7018sxzm0biwr";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.0.0";
  };
  parallel = {
    groups = [ "default" "lint" ];
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
    groups = [ "default" "lint" ];
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
    groups = [ "default" "lint" ];
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
  rake = {
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "15whn7p9nrkxangbs9hh75q585yfn66lv0v2mhj6q6dl6x8bzr2w";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "13.0.6";
  };
  regexp_parser = {
    groups = [ "default" "lint" ];
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
    groups = [ "default" "lint" ];
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
    groups = [ "lint" ];
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
    groups = [ "default" "lint" ];
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
    groups = [ "default" "lint" ];
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
  rugged = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "016bawsahkhxx7p8azxirpl7y2y7i8a027pj8910gwf6ipg329in";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "1.6.3";
  };
  slim = {
    dependencies = [ "temple" "tilt" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1rp437r8hr9kdgabb7c96yw4z2wyrajl4cxiij038y10f8i6hbn4";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "5.1.0";
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
  temple = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "07k5wr2ypsmsbyc9d1plhdki4xr7vvggld8r1i49iljkrpx5nbqc";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "0.10.0";
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
  tilt = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1qmhi6d9przjzhsyk9g5pq2j75c656msh6xzprqd2mxgphf23jxs";
      target = "ruby";
      type = "gem";
    };
    targets = [ ];
    version = "2.1.0";
  };
  tree_sitter_ffi = {
    dependencies = [ "ffi" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      fetchSubmodules = false;
      rev = "e15c2b93df0b9b5c8233c61158fe213d63553902";
      sha256 = "0hqb80pdjlz1864nivr1vkq0lxp4x23v4ah1mq50lapbxpqhlhzb";
      target = "ruby";
      type = "git";
      url = "https://github.com/calicoday/ruby-tree-sitter-ffi.git";
    };
    targets = [ ];
    version = "0.0.5";
  };
  unicode-display_width = {
    groups = [ "default" "lint" ];
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
