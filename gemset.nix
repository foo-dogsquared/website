{
  asciidoctor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yblqlbix3is5ihiqrpbfazb44in7ichfkjzdbsqibp48paanpl3";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.0.20";
  };
  asciidoctor-bibtex = {
    dependencies = ["asciidoctor" "bibtex-ruby" "citeproc-ruby" "csl-styles" "latex-decode"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fx80bpykixvnlscyz2c4dnjr1063r5ar7j1zn2977vsr8fi8ial";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.8.0";
  };
  asciidoctor-diagram = {
    dependencies = ["asciidoctor" "asciidoctor-diagram-ditaamini" "asciidoctor-diagram-plantuml" "rexml"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cxvp1b6iild25f5sf5qi5dak9l9fgr2h81rsrsdxi6bwq5xls0n";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.2.8";
  };
  asciidoctor-diagram-ditaamini = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13h65bfbq7hc7z3kqn0m28w9c6ap7fikpjcvsdga6jg01slb4c56";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.3";
  };
  asciidoctor-diagram-plantuml = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1firh66ig61ibailzvrmvnwn5n099v2wlzlfzpg0qilqs6nl9s9w";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2023.5";
  };
  asciidoctor-foodogsquared-extensions = {
    dependencies = ["asciidoctor" "open-uri-cached" "rugged"];
    groups = ["default"];
    platforms = [];
    source = {
      path = "gems";
      type = "path";
    };
    targets = [];
    version = "1.0.0";
  };
  ast = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.4.2";
  };
  bibtex-ruby = {
    dependencies = ["latex-decode"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0adh2x935r69nm8qmns5fjsjw034xlyaqddzza2jr2npvf41g34r";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.1.6";
  };
  citeproc = {
    dependencies = ["namae"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13vl5sjmksk5a8kjcqnjxh7kn9gn1n4f9p1rvqfgsfhs54p0m6l2";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.10";
  };
  citeproc-ruby = {
    dependencies = ["citeproc" "csl"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0a8ahyhhmdinl4kcyv51r74ipnclmfyz4zjv366dns8v49n5vkk3";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.1.14";
  };
  concurrent-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0krcwb6mn0iklajwngwsg850nk8k9b35dhmc2qkbdqvmifdi2y9q";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2.2";
  };
  csl = {
    dependencies = ["namae" "rexml"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0n8iqmzvvqy2b1wfr4c7yj28x4z3zgm36628y8ybl49dgnmjycrk";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.0";
  };
  csl-styles = {
    dependencies = ["csl"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l29qlk7i74088fpba5iqhhgiqkj7glcmc42nbmvgqysx577nag8";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.1.11";
  };
  json = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nalhin1gda4v8ybk6lq8f407cgfrj6qzn234yra4ipkmlbfmal6";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.6.3";
  };
  language_server-protocol = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gvb1j8xsqxms9mww01rmdl78zkd72zgxaap56bhv8j45z05hp1x";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.17.0.3";
  };
  latex-decode = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1y5xn3zwghpqr6lvs4s0mn5knms8zw3zk7jb58zkkiagb386nq72";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.4.0";
  };
  namae = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j3nl1klkx3gymrdxfc1hlq4a8qlvhhl9aj5v1v08b9fz27sky0l";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.1.1";
  };
  open-uri-cached = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03v0if3jlvbclnd6jgjk94fbhf0h2fq1wxr0mbx7018sxzm0biwr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.0";
  };
  parallel = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jcc512l38c0c163ni3jgskvq1vc3mr8ly5pvjijzwvfml9lf597";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.23.0";
  };
  parser = {
    dependencies = ["ast"];
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08f89nssj7ws7sjfvc2fcjpfm83sjgmniyh0npnmpqf5sfv44r8x";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2.2.1";
  };
  prettier_print = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ybgks9862zmlx71zd4j20ky86fsrp6j6m0az4hzzb1zyaskha57";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2.1";
  };
  rainbow = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.1.1";
  };
  rake = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15whn7p9nrkxangbs9hh75q585yfn66lv0v2mhj6q6dl6x8bzr2w";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "13.0.6";
  };
  regexp_parser = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17xizkw5ryw8hhq64iqxmzdrrdxpc5lhkqc1fgm1aj0zsk1r2950";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.8.0";
  };
  rexml = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08ximcyfjy94pm1rhcx04ny1vx2sk0x4y185gzn86yfsbzwkng53";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2.5";
  };
  rouge = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jzx6ni3bjdajc9y4w6mclq165jwiypbxkav2k0gbag7ip93xk21";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "4.1.1";
  };
  rubocop = {
    dependencies = ["json" "parallel" "parser" "rainbow" "regexp_parser" "rexml" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = ["lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0013mnzj6ql3v8nif7fm8n2832jnwa46azync6azsg9d4iblrfmy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.51.0";
  };
  rubocop-ast = {
    dependencies = ["parser"];
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gs8zjigzdqj0kcmmrhvd4zavwr6kz6h9qvrh9m7bhy56f4aqljs";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.28.1";
  };
  ruby-lsp = {
    dependencies = ["language_server-protocol" "sorbet-runtime" "syntax_tree"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x6iq8mkcqbsw3s8w3l441mqj6ifziqx2bvfl1qxnadg9hfyw4qd";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.1";
  };
  ruby-progressbar = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cwvyb7j47m7wihpfaq7rc47zwwx9k4v7iqd9s1xch5nm53rrz40";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.13.0";
  };
  rugged = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "016bawsahkhxx7p8azxirpl7y2y7i8a027pj8910gwf6ipg329in";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.3";
  };
  slim = {
    dependencies = ["temple" "tilt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0np6jr8apbyvr20ylb6n4m27y4d4vkdm7h41qrf5mdxw00x5irjl";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.1.1";
  };
  sorbet-runtime = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vzqiy60p9y3j01fmcwv32bj2azg15i6wfk7d4h0l36ca0ss1xga";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.10832";
  };
  syntax_tree = {
    dependencies = ["prettier_print"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "162m5xhbiq315bncp49ziddws537dv09pqsgrzsrmhhsymhgy0zb";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "6.1.1";
  };
  temple = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jj8lny5hp8gm920k73r6xpb40j5mpiw1dcr8g5id4hxjggkw8by";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.10.1";
  };
  tilt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qmhi6d9przjzhsyk9g5pq2j75c656msh6xzprqd2mxgphf23jxs";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.1.0";
  };
  unicode-display_width = {
    groups = ["default" "lint"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gi82k102q7bkmfi7ggn9ciypn897ylln1jk9q67kjhr39fj043a";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.4.2";
  };
}