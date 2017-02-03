This repository holds dependencies to build old version of mapfishprint used in
mapfishapp webapp

`build.sh` script will launch compilation of mapfish print with java 7 SDK. This
script will only use dependencies from this repo.

You only need docker deamon.

```bash
./build.sh ~/git/mapfish-print
```

This will create a `build/` directory with `libs` sub-directory containing
generated jar files.

Then you can use print-standalone-2.1-SNAPSHOT.jar to provide print-lib dependency :

```diff
diff --git a/mapfishapp/pom.xml b/mapfishapp/pom.xml
index 9afedd1..1e6a5e6 100644
--- a/mapfishapp/pom.xml
+++ b/mapfishapp/pom.xml
@@ -92,6 +92,8 @@
     <dependency>
       <groupId>org.mapfish.print</groupId>
       <artifactId>print-lib</artifactId>
+      <scope>system</scope>
+      <systemPath>${env.HOME}/git/mapfish-print/build/libs/print-standalone-2.1-SNAPSHOT.jar</systemPath>
       <version>2.1.1</version>
     </dependency>
     <!-- geotools -->
```
