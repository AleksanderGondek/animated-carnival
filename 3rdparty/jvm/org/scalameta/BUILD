java_library(
    name = "common_2_12",
    exports = [
        "//3rdparty/jvm/com/lihaoyi:sourcecode_2_12",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/org/scalameta/common_2_12",
        ":semanticdb_2_12"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "io_2_12",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/org/scalameta/io_2_12",
        ":common_2_12"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "semanticdb_2_12",
    exports = [
        "//3rdparty/jvm/com/thesamet/scalapb:scalapb_runtime_2_12",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/org/scalameta/semanticdb_2_12"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



scala_import(
    name = "semanticdb_javac",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":io_2_12",
        ":semanticdb_2_12"
    ],
    jars = [
        "//external:jar/org/scalameta/semanticdb_javac_2_12"
    ],
    visibility = [
        "//visibility:public"
    ]
)


