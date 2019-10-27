# Do not edit. bazel-deps autogenerates this file from dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.google.protobuf:protobuf-java:3.5.1", "lang": "java", "sha1": "8c3492f7662fa1cbf8ca76a0f5eb1146f7725acd", "sha256": "b5e2d91812d183c9f053ffeebcbcda034d4de6679521940a19064714966c2cd4", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/google/protobuf/protobuf-java/3.5.1/protobuf-java-3.5.1.jar", "source": {"sha1": "7235a28a13938050e8cd5d9ed5133bebf7a4dca7", "sha256": "3be3115498d543851443bfa725c0c5b28140e363b3b7dec97f4028cd17040fa4", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/google/protobuf/protobuf-java/3.5.1/protobuf-java-3.5.1-sources.jar"} , "name": "com_google_protobuf_protobuf_java", "actual": "@com_google_protobuf_protobuf_java//jar", "bind": "jar/com/google/protobuf/protobuf_java"},
    {"artifact": "com.lihaoyi:fastparse-utils_2.12:1.0.0", "lang": "java", "sha1": "02900ec8460abec27913f4154b338e61fd482607", "sha256": "fb6cd6484e21459e11fcd45f22f07ad75e3cb29eca0650b39aa388d13c8e7d0a", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/lihaoyi/fastparse-utils_2.12/1.0.0/fastparse-utils_2.12-1.0.0.jar", "source": {"sha1": "891f76cff455350adc2f122421b67855f93c8dc3", "sha256": "19e055e9d870f2a2cec5a8e0b892f9afb6e4350ecce315ca519458c4f52f9253", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/lihaoyi/fastparse-utils_2.12/1.0.0/fastparse-utils_2.12-1.0.0-sources.jar"} , "name": "com_lihaoyi_fastparse_utils_2_12", "actual": "@com_lihaoyi_fastparse_utils_2_12//jar", "bind": "jar/com/lihaoyi/fastparse_utils_2_12"},
    {"artifact": "com.lihaoyi:fastparse_2.12:1.0.0", "lang": "java", "sha1": "2473a344aa1200fd50b7ff78281188c172f9cfcb", "sha256": "1227a00a26a4ad76ddcfa6eae2416687df7f3c039553d586324b32ba0a528fcc", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/lihaoyi/fastparse_2.12/1.0.0/fastparse_2.12-1.0.0.jar", "source": {"sha1": "b1fdfd4c95bdb3f49ec78837be78d657a5ac86c0", "sha256": "290c1e9a4bad4d3724daec48324083fd0d97f51981a3fabbf75e2de1303da5ca", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/lihaoyi/fastparse_2.12/1.0.0/fastparse_2.12-1.0.0-sources.jar"} , "name": "com_lihaoyi_fastparse_2_12", "actual": "@com_lihaoyi_fastparse_2_12//jar", "bind": "jar/com/lihaoyi/fastparse_2_12"},
    {"artifact": "com.lihaoyi:sourcecode_2.12:0.1.4", "lang": "java", "sha1": "ef9a771975cb0860f2b42778c5cf1f5d76818979", "sha256": "9a3134484e596205d0acdcccd260e0854346f266cb4d24e1b8a31be54fbaf6d9", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/lihaoyi/sourcecode_2.12/0.1.4/sourcecode_2.12-0.1.4.jar", "source": {"sha1": "ffb135dacaf0d989c260a486c8b86867bcab2e22", "sha256": "c5c53ba31a9f891988f9e21595e8728956be22d9ab9442e140840d0a73be8261", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/lihaoyi/sourcecode_2.12/0.1.4/sourcecode_2.12-0.1.4-sources.jar"} , "name": "com_lihaoyi_sourcecode_2_12", "actual": "@com_lihaoyi_sourcecode_2_12//jar", "bind": "jar/com/lihaoyi/sourcecode_2_12"},
    {"artifact": "com.thesamet.scalapb:lenses_2.12:0.8.0-RC1", "lang": "java", "sha1": "63f6dfbea05fa9793e20368d5b563db9b9444f16", "sha256": "6e061e15fa9f37662d89d1d0a3f4da64c73e3129108b672c792b36bf490ae8e2", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/thesamet/scalapb/lenses_2.12/0.8.0-RC1/lenses_2.12-0.8.0-RC1.jar", "source": {"sha1": "05b9aeff30f2b2fbc3682eefd05743577769ee4d", "sha256": "cf2899b36193b3fa7b99fd0476aca8453f0c4bd284d37da8a564cfbc69f24244", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/thesamet/scalapb/lenses_2.12/0.8.0-RC1/lenses_2.12-0.8.0-RC1-sources.jar"} , "name": "com_thesamet_scalapb_lenses_2_12", "actual": "@com_thesamet_scalapb_lenses_2_12//jar", "bind": "jar/com/thesamet/scalapb/lenses_2_12"},
    {"artifact": "com.thesamet.scalapb:scalapb-runtime_2.12:0.8.0-RC1", "lang": "java", "sha1": "f9879e234145d4e9e9874509a538f3d64ad205ac", "sha256": "d922c788c8997e2524a39b1f43bac3c859516fc0ae580eab82c0db7e40aef944", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/thesamet/scalapb/scalapb-runtime_2.12/0.8.0-RC1/scalapb-runtime_2.12-0.8.0-RC1.jar", "source": {"sha1": "ea3d3cb5b134aef3a22ce41dd99ce4271ac5e6b0", "sha256": "fbc11c3ceffbd1d146c039e40c34fe8aa9b467f15f91668ebfe796c4cd0b91e4", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/com/thesamet/scalapb/scalapb-runtime_2.12/0.8.0-RC1/scalapb-runtime_2.12-0.8.0-RC1-sources.jar"} , "name": "com_thesamet_scalapb_scalapb_runtime_2_12", "actual": "@com_thesamet_scalapb_scalapb_runtime_2_12//jar", "bind": "jar/com/thesamet/scalapb/scalapb_runtime_2_12"},
# duplicates in org.scala-lang:scala-library promoted to 2.12.8
# - com.lihaoyi:fastparse-utils_2.12:1.0.0 wanted version 2.12.3
# - com.lihaoyi:fastparse_2.12:1.0.0 wanted version 2.12.3
# - com.lihaoyi:sourcecode_2.12:0.1.4 wanted version 2.12.2
# - com.thesamet.scalapb:lenses_2.12:0.8.0-RC1 wanted version 2.12.6
# - com.thesamet.scalapb:scalapb-runtime_2.12:0.8.0-RC1 wanted version 2.12.6
# - org.scalameta:common_2.12:4.1.6 wanted version 2.12.8
# - org.scalameta:io_2.12:4.1.6 wanted version 2.12.8
# - org.scalameta:semanticdb-javac_2.12:4.1.6 wanted version 2.12.8
# - org.scalameta:semanticdb_2.12:4.1.6 wanted version 2.12.8
    {"artifact": "org.scala-lang:scala-library:2.12.8", "lang": "java", "sha1": "36b234834d8f842cdde963c8591efae6cf413e3f", "sha256": "321fb55685635c931eba4bc0d7668349da3f2c09aee2de93a70566066ff25c28", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scala-lang/scala-library/2.12.8/scala-library-2.12.8.jar", "source": {"sha1": "45ccb865e040cbef5d5620571527831441392f24", "sha256": "11482bcb49b2e47baee89c3b1ae10c6a40b89e2fbb0da2a423e062f444e13492", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scala-lang/scala-library/2.12.8/scala-library-2.12.8-sources.jar"} , "name": "org_scala_lang_scala_library", "actual": "@org_scala_lang_scala_library//jar", "bind": "jar/org/scala_lang/scala_library"},
    {"artifact": "org.scalameta:common_2.12:4.1.6", "lang": "java", "sha1": "34c19fe6e9141bb8014453af7706c58844f58468", "sha256": "4bcf81a9734c14e881dd62d3934127b3dbfd8fdb5603cad249a4ec73492af0de", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scalameta/common_2.12/4.1.6/common_2.12-4.1.6.jar", "source": {"sha1": "84454c925612885d0ffba8fcbdba4cd7d19e0721", "sha256": "d7f71a0ebd2ec659c19c82974e09da5afd5598aa4bc4c59a624959845ca97c72", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scalameta/common_2.12/4.1.6/common_2.12-4.1.6-sources.jar"} , "name": "org_scalameta_common_2_12", "actual": "@org_scalameta_common_2_12//jar", "bind": "jar/org/scalameta/common_2_12"},
    {"artifact": "org.scalameta:io_2.12:4.1.6", "lang": "java", "sha1": "b7aa0c103a59aa97fa1d273e56089621526d0d22", "sha256": "296e593460f5f700c01589dc717b35d44d6474d8f30c005bf6e7b13bbc5b9734", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scalameta/io_2.12/4.1.6/io_2.12-4.1.6.jar", "source": {"sha1": "f4da2f7b1f9ce2c86281c0fe8473e099e4073c5a", "sha256": "9d3ec1d68f6aed526b3956264f5223db95326608df71511c5b60db31e4e02ab6", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scalameta/io_2.12/4.1.6/io_2.12-4.1.6-sources.jar"} , "name": "org_scalameta_io_2_12", "actual": "@org_scalameta_io_2_12//jar", "bind": "jar/org/scalameta/io_2_12"},
    {"artifact": "org.scalameta:semanticdb-javac_2.12:4.1.6", "lang": "scala", "sha1": "d16dd9ca4aebaabe6f3887a15a0bc12e26f06e51", "sha256": "74456b658ee596ce56d817ebf1e9cbd0181a04e73596c5ff9c94b9c32d929ef6", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scalameta/semanticdb-javac_2.12/4.1.6/semanticdb-javac_2.12-4.1.6.jar", "source": {"sha1": "5383f4da130713de35bed96506fed0800bd8b4be", "sha256": "f2a593828ed76ee00a207a5e748c8b6f71dd464ccce5d64eddacd9b49d03f671", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scalameta/semanticdb-javac_2.12/4.1.6/semanticdb-javac_2.12-4.1.6-sources.jar"} , "name": "org_scalameta_semanticdb_javac_2_12", "actual": "@org_scalameta_semanticdb_javac_2_12//jar:file", "bind": "jar/org/scalameta/semanticdb_javac_2_12"},
    {"artifact": "org.scalameta:semanticdb_2.12:4.1.6", "lang": "java", "sha1": "38cdb3c7664b86ef54b414b53c4d80cf02a3b508", "sha256": "201fa1f10778e5b9c69ab9d524ca795be4f08e179506ae2ad7a8dcc6efeeb5cb", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scalameta/semanticdb_2.12/4.1.6/semanticdb_2.12-4.1.6.jar", "source": {"sha1": "39aaf6f189e7fa185001eff68d0b24d10e54e80c", "sha256": "6d9932d7830516f903ed2ff9cc6bf5af0e99b22b502014469a2b420e92fa596a", "repository": "http://central.maven.org/maven2/", "url": "http://central.maven.org/maven2/org/scalameta/semanticdb_2.12/4.1.6/semanticdb_2.12-4.1.6-sources.jar"} , "name": "org_scalameta_semanticdb_2_12", "actual": "@org_scalameta_semanticdb_2_12//jar", "bind": "jar/org/scalameta/semanticdb_2_12"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
