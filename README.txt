Avro README

Avro is a data serialization system.

Please build and read the documentation for more details.

REQUIREMENTS

The following packages must be installed before Avro can be built:

 - Java: JDK 1.6
 - Python: 2.5 or greater
 - C: gcc, automake, libtool, libapr1-dev, libaprutil1-dev, doxygen
 - C++: g++, flex, bison, libboost-dev
 - Apache Ant 1.7
 - Apache Forrest 0.8 (for documentation, requires Java 1.5)

BUILDING

One the requirements are installed, Ant can be used as follows:

 'ant javadoc' builds Java API documentation to build/doc/api
 'ant doc' builds Avro specification document in build/doc/spec.html
 'ant test' runs tests in src/test
 'ant jar' creates a jar in build/avro-X.X.jar
 'ant tar' makes a "release" with docs, jar, src, etc. in build/avro-X.X.tar.gz
 'ant clean' removes all generated artifacts

USING ECLIPSE

To use Eclipse, use the "ant eclipse" target to trigger generating a .classpath
file, and also trigger compilation (to pull in the maven dependencies, etc.)
You must also make sure that your avro checkout directory is "avro".  You
should then be able to create an Eclipse project pointed to your checkout, and
run the unit tests from Eclipse's runner.

Note that the "Eclipse Builder" is configured to compile twice: once with
Eclipse's built-in compiler, and another time with ant.  Eclipse is happier
this way, though the classpath is configured to ignore Eclipse's compilation.
