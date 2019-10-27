load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary")
load("@andyscott_rules_bloop//bloop:bloop.bzl", "bloop")

scala_binary(
    name = "app",
    srcs = glob(["src/main/scala/**/*.scala"]),
    main_class = "HelloWorld",
    plugins = [
      "//3rdparty/jvm/org/scalameta:semanticdb_javac",
    ],
    # scalacopts = [
    #     "-P:semanticdb:sourceroot:/home/agondek/Projects/animated-carnival"
    # ],
)

bloop(
    name = "bloop",
    targets = [
        ":app",
    ]
)
