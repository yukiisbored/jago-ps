{ name = "jago"
, dependencies =
  [ "console", "effect", "foldable-traversable", "prelude", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
