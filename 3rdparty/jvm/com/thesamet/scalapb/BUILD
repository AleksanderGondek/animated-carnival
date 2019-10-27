java_library(
    name = "lenses_2_12",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/thesamet/scalapb/lenses_2_12"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "scalapb_runtime_2_12",
    exports = [
        "//3rdparty/jvm/com/google/protobuf:protobuf_java",
        "//3rdparty/jvm/com/lihaoyi:fastparse_2_12",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/thesamet/scalapb/scalapb_runtime_2_12",
        ":lenses_2_12"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)


