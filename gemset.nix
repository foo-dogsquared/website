{
  asciidoctor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11z3vnd8vh3ny1vx69bjrbck5b2g8zsbj94npyadpn7fdp8y3ldv";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.0.18";
  };
  asciidoctor-foodogsquared-extensions = {
    dependencies = ["asciidoctor"];
    groups = ["default"];
    platforms = [];
    source = {
      path = "gems";
      target = "ruby";
      type = "path";
    };
    targets = [];
    version = "1.0.0";
  };
  asciidoctor-html5s = {
    dependencies = ["asciidoctor" "thread_safe"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zfbfcqyrsk8bnd526ang3b4j3m5pbns7x3fdxarrm8vv1qplss1";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.1";
  };
  asciidoctor-rouge = {
    dependencies = ["asciidoctor" "rouge"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "197sbzs9km58pgfqdnnglhqr7anhb0m330cv1vxfc3s2qz106zjz";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.4.0";
  };
  rouge = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dnfkrk8xx2m8r3r9m2p5xcq57viznyc09k7r3i4jbm758i57lx3";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.30.0";
  };
  thread_safe = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.6";
  };
}